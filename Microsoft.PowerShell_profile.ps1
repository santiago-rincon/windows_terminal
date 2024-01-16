# Ruta donde se debe copiar el archivo
# C:\Users\<usuario>\OneDrive\Documentos\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# -----------------------------------------------------------------------------------------#
# Cargar tema de Oh My Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\amro.omp.json" | Invoke-Expression
# Posibles temas 
# amro
# space
# -----------------------------------------------------------------------------------------#

# -----------------------------------------------------------------------------------------#
# Importar módulo de iconos en la terminal
Import-Module -Name Terminal-Icons
# -----------------------------------------------------------------------------------------#

# -----------------------------------------------------------------------------------------#
# Eliminación de algunos alias por defecto
if(Get-Alias -Name cat -ErrorAction SilentlyContinue){
  Del alias:cat
}
if(Get-Alias -Name diff -ErrorAction SilentlyContinue){
  Del alias:diff -Force
}
if(Get-Alias -Name wget -ErrorAction SilentlyContinue){
  Del alias:wget
}
if(Get-Alias -Name curl -ErrorAction SilentlyContinue){
  Del alias:curl
}
# -----------------------------------------------------------------------------------------#

# -----------------------------------------------------------------------------------------#

# Creacion de alias
New-Alias -Name cat -Value bat
# -----------------------------------------------------------------------------------------#

# -----------------------------------------------------------------------------------------#
# Import the Chocolatey Profile that contains the necessary code to enable tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
# -----------------------------------------------------------------------------------------#

# -----------------------------------------------------------------------------------------#
#FUNCTIONS
# Compile application in ionic for android and ios
function Compile-Ionic{
  param([ValidateSet("android", "ios")] [string]$system)
  ionic build --prod ;
  ionic cap copy;
  ionic cap sync;
  ionic cap open $system;
}
# -----------------------------------------------------------------------------------------#