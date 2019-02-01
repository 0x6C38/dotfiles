## Numpad on boot
There are two components to having the numpad activated on boot. The first is the console activation which can be done by:

    sudo systemctl edit getty\@.service

    [Service]
    ExecStartPre=/bin/sh -c 'setleds +num < /dev/%I'

And the second is the display manager's activation. In case of X.org, numpadx can be installed and executed on ~/.xinitrc so that it works with startx:

    sudo pacman -S numlockx
    vim ~./.xinitrc

    numlockx &

    exec window_manager

Reference:
 - https://wiki.archlinux.org/index.php/Activating_Numlock_on_Bootup