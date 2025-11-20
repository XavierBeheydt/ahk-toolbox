# ahk-toolbox

Collection of useful AutoHotkey (AHK) scripts to automate common desktop workflows and gaming setups.

## Overview

This repository contains a main manager script (`Main.ahk`) that runs in the background and automatically detects when specific games are launched. Upon detection, it performs setup tasks (like window positioning, OBS hotkeys) and launches game-specific helper scripts.

## Prerequisites

- [AutoHotkey v2.0](https://www.autohotkey.com/v2/) or later.

## Usage

1. Clone this repository.
2. Run `scripts/Main.ahk` to start manually.
3. (Optional) Run `utils/Install.ahk` or `utils/Install.ps1` to add `Main.ahk` to Windows Startup (Registry).

## Features

### Global
- **Mouse Mapping**: Swaps `XButton1` (Back) and `XButton2` (Forward) globally.

### Game Manager (`Main.ahk`)
- **Automatic Detection**: Monitors for the following games:
  - DayZ
  - Red Dead Redemption 2 (RDR2)
  - Road to Vostok
  - Rust
- **Window Management**: Sets the game window to "Always On Top" when detected.
- **OBS Integration**: Sends `Ctrl + Alt + Y` when a game starts (useful for toggling sources or recording).
- **Lifecycle Management**: Automatically launches and closes game-specific scripts.

### Game Specific Scripts

#### DayZ (`DayZ.ahk`)
- **Leaning**: Maps mouse side buttons to lean keys:
  - `XButton1` -> `E`
  - `XButton2` -> `Q`
- **Auto-Reload**: Reloads script every minute to maintain stability.

#### Rust (`Rust.ahk`) & Road to Vostok (`RoadToVostok.ahk`)
- **Window Positioning**: Automatically moves and resizes the game window to a specific layout (`1271, -31, 2576, 1479`).
- **Auto-Reload**: Reloads script every minute.

#### RDR2 (`RDR2.ahk`)
- Basic monitoring and lifecycle management (placeholder for future hotkeys).

