$DateTime = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
echo $DateTime' You are runing UnzipAll version 1.0'
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
    RootFolder = "MyComputer"
    Description = "$Env:ComputerName - Select a folder"
}
$Null = $FolderBrowser.ShowDialog()
$DateTime = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
#echo $DateTime' '$FolderBrowser.SelectedPath
cd $FolderBrowser.SelectedPath
$list = ls
#$DateTime = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
#echo $DateTime' '[Name]$list
$namelist = echo [Name]$list
#$DateTime = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
#echo $DateTime' '$namelist
$arrnamelist = $namelist.Split(" ")
#$DateTime = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
#echo $DateTime' '$namelist.Split(" ")
foreach($itemname in $arrnamelist) {
    #$DateTime = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
    #echo $DateTime' '$itemname
    if($itemname.Contains('zip')) {
        #$DateTime = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
        #echo $DateTime' '$itemname
        Expand-Archive -LiteralPath $itemname
        Remove-Item –path $itemname -Force -Recurse
        #$DateTime = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
        #echo $DateTime' Unziped and removed '$itemname
    }
    else {
        #$DateTime = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
        #echo $DateTime' '$itemname'Its not a zip file'
    }
}
$DateTime = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
echo $DateTime' Done'