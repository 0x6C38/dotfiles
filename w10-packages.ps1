## Native packager
# Add chocolatey provider
# Get-PackageProvider -Name chocolatey

# install-package firefox
# install-package vlc

## Choco
# Config monitor for 59hz on video profile
# Install choco as admin
# https://chocolatey.org/install
# Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# PowerShellGet / Gallery + Modules
# Install-Module -Name PowerShellGet -Force
# Install-Module -Name PSFzf

# choco install cmdermini -y #C:\tools\cmdermini\vendor\conemu-maximus5\ConEmu.xml # Laggs PC?
choco install sudo -y

choco install firefox -y
choco install youtube-dl -y
choco install vlc -y
choco install keepass.install -y

choco install rufus -y

choco install winrar -y
choco install totalcommander -y

choco install libreoffice-fresh -y

choco install vim -y
choco install neovim -y
choco install fzf -y

choco install anki -y

choco install virtualbox -y

# Development related
choco install git.install -y
choco install poshgit -y
choco install postman -y

# choco install awscli -y #Error

## .NET
choco install visualstudio2017community -y
choco install sql-server-express -y
choco install sql-server-management-studio -y

## Java & Scala
choco install maven -y
choco install sbt -y
choco install jdk8 -y
choco install jetbrainstoolbox -y
choco install androidstudio -y

## Databases
choco install postgresql -y
choco install pgadmin4 -y|

## JS
choco install nodejs -y
choco install visualstudiocode -y
npm -v
npm install -g serverless

choco install discord -y
choco install skype -y (requires c++ redistributable packages)

choco install utorrent -y --ignore-checksums

# Update all:
choco update all -y

# Remove package:
# choco uninstall packagename -y
