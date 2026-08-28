# Dynamic Adaptive Card pattern

Power Automate can generate Adaptive Card JSON, but avoid putting raw arrays into a TextBlock.

## Wrong

```json
{
  "type": "TextBlock",
  "text": "@{outputs('List_rows_present_in_a_table')}"
}
```

This can display raw JSON such as:

```text
[{"ID":"P001","Title":"MFOCRE",...}]
```

## Correct concept

Convert each row into a visual card element:

```json
{
  "type": "Container",
  "items": [
    {
      "type": "TextBlock",
      "text": "MFOCRE",
      "weight": "Bolder",
      "wrap": true
    },
    {
      "type": "TextBlock",
      "text": "Update - New CHG...",
      "wrap": true
    }
  ]
}
```

Then combine the element objects into the card `body`.

## Recommended v1

Because Priority is expected to be small, use a maximum of six visible priority slots initially.

For ETL, use five fixed groups.

This makes the first implementation easy to test and avoids complicated array-to-card transformations.

## Recommended v2

Later replace fixed slots with a generated card-element array:

```text
Excel rows
→ Select
→ JSON string of card elements
→ json(...)
→ insert into card body
```

Keep the v1 stable before introducing this complexity.
