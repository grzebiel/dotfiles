# my dotfiles

## Used programs

* Bar: ```i3pystatus```
* Browser: ```firefox```
* Editor: ```vim```
* PDF viewer: ```zathura```
* Terminal emulator: ```terminator```
* Wm: ```i3```
* File Browser: `ranger`
    * support img preview in ranger: w3m

## Fonts

* Terminal: ```adobe-source-code-pro-fonts```
* Symbols: ```fonts-awesome```

## Tools
**drbash** - wrapper for docker run that automaticly mounts current dir in `/localMount` and passes common flags
**worktime** - python script maintains worktime monitorring in `~/.worktime` used with i3lock and systemd

## Other dependencies

* [junegunn/fzf](https://github.com/junegunn/fzf)
* [Shougo/dein.vim](https://github.com/Shougo/dein.vim) - rest of plugins will install automaticly
* [bash_completion](https://github.com/scop/bash_completion)
* xorg-xdpyinfo - for termFromHere script
* fortune - form random quote in bash startup


## To load it using git bare repo:

```bash
git clone --bare git@github.com:grzebiel/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```

## installation

`misc/install` is the script to install all needed scripts and enabling all the required deamons (systemd). Requires to be installed as root systemd unit... otherwise it doesnt work

Currently systemd doesn't allow user services to depend on the system services. Therefore there is no way of trigger user service before suspend or after wakeup.

## Credentials
Following way of maintaining dotfiles was developed by [Nicola Paolucci](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
