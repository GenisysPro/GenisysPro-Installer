Add-Type -AssemblyName System.IO.Compression.FileSystem
$WC = New-Object System.Net.WebClient
'================================================================='
'|     Welcome to GenisysPro install script for Windows          |'
'================================================================='
sleep 1
Try{
  'Downloading GenisysPro...'
  $WC.DownloadFile("https://genisyspro.github.io/GenisysPro/GenisysPro.phar",".\GenisysPro.phar")
  'Done!'
  ''
  'Downloading PHP binaries...'
  $WC.DownloadFile("https://github.com/GenisysPro/GenisysPro/files/1184876/PHP-7.0.21-WinNT-x64.zip",".\php.zip")
  'Extracting PHP binaries...'
  [System.IO.Compression.ZipFile]::ExtractToDirectory(".\php.zip", ".\")
  'Deleting temporary files...'
  rm php.zip
  'Done!'
  ''
  'Downloading start-up scripts...'
  $WC.DownloadFile("https://raw.githubusercontent.com/GenisysPro/GenisysPro/master/start.cmd",".\start.cmd")
  $WC.DownloadFile("https://raw.githubusercontent.com/GenisysPro/GenisysPro/master/start.ps1",".\start.ps1")
  'Done!'
  ''
  if ([System.IntPtr]::Size -eq 4){
    'Downloading Visual C++ Redistributable for Visual Studio 2015 for 32-bit OS...'
    $WC.DownloadFile("https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x86.exe",".\vc_redist.exe")
  }
  else{
    'Downloading Visual C++ Redistributable for Visual Studio 2015 for 64-bit OS...'
    $WC.DownloadFile("https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe",".\vc_redist.exe")
  }
  'Visual C++ Redistributable for Visual Studio 2015 will be installed.'
  'When prompted, please select "Yes" in the User Account Control dialog box.'
  sleep 5
  'Installing Visual C++ Redistributable for Visual Studio 2015...'
  Start-Process .\vc_redist.exe -NoNewWindow -Wait -ArgumentList "/install /quiet"
  'Deleting temporary files...'
  rm vc_redist.exe
  'Done!'
  ''
}
Catch{
  'Something went wrong, please try again later.'
  sleep 5
  exit
}
'All done!'
'You can now start your server by running start.cmd or start.ps1.'

sleep 5
rm Windows-Installer.ps1
exit
