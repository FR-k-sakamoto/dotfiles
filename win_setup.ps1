# win_setup.ps1
# Set up a symbolic link for the entire WezTerm config directory from Windows to WSL
# This ensures that 'require' works correctly for modules like keybinds.lua

$errorActionPreference = "Stop"

# 1. Variables
$distroName = "Ubuntu" 

# Automatically get the WSL username
try {
    $wslUser = (wsl --distribution $distroName whoami).Trim()
} catch {
    $wslUser = "k_sakamoto" 
}

$dotfilesConfigDir = "\\wsl.localhost\$distroName\home\$wslUser\dotfiles\.config\wezterm"
$winConfigHome = Join-Path $env:USERPROFILE ".config"
$winConfigPath = Join-Path $winConfigHome "wezterm"

# 2. Check if WSL path exists
if (-not (Test-Path $dotfilesConfigDir)) {
    Write-Error "Could not find WezTerm config in WSL: $dotfilesConfigDir"
    exit 1
}

# 3. Create .config directory if it doesn't exist
if (-not (Test-Path $winConfigHome)) {
    New-Item -ItemType Directory -Path $winConfigHome
}

# 4. Cleanup old file link if exists
$oldFileLink = Join-Path $env:USERPROFILE ".wezterm.lua"
if (Test-Path $oldFileLink) {
    Write-Host "Removing old file link: $oldFileLink"
    Remove-Item $oldFileLink -Force
}

# 5. Create Symbolic Link for the directory
if (Test-Path $winConfigPath) {
    Write-Host "Backing up existing directory: $winConfigPath"
    if (Test-Path "$winConfigPath.bak") { Remove-Item "$winConfigPath.bak" -Recurse -Force }
    Move-Item $winConfigPath "$winConfigPath.bak" -Force
}

Write-Host "Creating symbolic link: $winConfigPath -> $dotfilesConfigDir"
New-Item -ItemType SymbolicLink -Path $winConfigPath -Value $dotfilesConfigDir

Write-Host "`nSetup complete!"
Write-Host "Please restart WezTerm."
