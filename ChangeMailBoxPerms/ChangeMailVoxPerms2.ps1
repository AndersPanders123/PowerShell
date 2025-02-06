Get-Mailbox -ResultSize Unlimited | ForEach-Object {
    $mailbox = $_.PrimarySmtpAddress
    $calendarIdentity = "$mailbox\Calendar"  # Correct Identity format

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
