# Get calendar permissions for all user mailboxes
Get-Mailbox -RecipientTypeDetails UserMailbox -ResultSize Unlimited | ForEach-Object {
    $mailbox = $_.PrimarySmtpAddress
    $calendarIdentity = "$mailbox\Kalender"

    Write-Host "----------------------------------------"
    Write-Host "Mailbox: $($_.UserPrincipalName)"
    Write-Host "Calendar Identity: $calendarIdentity"

    try {
        $permissions = Get-MailboxFolderPermission -Identity $calendarIdentity -ErrorAction Stop
        foreach ($perm in $permissions) {
            Write-Host "User: $($perm.User) | AccessRights: $($perm.AccessRights)"
        }
    } catch {
        Write-Warning " Could not retrieve permissions for $calendarIdentity $($_.Exception.Message)"
    }
}
