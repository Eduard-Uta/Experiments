$targetDirectories = @("C:\Users\edi\Downloads", "C:\ws2\Download", "C:\Users\edi\Desktop\TemporaryStuff")
$logOutputPath = "C:\Users\edi\Desktop\TemporaryStuff"

$items = @()

foreach($dir in $targetDirectories)
{
    $items += Get-ChildItem -Path $dir | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)}
}

$deletedItems = ""
foreach($item in $items)
{
    $deletedItems += $item.Name + "`n"
    Remove-Item $item.FullName -Force -Recurse
}

$currentDate = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'

if ($deletedItems)
{
    $log = "The garbage files deleted today, $currentDate `n"
    $log += $deletedItems + "`n"
    $log += "-" * 100 + "`n"

    $log >> "$logOutputPath\GarbageDeletedFilesLog.txt"
}
