
#Get every user in a 365 tenant   # Loop it for each user

Get-Mailbox -ResultSize Unlimited | ForEach-Object {
    $mailbox = $_.PrimarySmtpAddress
    $calendarIdentity = "$mailbox\Kalender"  # Correct Identity format

    # Check if Default permissions already exist
    $existingPermission = Get-MailboxFolderPermission -Identity $calendarIdentity -ErrorAction SilentlyContinue |
                            Where-Object { $_.User -eq "Default" }

    if ($existingPermission) {
        # Modify existing permission
        Set-MailboxFolderPermission -Identity $calendarIdentity -User Default -AccessRights LimitedDetails -Confirm:$false
    } else {
        # Add new permission
        Add-MailboxFolderPermission -Identity $calendarIdentity -User Default -AccessRights LimitedDetails -Confirm:$false
    }
}


# Access Rights     # Description
# None              = No Access
# AvailabilityOnly  = Free/Busy status only
# LimitedDetails    = Free/Busy with status and location
# Reviewer          = Read ony access to full details
# Contributor       = Add items but not read
# Editor            = Read, Write and modify