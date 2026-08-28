Step 3 — Priority text Compose

Select ke baad:

Compose

Rename:

Compose_Priority

Expression:

join(body('Select_Priority'), decodeUriComponent('%0A'))

Bas.

Iska output clean text hoga:

• MFOCRE | Update - New CHG is schedule on 5th Aug | Owner: Suraj | High | Active
• OCC | data | Owner: Suraj | High | Active
• MFCORE | Data | Owner: Suraj Phawade | Low | Active
Step 4 — Same cheez RITM ke liye

Select_RITM

From:

value

of RITM list.

Abhi mujhe tumhare RITM table ke exact columns nahi dikh rahe, isliye abhi guess mat karna.

Agar columns maan lo:

RITM
Description
Owner
Status

to map:

concat(
'• ',
item()?['RITM'],
' | ',
item()?['Description'],
' | Owner: ',
item()?['Owner'],
' | ',
item()?['Status']
)

Then:

Compose_RITM
join(body('Select_RITM'), decodeUriComponent('%0A'))
Step 5 — Mail

Same pattern:

List rows - Mail
        ↓
Select_Mail
        ↓
Compose_Mail

And:

join(body('Select_Mail'), decodeUriComponent('%0A'))
Step 6 — ETL

Ye important hai because tumhare ETL mein exactly 5 groups hain.

Tumhari tblETL:

Group	ETLUpdate
Group 1	WDORG...
Group 2	Salesforce...
Group 3	FBT...
Group 4	DW...
Group 5	Please Monitor

So ETL ke liye Select:

Select_ETL

From:

value

of List rows - ETL

Map:

Key:

text

Value:

concat(
'• ',
item()?['Group'],
' — ',
item()?['ETLUpdate']
)

Then:

Compose_ETL
join(body('Select_ETL'), decodeUriComponent('%0A'))
Ab tumhare paas 4 clean outputs honge
Compose_Priority
Compose_RITM
Compose_Mail
Compose_ETL

Ye clean strings hain.

Ab Adaptive Card banayenge.

Step 7 — Yahan sabse important change

Current action:

❌ Post card in a chat or channel

isko delete karo.

Add:

Microsoft Teams → Post adaptive card and wait for a response

Settings:

Post as

Flow bot

Post in

Chat with Flow bot

Recipient:

jis user ne /HO type kiya hai.

Step 8 — Card ka first version

Pehle hum display + edit card banayenge.

Adaptive Card:

{
  "type": "AdaptiveCard",
  "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
  "version": "1.3",
  "body": [
    {
      "type": "TextBlock",
      "text": "📋 HO Management",
      "size": "Large",
      "weight": "Bolder"
    },
    {
      "type": "TextBlock",
      "text": "Priority",
      "size": "Medium",
      "weight": "Bolder",
      "separator": true
    },
    {
      "type": "Input.Text",
      "id": "PriorityData",
      "value": "@{outputs('Compose_Priority')}",
      "isMultiline": true,
      "wrap": true
    },
    {
      "type": "TextBlock",
      "text": "RITM",
      "size": "Medium",
      "weight": "Bolder",
      "separator": true
    },
    {
      "type": "Input.Text",
      "id": "RITMData",
      "value": "@{outputs('Compose_RITM')}",
      "isMultiline": true,
      "wrap": true
    },
    {
      "type": "TextBlock",
      "text": "Mail",
      "size": "Medium",
      "weight": "Bolder",
      "separator": true
    },
    {
      "type": "Input.Text",
      "id": "MailData",
      "value": "@{outputs('Compose_Mail')}",
      "isMultiline": true,
      "wrap": true
    },
    {
      "type": "TextBlock",
      "text": "ETL",
      "size": "Medium",
      "weight": "Bolder",
      "separator": true
    },
    {
      "type": "Input.Text",
      "id": "ETLData",
      "value": "@{outputs('Compose_ETL')}",
      "isMultiline": true,
      "wrap": true
    },
    {
      "type": "ActionSet",
      "actions": [
        {
          "type": "Action.Submit",
          "title": "💾 Save HO Update",
          "data": {
            "action": "saveHO"
          }
        }
      ]
    }
  ]
}
Lekin abhi ye paste karke run mat karna.

Pehle Priority Select/Compose test karenge. Agar woh clean aa raha hai, phir RITM/Mail/ETL add kareng