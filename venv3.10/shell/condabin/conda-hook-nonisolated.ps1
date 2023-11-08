$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
$Env:_CONDA_ROOT = "$scriptPath/../.."
$Env:CONDA_EXE = "$Env:_CONDA_ROOT/condabin/conda"
$Env:_CE_M = ""
$Env:_CE_CONDA = ""
$Env:_CONDA_EXE = "$Env:_CONDA_ROOT/condabin/conda"

# Fix PATH - stupid, but works
$Env:PATH = "$Env:_CONDA_ROOT;$Env:_CONDA_ROOT/Scripts;$Env:_CONDA_ROOT/Library/mingw-w64/bin;$Env:_CONDA_ROOT/Library/usr/bin;$Env:_CONDA_ROOT/Library/bin;$Env:_CONDA_ROOT/bin;$Env:_CONDA_ROOT/condabin;$Env:PATH;"

# We have omitted %PATH% at the end. We want fully isolated Win PATH if possible.
# E.g. Intel compiler (tools) on path interfere /w numba precompilation of sun_geometry causing SDAT to crash.

$CondaModuleArgs = @{ChangePs1 = $True}
Import-Module "$Env:_CONDA_ROOT/shell/condabin/Conda.psm1" -ArgumentList $CondaModuleArgs
Remove-Variable CondaModuleArgs
Add-CondaEnvironmentToPrompt
