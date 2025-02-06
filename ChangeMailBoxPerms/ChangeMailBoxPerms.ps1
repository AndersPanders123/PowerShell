
#Get every user in a 365 tenant   # Loop it for each user

Get-Mailbox -ResultSize Unlimited | ForEach-Object {
    # Store every Primary Smtp Address (Users email)
    $mailbox = $_.PrimarySmtpAddress
    # Sets permissions for the user's primary calender  # Default = All users  # Type of access every user gets
    Set-MailboxFolderPermission -Identity Default "$mailbox\Calendar" -User Default -AccessRights LimitedDetails
}

# Access Rights     # Description
# None              = No Access
# AvailabilityOnly  = Free/Busy status only
# LimitedDetails    = Free/Busy with status and location
# Reviewer          = Read ony access to full details
# Contributor       = Add items but not read
# Editor            = Read, Write and modify