$CurrentDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$PrepScript = Join-Path $CurrentDirectory "bk_win_prep.ps1"
Invoke-Expression $PrepScript

Write-Output "+++ bundle exec rake"
bundle exec rake spec:unit
if (-not $?) { throw "Chef unit tests failing." }
bundle exec rake component_specs --trace
if (-not $?) { throw "Chef component specs failing." }
