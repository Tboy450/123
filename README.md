# Roblox Project 123

A Roblox game project with GitHub integration for version control and seamless studio updates.

## Project Structure

```
/
├── src/                    # Source code
│   ├── server/            # Server-side scripts
│   ├── client/            # Client-side scripts
│   └── shared/            # Shared modules
├── assets/                # Game assets (models, images, etc.)
├── plugins/               # Roblox Studio plugins
│   └── GitHubSync/        # GitHub to Roblox sync plugin
├── build.rbxlx            # Main Roblox place file
├── aftman.toml            # Tool configuration
├── .gitignore             # Git ignore rules
├── github-sync.config.json # GitHub sync configuration
└── README.md              # This file
```

## Getting Started

### Prerequisites
- Roblox Studio installed
- Git installed (for manual syncing)
- Aftman installed (optional, for tool management)

### Installation

1. Clone this repository
2. Open `build.rbxlx` in Roblox Studio
3. Install the GitHub Sync plugin (see below)

## GitHub Sync Plugin

The GitHub Sync plugin automatically syncs scripts from this GitHub repository to Roblox Studio.

### How to Use

1. Go to **Plugins** → **GitHub Sync** in Roblox Studio
2. Click "Sync from GitHub" to pull the latest changes
3. Confirm the sync and wait for completion
4. Your scripts will be updated automatically!

### Configuration

Edit `github-sync.config.json` to customize:
- GitHub repository URL
- Branch to sync from
- Auto-sync interval
- Folders to sync

## File Structure Guidelines

### Server Scripts (`/src/server/`)
- Game logic
- Data management
- NPC behavior

### Client Scripts (`/src/client/`)
- UI/UX
- Player input handling
- Local rendering logic

### Shared Modules (`/src/shared/`)
- Utility functions
- Shared constants
- Reusable modules

## Version Control

### Committing Changes

```bash
git add .
git commit -m "Description of changes"
git push origin main
```

### Pulling Updates

Use the GitHub Sync plugin or:
```bash
git pull origin main
```

## Best Practices

1. **Use descriptive commit messages** - helps track changes
2. **Keep server/client/shared organized** - easier maintenance
3. **Comment your code** - especially for complex logic
4. **Use the sync plugin regularly** - stay up to date
5. **Create branches for features** - separate development from main

## Contributing

1. Create a new branch for your feature
2. Make your changes
3. Commit with clear messages
4. Push to GitHub
5. Create a Pull Request

## License

This project is under the MIT License (add your own if different)

## Support

For issues or questions, create an issue on GitHub!
