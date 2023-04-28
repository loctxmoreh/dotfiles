# AwesomeWM config

## Goals
- Self-contained: work everywhere without the rest of this dotfiles repo
    - Lua-only
    - Only resort to shell script when Lua is inappropriate
- Tag-based workflow
- Floating is secondary, but still needed

## Dependencies
On Ubuntu/Debian, install `awesome` and `awesome-extra`

### Lua packages
- `tyrannical`: for tag management

## Materials
- To break down default `rc.lua` to different modules: [article](https://epsi-rns.github.io/desktop/2019/06/15/awesome-overview.html)

TODO
[ ] Design tags: names, keys, rules
[ ] Multi-monitor workflow
[ ] Set window title bar when floating, and turn off when tiling
[x] Assign normal executable name for flatpak apps
[x] Find out why new `$PATH`s are not appended
	- Need `~/.profile`
[x] How to autostart programs (background processes/daemons) at logins
[x] How to autostart ibus-daemon