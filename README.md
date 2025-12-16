# Snes9x Anylinux AppImages 🐧

### Build status

[![GitHub Downloads](https://img.shields.io/github/downloads/carlos-a-g-h/snes9x-anylinux-appimage/total?logo=github&label=GitHub%20Downloads)](https://github.com/carlos-a-g-h/snes9x-anylinux-appimage/releases/latest)

[![CI Build Status](https://github.com//carlos-a-g-h/snes9x-anylinux-appimage/actions/workflows/appimage.yml/badge.svg)](https://github.com/carlos-a-g-h/snes9x-anylinux-appimage/releases/latest)

* [Latest Stable Release](https://github.com/carlos-a-g-h/snes9x-anylinux-appimage/releases/latest)

### Internal scripts and programs

This AppImage has internal scripts and programs, that can be launched by calling them as commandline arguments

```
./Snes9x.AppImage [Program]
```

This table has the most important scripts and programs

| Program or script | Description |
|-|-|
| snes9x |Run CLI variant instead of the GTK variant |
| setup | An "installation" script for the appimage. It provides a nice config, a DESKTOP file in /usr/share/applications and an icon |
| details | Extracts the "details" directory from the AppImage |

## What is AnyLinux ?

This AppImage is made using [sharun](https://github.com/VHSgunzo/sharun), which makes it extremely easy to turn any binary into a portable package without using containers or similar tricks.

**These AppImages bundle everything and should work on any linux distro, even on musl based ones.**

This AppImage can work **without FUSE** at all thanks to the [uruntime](https://github.com/VHSgunzo/uruntime)

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)

<details>
  <summary><b><i>raison d'être</i></b></summary>
    <img src="https://github.com/user-attachments/assets/d40067a6-37d2-4784-927c-2c7f7cc6104b" alt="Inspiration Image">
  </a>
</details>

## About this AppImage

<details>
  <summary><b><i>I HAVE MY REASONS</i></b></summary>
    <img src="https://github.com/user-attachments/assets/8a3fd256-0fd4-4942-b9be-87abf7f6658d" alt="this-is-why" />
  </a>
</details>

The Snes9x official github repository already has appimages on their upstream, but these appimages do not run on older systems, and that is the reason why I made this repository
