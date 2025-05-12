# chez-bootstrap.ps1

# Ensure chezmoi is available
if (-not (Get-Command chezmoi -ErrorAction SilentlyContinue)) {
    Write-Error "❌ Chezmoi not found. Please install it first."
    exit 1
}

# Optional: set working directory to home
Set-Location $HOME

# Get hostname using system call
$hostname = (& hostname.exe).Trim()
Write-Host "🔍 Detected hostname: $hostname"

# Pull latest changes from Git
Write-Host "📥 Pulling dotfiles from Git..."
chezmoi git pull

# Re-apply the correct configs (shared + host-specific)
Write-Host "🔧 Applying config for $hostname..."
chezmoi apply

# Check for updates (optional)
Write-Host "🔄 Checking for chezmoi changes..."
chezmoi update

Write-Host "✅ Chezmoi bootstrap complete." -ForegroundColor Green
