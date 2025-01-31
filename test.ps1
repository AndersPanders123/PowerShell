function Greet {
    param (
        [string]$Name,
        [int]$Times
    )
    for ($i = 1; $i -le $Times; $i++){
        Write-host "Hello $Name"
    }
}

Greet -Name "Anders" -Times 3