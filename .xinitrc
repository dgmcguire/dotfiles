source /home/tuelz/.Xmodmap

#export LD_PRELOAD=/usr/lib/libcurl.so.3

# my stuff
[[ -f ~/.Xresources ]] && xrdb -load /home/tuelz/.Xresources
eval $(ssh-agent)

#export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME
#export GNOME_SHELL_SESSION_MODE=classic
#exec gnome-session
#exec awesome
exec i3
