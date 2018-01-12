## Changed passwords
# daniloparaitcollege@gmail.com
# danilouai

## Native packager
# Add chocolatey provider
# Get-PackageProvider -Name chocolatey

install-package firefox
install-package vlc

## Choco
# Install choco as admin
# https://chocolatey.org/install
# Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install firefox -y
choco install youtube-dl -y
choco install vlc -y
choco install keepass.install -y

choco install winrar -y

# Development related
choco install git.install -y
choco install postman -y

## .NET
choco install visualstudio2017community -y
choco install sql-server-express -y
choco install sql-server-management-studio -y

## Java & Scala
choco install sbt -y
choco install jdk8 -y
choco install jetbrainstoolbox -y
choco install androidstudio -y

## Databases
choco install postgresql -y
choco install pgadmin4 -y|


choco install discord -y
choco install skype -y (requires c++ redistributable packages)

choco install utorrent --ignore-checksums

# Update all:
choco update all -y

#Remove package:
choco uninstall nombre -y