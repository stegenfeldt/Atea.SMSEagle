#Adopted from example at http://www.smseagle.eu/code-samples/

param(
	[Parameter(Mandatory=$True)] [string] $SMSEagleIP,
	[string] $Message = "SCOM and SMS Eagle Checking In!",
	[Parameter(Mandatory=$True)] [string] $Receiver = "123456789",
	[string] $User = "admin",
	[string] $Password = "password"
)

$smseagleUrl = "http://$SMSEagleIP/index.php/jsonrpc/sms"

$header = @{"Content-Type"="text/plain"}

$jsonBody=@{method="sms.send_sms";params=@{login=$User;pass=$Password;to=$Receiver;message=$Message;flash=1}} | ConvertTo-Json -Compress

Invoke-RestMethod -Uri $smseagleUrl -Headers $header -Body $jsonBody -Method Post