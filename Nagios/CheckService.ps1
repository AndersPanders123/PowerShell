$ServiceName = 'NSClient++ Monitoring Agent'
$arrService = Get-Service -Name $ServiceName

while ($arrService.Status -ne 'Running')
{
    Start-Service $ServiceName
    Write-Host $arrService.Status
    Write-Host 'NSClient++ starting'
    Start-Sleep -Seconds 60
    $arrService.Refresh()
    if ($arrService.Status -eq 'Running')
    {
        Write-Host 'NSClient++ is now running'
    }    
}