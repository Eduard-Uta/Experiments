# source C:\ws2\Powershell
# target E:\backup

$currentDate = Get-Date -Format 'yyyy-MM-dd'

Get-ChildItem -Path "C:\ws2\Powershell" | `
    Where-Object {$_.LastWriteTime -ge (Get-Date).AddDays(-1)} | `
    Compress-Archive -DestinationPath "E:\backup\Powershell_ws_$currentDate.zip" -Update