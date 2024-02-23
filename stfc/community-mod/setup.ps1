#Requires -RunAsAdministrator
$game_path = "C:\Games\Star Trek Fleet Command\STFC\default\game"
if (-not (Test-Path $game_path\prime.exe)) {
    $game_path = Get-Childitem 'Path C:\prime.exe -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1 | Select-Object -ExpandProperty Directory
}
$sourcepath = $Script:PSScriptRoot
if ( -not (Test-Path $sourcepath\version.dll)) {
    $sourcepath = $PWD
}
elseif ( -not (Test-Path $sourcepath\version.dll)) {
}
else {
    New-Item -Path $game_path\version.dll -ItemType SymbolicLink -Value $sourcepath\version.dll -Force
    New-Item -Path $game_path\community_patch_settings.toml -ItemType SymbolicLink -Value $sourcepath\community_patch_settings.toml -Force
}
