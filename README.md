# Nixconf

![Some screenshots of the config in use on my desktop](assets/screenshots/pan.webp)

## Applications

- Text Editor: [Zed](https://zed.dev)
- Browser: [Librewolf](https://librewolf.net)
- Terminal Emulator: [Kitty](https://sw.kovidgoyal.net/kitty/)
- Music Player: [Amberol](https://apps.gnome.org/Amberol/)

## Theme

Currently just using [Catppuccin](https://catppuccin.com/) wherever possible. I'm using
[Stylus](https://addons.mozilla.org/en-US/firefox/addon/styl-us/) and the
[userstyles](https://userstyles.catppuccin.com/getting-started/introduction/) to style some web
applications and sites like GitHub or YouTube.

Bootstrapped and inspired by [Vimjoyer](https://youtu.be/aNgujRXDTdE).

## Wallpapers

I made the Augustine wallpaper. Feel free to take it. The rest are all yoinked from various GitHub
repositories.

## Boilerplate

Generate a new module with the following commands:

```sh
boilerplate host my-host
boilerplate feature my-feature
boilerplate layer my-layer
boilerplate package my-package
```

## Templates

I've found myself copying a lot of nix files from one project to the next. I'd like to reduce the
amount of time I spend doing this, so I'm just going to be making reusable nix flake templates. 
These are defined in the `templates` directory and exposed in `modules/templates.nix`. They're
separated like that for both cleanliness and to avoid funkiness with `import-tree`.

You can use my templates like so (using my generic flake for example):

```sh
nix flake init -t github:jackjohn7/nixconf#generic
```

### Generic

My _generic_ template is just a basic flake following the
[dendritic pattern](https://dendrix.oeiuwq.com/Dendritic.html) based on this repository itself.
I have also included the `boilerplate` package so that boilerplate for basic pieces can just be
generated instead of copied, pasted, and cleaned up.

If you find any bugs or want to enhance it, feel free to open a PR. I can't promise I'll accept
your change since I use it myself but you'll still have your own fork at the end of the day for
your own consumption.
