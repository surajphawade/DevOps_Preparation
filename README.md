# HO Management – Microsoft Teams + Power Automate + Excel

A reusable starter design for a Teams-based Wealth Handover (HO) management application.

## Goal

User types `/HO` in Teams.

Power Automate:
1. Reads the latest data from four Excel tables.
2. Builds a clean Adaptive Card.
3. Posts the current HO status.
4. User selects an edit operation.
5. A dedicated edit card collects the change.
6. Power Automate updates the correct Excel table/row.
7. A confirmation card is returned.

### Architecture

Teams
→ `/HO`
→ `HO - Open`
→ Excel: Priority + RITM + Mail + ETL
→ HO View Card

Edit action
→ dedicated update flow
→ Excel update
→ confirmation

## Important security rule

Do NOT publish your real:
- SharePoint site URL
- tenant URL
- Team/channel IDs
- Excel file URLs
- user email addresses
- incident/customer data
- connector connection IDs
- exported Power Automate package containing secrets

Use placeholders such as `YOUR_SITE`, `YOUR_FILE`, `YOUR_TEAM`, `YOUR_CHANNEL`.

## Recommended Excel tables

### tblPriority

| Column | Purpose |
|---|---|
| ID | Unique ID such as P001 |
| Title | Priority title |
| Description | Priority description |
| Owner | Owner |
| Priority | High/Medium/Low |
| Status | Active/Closed |
| CreatedBy | Creator |
| CreatedDate | Created timestamp |
| ModifiedBy | Last editor |
| ModifiedDate | Last modified timestamp |

### tblRITM

Use this minimum structure and adjust to your existing RITM sheet:

| Column | Purpose |
|---|---|
| ID | Unique ID |
| RITM | RITM number |
| Description | Description |
| Owner | Owner |
| Status | Pending/Completed/Closed |
| CreatedBy | Creator |
| CreatedDate | Created timestamp |
| ModifiedBy | Last editor |
| ModifiedDate | Last modified timestamp |

### tblMail

Use this minimum structure and adjust to your existing Mail sheet:

| Column | Purpose |
|---|---|
| ID | Unique ID |
| Subject | Mail/follow-up subject |
| Description | Follow-up text |
| Owner | Owner |
| Status | Open/Closed |
| CreatedBy | Creator |
| CreatedDate | Created timestamp |
| ModifiedBy | Last editor |
| ModifiedDate | Last modified timestamp |

### tblETL

Already aligned with the current design:

| Group | ETLUpdate | ModifiedBy | ModifiedDate |
|---|---|---|---|
| Group 1 | ... | ... | ... |
| Group 2 | ... | ... | ... |
| Group 3 | ... | ... | ... |
| Group 4 | ... | ... | ... |
| Group 5 | ... | ... | ... |

---

# Phase 1 – Build the flows

## Flow 1: HO - Open

Purpose: show the latest HO status.

### Trigger

Use the Teams trigger/command mechanism already available in your environment for `/HO`.

If you are testing before the command trigger is ready, use:
**Manually trigger a flow**.

### Actions

1. `List rows present in a table - Priority`
2. `List rows present in a table - RITM`
3. `List rows present in a table - Mail`
4. `List rows present in a table - ETL`
5. `Compose - Build HO View Card`
6. `Post adaptive card in a chat or channel`

For an interactive card, use the Microsoft Teams action whose name includes:
**and wait for a response**.

Microsoft documents that Action.Submit requires the wait-for-response Teams action to collect the response in Power Automate.

### Excel configuration

All four actions must point to the same SharePoint site/file used by your HO workbook.

Do not use `Apply to each` for the four list-row actions unless your connector automatically creates one because of an array input.

---

# Phase 2 – View card

Start with the static card in `cards/HO_View_Static.json`.

Once that renders correctly, replace the sample values with dynamic Power Automate values.

## Dynamic strategy

Do NOT dump an Excel array directly into a TextBlock.

Bad:

```text
TextBlock.text = outputs('List_rows...')
```

That produces raw JSON/array text.

Good:

```text
Excel rows
→ Select/Filter/Compose
→ individual display objects
→ Adaptive Card TextBlocks/Containers
```

Microsoft's current Power Automate guidance also recommends simple blocks of data rather than complex table arrays for Adaptive Cards.

---

# Phase 3 – ETL update

Flow: `HO - ETL Update`

### Card

Use `cards/HO_Edit_ETL.json`.

Inputs:
- `etlGroup`
- `etlUpdate`

### Power Automate logic

1. `Post adaptive card ... and wait for a response`
2. Read response:
   - `etlGroup`
   - `etlUpdate`
3. `List rows present in a table - ETL`
4. `Filter array - Find selected group`
5. `Update a row`
6. `Post confirmation`

### Filter array expression

Assuming the list action is named `List_ETL`:

```text
@equals(item()?['Group'], outputs('ETL_Group'))
```

If the submitted group is stored directly from the card response:

```text
@equals(item()?['Group'], body('Post_adaptive_card_and_wait_for_a_response')?['data']?['etlGroup'])
```

Use the actual dynamic content path exposed by your Teams action if it differs.

### Important

The Excel `Group` values must exactly match:

```text
Group 1
Group 2
Group 3
Group 4
Group 5
```

---

# Phase 4 – Priority

Flow: `HO - Priority`

Use two operations:

- `addPriority`
- `editPriority`

The card sends an `action` value so one flow can branch.

Example:

```text
action = addPriority
```

or

```text
action = editPriority
```

Use a `Switch` action on `action`.

### Add

1. Receive card response.
2. Generate a unique ID.
3. Add row to `tblPriority`.
4. Set CreatedBy/CreatedDate.
5. Return confirmation.

### Edit

1. Receive ID.
2. List rows from `tblPriority`.
3. Find row where ID equals submitted ID.
4. Update that row.
5. Set ModifiedBy/ModifiedDate.
6. Return confirmation.

---

# Phase 5 – RITM

Flow: `HO - RITM`

Same pattern as Priority.

Recommended actions:
- `addRITM`
- `editRITM`
- `closeRITM`

Use a Switch on `action`.

---

# Phase 6 – Mail

Flow: `HO - Mail`

Recommended actions:
- `addMail`
- `editMail`
- `closeMail`

Use the same Switch pattern.

---

# Power Automate expressions

## Current timestamp

Use:

```text
utcNow()
```

## Convert timestamp to India time

```text
convertTimeZone(utcNow(),'UTC','India Standard Time','dd-MMM-yyyy HH:mm')
```

## Example ModifiedDate

```text
convertTimeZone(utcNow(),'UTC','India Standard Time','yyyy-MM-dd HH:mm:ss')
```

## Safe text

For optional text:

```text
coalesce(body('Post_adaptive_card_and_wait_for_a_response')?['etlUpdate'],'')
```

## Find ETL row

```text
@equals(item()?['Group'], body('Post_adaptive_card_and_wait_for_a_response')?['etlGroup'])
```

---

# Suggested unique ID strategy

For a quick implementation:

Priority:

```text
concat('P-',formatDateTime(utcNow(),'yyyyMMddHHmmss'))
```

RITM:

```text
concat('R-',formatDateTime(utcNow(),'yyyyMMddHHmmss'))
```

Mail:

```text
concat('M-',formatDateTime(utcNow(),'yyyyMMddHHmmss'))
```

For a production-grade implementation, use a dedicated ID/counter strategy or GUID.

GUID option:

```text
guid()
```

---

# Card interaction model

## Main HO card

Prefer:
- display data
- buttons to open/edit sections
- refresh/view operation

## Edit cards

Use:
- Input.Text
- Input.ChoiceSet
- Input.Date where useful
- Action.Submit
- wait-for-response Teams action

This keeps the main HO card readable.

---

# Why we are not making one giant editable card

A single giant form creates several problems:
- stale data
- accidental overwrites
- concurrency issues
- huge JSON
- difficult debugging
- difficult Excel updates
- Teams Adaptive Card size/rendering constraints

Instead:

```text
HO View
  ├── Edit Priority
  ├── Edit RITM
  ├── Edit Mail
  └── Edit ETL
```

This is much easier to maintain.

---

# Test order

Do not build everything at once.

## Test 1

Static HO card only.

Expected:

```text
WEALTH HANDOVER
Priority
RITM
Mail
ETL
```

## Test 2

Dynamic ETL display.

Expected:

```text
Group 1 → current Excel value
Group 2 → current Excel value
...
Group 5 → current Excel value
```

## Test 3

ETL edit.

Change Group 2.

Expected:
Excel Group 2 changes.

## Test 4

Priority add.

Expected:
new row in tblPriority.

## Test 5

Priority edit.

Expected:
same row changes; no duplicate row.

## Test 6

RITM add/edit.

## Test 7

Mail add/edit.

## Test 8

Full `/HO` test.

---

# Known Teams limitation

An Adaptive Card posted with a normal "Post card in a chat or channel" action is not the right action for collecting Action.Submit responses in Power Automate.

For interactive forms, use the Teams action that posts an adaptive card **and waits for a response**.

Microsoft also notes that a wait-for-response card is submitted once; subsequent submissions to that same card are ignored.

Therefore, the recommended design is:
- `/HO` creates a fresh view card.
- Editing opens a fresh edit card.
- Save creates a new confirmation/view response.

---

# Public GitHub checklist

Before pushing:

- [ ] Remove tenant URL
- [ ] Remove SharePoint URL
- [ ] Remove Team ID
- [ ] Remove Channel ID
- [ ] Remove emails
- [ ] Remove customer/project-sensitive data
- [ ] Remove Power Automate export package if it contains connection references
- [ ] Replace real Excel file name with placeholder
- [ ] Use sample data only
- [ ] Add LICENSE
- [ ] Add README
- [ ] Add screenshots only if they contain no company/customer information

