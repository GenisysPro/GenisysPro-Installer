Add-Type -AssemblyName System.IO.Compression.FileSystem
$WC = New-Object System.Net.WebClient
'================================================================='
'|     Welcome to GenisysPro install script for Windows          |'
'| We strong suggest you use Linux instead of Microsoft Windows  |'
'================================================================='
sleep 1
Try{
'Downloading GenisysPro...'
$WC.DownloadFile("https://gitlab.com/GenisysPro/GenisysPro/builds/artifacts/master/download?job=phar",".\GenisysPro.zip")
'Extracting GenisysPro...'
[System.IO.Compression.ZipFile]::ExtractToDirectory(".\GenisysPro.zip", ".\")
'Deleting temporary files...'
rm GenisysPro.zip
'Done!'
'Downloading PHP runtime...'
$WC.DownloadFile("https://storage.googleapis.com/itx-technologies-141911.appspot.com/php_for_genisys%2Fphp_windows_x64_7.0.17.zip",".\php.zip")
'Extracting...'
[System.IO.Compression.ZipFile]::ExtractToDirectory(".\php.zip", ".\")
'Cleaning...'
rm php.zip
rm start.cmd
'Done!'
'Downloading start-up scripts...'
$WC.DownloadFile("https://raw.githubusercontent.com/GenisysPro/GenisysPro/master/start.cmd",".\start.cmd")
$WC.DownloadFile("https://raw.githubusercontent.com/GenisysPro/GenisysPro/master/start.ps1",".\start.ps1")
'Done!'
'Downloading　VS2012...'
$WC.DownloadFile("https://download.microsoft.com/download/C/A/F/CAF5E118-4803-4D68-B6B5-A1772903D119/VSU4/vcredist_x86.exe",".\vcredist_x86.exe")
'Done!'
}
Catch{
'Something went wrong, please restart this script later'
sleep 5
exit
}
'All have done! Run start.cmd for your new server!'
'If it said to be'
''
'/usr/bin/php/php.exe: error while loading shared libraries: MSVCR110.dll: cannot open shared object file: No such file or directory'
''
'please install vcredist_x86.exe.'

sleep 5
rm Windows-Installer.ps1
exit
