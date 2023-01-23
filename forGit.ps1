$Body = @{
    tenant = "tenant.saasit.com"
    username = "UN"
    password = "PW"
    role = "role"
}


$authCode = Invoke-RestMethod -Method 'POST' -Uri "https://tenant.saasit.com/api/rest/authentication/login" -Body $body



$headers = @{
    Authorization=$authCode  
    Content='application/json'
}

Write-Host "Automated Test Cases!"
$SubjectLine = Read-Host "Enter Incident Subject Line Here: "
$SymptomLine = Read-Host "Enter Incident Description Here: "

$incidentBody = "{
    'Subject': '$SubjectLine',
    'Symptom': '$SymptomLine',
    'Service': 'General Inquiry',
    'Category': 'General Inquiry',
    'ProfileLink': 'F700DD9C5E394AD9A544AFCC4BEF6CAC',
    'Status': 'Logged',
    'OwnerTeam': 'Support Services',
    'Owner': ''
}"

Invoke-RestMethod -Method 'POST' -Uri "https://tenant.saasit.com/api/odata/businessobject/incidents/" -Body $incidentBody -Headers $headers