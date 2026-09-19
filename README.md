# minimal

A clean, fast and aesthetic LabWC rice built around Arch Linux, with a custom Wayland workflow and a focus on keeping things lightweight.

<p align="center">
  <img src="./screenshots/01.png" alt="minimal rice" width="900">
</p>

✦ Overview

minimal is my personal LabWC rice — simple, custom, and made to feel good to use every day.

The setup combines a lightweight Wayland compositor with a small set of carefully configured tools. The goal isn't to pile on effects or unnecessary components; it's to keep the desktop clean while still giving it its own visual identity.

Built on Arch Linux with the CachyOS kernel.

📸 Screenshots

<p align="center">
  <img src="./screenshots/01.png" alt="Desktop" width="48%">
  <img src="./screenshots/02.png" alt="SDDM" width="48%">
</p>

<p align="center">
  <img src="./screenshots/03.png" alt="Control and launcher" width="48%">
  <img src="./screenshots/04.png" alt="Wallpaper selector" width="48%">
</p>

⚙️ Stack

Component

Used for

LabWC

Wayland compositor

Waybar

Status bar

SwayNC

Notification center

Yazi

Terminal file manager

SDDM

Display manager

Rofi

Application launcher

CachyOS Linux

Custom/performance-oriented kernel

Arch Linux

Base system

🎨 The vibe

Minimal

Fast

Custom

Lightweight

Wayland-first

Clean UI

Keyboard-friendly workflow

No giant desktop environment required

Everything is configured to work together rather than looking like a collection of unrelated themes.

🗂️ What's included

This repository contains the configuration used for my LabWC setup, including:

.config/
├── labwc/
├── waybar/
├── swaync/
├── yazi/
└── rofi/

sddm/
└── theme/

The exact directory layout may change as the rice evolves.

🚀 Installation

Clone the repository:

git clone https://github.com/YOUR_USERNAME/minimal.git
cd minimal

Back up your existing configuration before installing anything.

Then copy the configurations you want into ~/.config/ or the appropriate system directory.

Important: This is a personal rice. Some paths, packages, scripts, wallpapers, fonts, or commands may need to be adjusted for your system.

🧩 Dependencies

You will generally want:

labwc
waybar
swaync
yazi
rofi
sddm

Plus the usual Wayland utilities and whatever optional applications your configuration references.

Package names and installation methods can vary between distributions, so check the official project pages above when setting things up.

🖥️ System

OS      : Arch Linux
Kernel  : CachyOS Linux
Session : Wayland
WM      : LabWC

🛠️ Customization

This rice is meant to be modified.

Change the colors, wallpapers, bar modules, launcher theme, notifications, keybinds, and scripts to make it your own. The configuration is intentionally kept readable so it can be used as a starting point rather than treated as a fixed theme.

📌 Notes

This setup is continuously changing. Things may break, move, or get replaced as I experiment with the rice.

If something doesn't work out of the box, check the configuration and paths before opening an issue.

❤️ Credits

This rice wouldn't exist without the projects that make the Linux desktop ecosystem so ridiculously customizable.

LabWC

Waybar

SwayNC

Yazi

SDDM

Rofi

CachyOS Linux

<p align="center">
  <i>minimal — less noise, more control.</i>
</p>
