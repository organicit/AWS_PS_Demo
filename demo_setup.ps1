Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


choco install -y git.install
choco install -y visualstudiocode

git config --global user.name "Eric Courville"
git config --global user.email  organicit-git@outlook.com