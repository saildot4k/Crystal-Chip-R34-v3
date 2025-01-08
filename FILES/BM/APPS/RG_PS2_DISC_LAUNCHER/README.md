# Retro GEM Disc Launcher for PlayStation 2

This application launches PlayStation and PlayStation 2 game discs on your PlayStation 2 console and sets the Retro GEM Game ID accordingly, allowing per-game settings for all your physical games.

## Features

### For PlayStation game discs
- Sets Retro GEM Game ID.
- Adjusts the video mode of the console's PlayStation driver to match that of the inserted disc if necessary.

### For PlayStation 2 game discs
- Sets Retro GEM Game ID.
- Skips the PlayStation 2 logo check, allowing MechaPwn users to launch imports and master discs.

## Instructions

`disc-launcher.elf` can be run from a Memory Card (PS2), USB, or HDD. For a seamless experience, insert the disc before launching the application.

### Recommended setup for Free MCBoot users:
- Put `disc-launcher.elf` in the `APPS` folder on your Free MCBoot memory card.
- To enable video mode switching for imported PlayStation games, place `PS1VModeNeg.elf` in the same location.
- Go to `Free MCBoot Configurator` and select `Configure OSDSYS options...`
- Turn on `Skip Disc Boot` to prevent the console from auto-booting game discs when they are inserted.
- Configure the item `Launch disc` so that it points to `mc?:/APPS/disc-launcher.elf`.
- Return to the previous screen. Save CNF to `MC0` or `MC2` (depending on where your Free MCBoot memory card is located) and exit.
- To launch a game, simply insert the game disc, then select `Launch disc` from the Free MCBoot menu. Alternatively, select `Launch disc` and then insert the game disc.

## Notes

The Disc Launcher checks the region of both the PlayStation game disc and the console. If a mismatch is found (e.g., a PAL game in an NTSC console), then PS1VModeNeg is launched to adjust the video mode of the PlayStation driver. If no mismatch is found, the game is launched normally. PS1VModeNeg can be downloaded [here](https://github.com/ps2homebrew/PS1VModeNeg). `PS1VModeNeg.elf` should be placed in the same location as `disc-launcher.elf` (either on Memory Card (PS2), USB, or HDD). If `PS1VModeNeg.elf` is not found, then all PlayStation games will be launched normally.

## Credits

Written by [CosmicScale](https://github.com/CosmicScale)  
Uses Game ID code based on the [AppCakeLtd](https://github.com/AppCakeLtd) [gameid-with-gem](https://github.com/AppCakeLtd/Open-PS2-Loader/tree/gameid-with-gem) fork of Open-PS2-Loader.  
Also uses code modified from [PS1VModeNeg](https://github.com/ps2homebrew/PS1VModeNeg) and [wLaunchELF](https://github.com/ps2homebrew/wLaunchELF)