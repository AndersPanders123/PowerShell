$Mailboxes = Get-Mailbox -ResultSize Unlimited
ForEach ($Mailbox in $Mailboxes) {
   Remove-MailboxFolderPermission -Identity ($Mailbox.sAMAccountName+':\Calendar') -User Default -ErrorAction SilentlyContinue
   Add-MailboxFolderPermission -Identity ($Mailbox.sAMAccountName+':\Calendar') -User Default -AccessRights LimitedDetails
}