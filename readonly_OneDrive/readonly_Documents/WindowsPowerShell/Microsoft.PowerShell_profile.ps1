if (Get-Alias rm -ErrorAction SilentlyContinue) {
    Remove-Item Alias:rm
}
function goE { Set-Location E:\ }
function codeE { Set-Location E:\Programming }
function projects { Set-Location E:\Programming\projects }
function configme {
  vim "C:\Users\matte\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
}
function obsidian { Set-Location E:\Programming\projects\obsidian }
function obPush { 
	Set-Location E:\Programming\projects\obsidian
	git add .
	$msg = "sync notes $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
	git commit -m $msg
	git pull origin main --rebase
	git push origin main
}
function obPushL {
	Set-Location C:\Users\matte\obsidian-vault
	git add .
        $msg = "sync notes $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
	git commit -m $msg
	git pull origin main --rebase
	git push origin main
}
function obsidianL { Set-Location C:\Users\matte\obsidian-vault }
function projectsL { Set-Location C:\Users\matte\projects }
function wmConf { vim C:\Users\matte\.glzr\glazewm\config.yaml }

function newConf {
  Write-Host "Reloading Windows PowerShell profile..."
  . "$HOME\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

  Write-Host "Reloading PowerShell 7 profile..."
  . "$HOME\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

  Write-Host "✅ Both profiles reloaded."
}

function rm {
    param (
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$args
    )

    if (-not $args) {
        Write-Error "rm: missing operand"
        return
    }

    $recursive = $false
    $force = $false
    $targets = @()

    foreach ($arg in $args) {
        switch ($arg) {
            '-r' { $recursive = $true }
            '-f' { $force = $true }
            '-rf' { $recursive = $true; $force = $true }
            '-fr' { $recursive = $true; $force = $true }
            default { $targets += $arg }
        }
    }

    foreach ($target in $targets) {
        $params = @{
            Path = $target
        }
        if ($recursive) { $params['Recurse'] = $true }
        if ($force)     { $params['Force']   = $true }

        Remove-Item @params -ErrorAction SilentlyContinue
    }
}


function gConf { vim "$HOME\.gitconfig" }
function giConf { vim "$HOME\.gitignore_global" }
function gtConf { vim "$HOME\.git-templates" }
function bashConf { vim "$HOME\.bashrc" }
function wezConf { vim "$HOME\.wezterm.lua" }


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
