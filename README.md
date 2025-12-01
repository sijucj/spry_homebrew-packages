# homebrew-packages

Official Homebrew tap for Spry tools.

## Available Packages

| Package | Description |
|---------|-------------|
| `spry-runbook` | Spry Runbook CLI - A runbook execution tool |
| `spry-sqlpage` | Spry SQLPage CLI - A declarative web application framework |

## Installation

First, add the tap to Homebrew:

```bash
brew tap programmablemd/homebrew-packages
```

Then, install the desired package(s):

```bash
# Install Spry Runbook CLI
brew install spry-runbook

# Install Spry SQLPage CLI
brew install spry-sqlpage

# Or install both
brew install spry-runbook spry-sqlpage
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
