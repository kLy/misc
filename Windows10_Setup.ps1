# Description: Boxstarter Script
#
# Install boxstarter:

# Set-ExecutionPolicy RemoteSigned -Force
. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force

#
# Run this boxstarter by calling the following from an **elevated** command-prompt:
# 	start http://boxstarter.org/package/nr/url?<URL-TO-RAW-GIST>
# OR
# 	Install-BoxstarterPackage -PackageName <URL-TO-RAW-GIST> -DisableReboots
#
# Learn more: http://boxstarter.org/Learn/WebLauncher

Disable-UAC

New-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" DisableAntiSpyware -Value 1

Set-ItemProperty -Path HKCU:\System\GameConfigStore -Name GameDVR_Enabled -Type DWord -Value 0
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR -Name AllowGameDVR -Type DWord -Value 0

# Privacy: Let apps use my advertising ID: Disable
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0
# Privacy: SmartScreen Filter for Store Apps: Disable
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost -Name EnableWebContentEvaluation -Type DWord -Value 0

# Start Menu: Disable Bing Search Results
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 0

# Kill apps
Get-AppxPackage king.com.CandyCrushSaga | Remove-AppxPackage
Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage
Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage *Minecraft* | Remove-AppxPackage

#--- Windows Settings ---
Disable-BingSearch
Disable-GameBarTips

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LastActiveClick -Value 1

#--- Apps ---
#cinst cloneapp
cinst googlechrome
cinst sublimetext3
cinst itunes
cinst steam
cinst google-backup-and-sync
cinst adobereader
cinst adobereader-disable-updates-winconfig
cinst speccy
cinst nvidia-display-driver
cinst unity-hub
#cinst peazip
#cinst slack
#cinst youtube-dl
#cinst ffmpeg
#cinst rsync
#cinst nmap
#cinst hugo
#cinst paint.net
#cinst ugetdm
#cinst negativescreen
#cinst irfanView
#cinst xplorer2
#cinst handbrake
#cinst git

#--- Windows Subsystems/Features ---
choco install Microsoft-Windows-Subsystem-Linux -source windowsfeatures

#--- Restore Temporary Settings ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula

Rename-Computer -NewName Spectre
