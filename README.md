# homebrew-packages

Official Homebrew tap for Spry tools.

## Available Packages

| Package | Description |
|---------|-------------|
| `spry-runbook` | Spry Runbook CLI - A runbook execution tool |
| `spry-sqlpage` | Spry SQLPage CLI - A declarative web application framework |

## Installation

### Option 1: Install directly (without tapping)

```bash
brew install programmablemd/packages/spry-sqlpage
brew install programmablemd/packages/spry-runbook
```

### Option 2: Install from this tap

```bash
# Add the tap
brew tap programmablemd/homebrew-packages

# Install spry-runbook and spry-runbook
brew install spry-sqlpage spry-runbook

# Install spry-sqlpage
brew install spry-sqlpage

# Install spry-runbook
brew install spry-runbook
```

## Usage

After installation, you can run:

```bash
# Spry Runbook
spry-runbook --version

# Spry SQLPage
spry-sqlpage --version
```

## Updating

To update to the latest version:

```bash
brew update
brew upgrade spry-runbook spry-sqlpage
```

## Uninstalling

To remove the tools:

```bash
brew uninstall spry-runbook spry-sqlpage
```

To remove the tap:

```bash
brew untap programmablemd/homebrew-packages
```
