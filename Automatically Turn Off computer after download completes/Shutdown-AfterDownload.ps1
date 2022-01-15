$downloadDir = "C:\Users\edi\Downloads"

while (1) 
{
    (Get-ChildItem -Path $downloadDir).Refresh()
    $s1 = Get-ChildItem -Path $downloadDir | Measure-Object -Property Length -Sum | Select-Object Sum
    write-host $s1.Sum

    Start-Sleep -s 5

    (Get-ChildItem -Path $downloadDir).Refresh()
    $s2 = Get-ChildItem -Path $downloadDir | Measure-Object -Property Length -Sum | Select-Object Sum
    write-host $s2.Sum

    if ($s1.Sum -eq $s2.sum) 
    {
        write-host "Download completed, shutting down.."
        shutdown /s
    }

}