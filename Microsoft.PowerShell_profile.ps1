# Ruta donde se debe copiar el archivo
# C:\Users\<usuario>\OneDrive\Documentos\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# -----------------------------------------------------------------------------------------#
# Cargar tema de Oh My Posh
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\space.omp.json" | Invoke-Expression
# Posibles temas 
# amro
# space

# Cargar startship
Invoke-Expression (&starship init powershell)

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

# Docker variable format
New-Item -Path Env:DOCKER_FORMAT -Value "ID:\t{{.ID}}\nName\t{{.Names}}\nPort\t{{.Ports}}\nStatus\t{{.Status}}\nCommand\t{{.Command}}\nCreated\t{{.CreatedAt}}\nSize\t{{.Size}}\nNet\t{{.Networks}}\n" | Out-Null

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

# Función para iniciar el servicio de mariadb instalado mediante Xampp
function MariadbStart {
  mysqld --defaults-file=C:\xampp\mysql\bin\my.ini --standalone --console
}
# -----------------------------------------------------------------------------------------#