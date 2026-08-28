concat(
'• ',
item()?['Title'],
' | ',
item()?['Description'],
' | Owner: ',
item()?['Owner'],
' | ',
item()?['Priority'],
' | ',
item()?['Status']
)