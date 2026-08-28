# Power Automate build order

## 0. Prerequisites

- SharePoint workbook is ready.
- Each Excel range is formatted as an Excel Table.
- Tables have stable column names.
- Power Automate account has access to the workbook.
- Microsoft Teams Workflows/Power Automate integration is available.

## 1. Build `HO - Open`

Actions:

1. Teams trigger for `/HO` (or Manually trigger for first test).
2. Excel – List rows `tblPriority`.
3. Excel – List rows `tblRITM`.
4. Excel – List rows `tblMail`.
5. Excel – List rows `tblETL`.
6. Compose – `Build_HO_Card`.
7. Teams – Post adaptive card **and wait for a response**.

Start by hard-coding the static card from `cards/HO_View_Static.json`.
Do not make the card dynamic until the static card renders successfully.

## 2. Build `HO - ETL Update`

1. Teams – Post `cards/HO_Edit_ETL.json` and wait for response.
2. Excel – List rows from `tblETL`.
3. Filter array.
4. Update row.
5. Teams – confirmation.

### Filter array

```text
@equals(
  item()?['Group'],
  body('Post_adaptive_card_and_wait_for_a_response')?['etlGroup']
)
```

If your action exposes a different response property, use the dynamic content token from that action instead.

### Update row

Use the key column `Group`.

- Key column: `Group`
- Key value: submitted `etlGroup`
- ETLUpdate: submitted `etlUpdate`
- ModifiedBy: submitting user's display name
- ModifiedDate: `convertTimeZone(utcNow(),'UTC','India Standard Time','yyyy-MM-dd HH:mm:ss')`

## 3. Build Priority

Use `HO_Edit_Priority_Add.json` for add.

For edit, first show/select the Priority ID, then use `HO_Edit_Priority_Edit.json`.

Recommended Switch:

```text
Switch(action)
  addPriority
  editPriority
```

## 4. Build RITM

Recommended Switch:

```text
Switch(action)
  addRITM
  editRITM
  closeRITM
```

## 5. Build Mail

Recommended Switch:

```text
Switch(action)
  addMail
  editMail
  closeMail
```

## 6. Dynamic HO view

Once all write operations work, make the view card dynamic.

Recommended approach:

- Create a Select action for each section.
- Transform each Excel row into a small display object.
- Build the visual card from those small objects.
- Never put the raw Excel array inside a TextBlock.

For a first version with a known small maximum number of priority records, fixed slots are acceptable. For a scalable version, generate a JSON array of card elements and use `json()` to convert it before passing it to the Teams action.

## 7. Concurrency

The main view should be treated as a snapshot.

After saving an edit:
- update Excel
- return confirmation
- allow user to request a fresh `/HO`

Do not keep one long-running shared card open for hours.

## 8. Error handling

Add a Scope:

```text
TRY
  Read / validate
  Update Excel
  Confirmation

CATCH
  Post a clear error card
```

Useful error message:

```text
❌ HO update failed

Section: ETL
Item: Group 2

Please retry. If the issue continues, check the Excel table/permissions.
```

## 9. Validation

Before Excel update, validate required fields.

Example condition:

```text
@not(empty(body('Post_adaptive_card_and_wait_for_a_response')?['etlUpdate']))
```

For a required group:

```text
@not(empty(body('Post_adaptive_card_and_wait_for_a_response')?['etlGroup']))
```
