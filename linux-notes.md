# Aplications
## General
- git
- sbt
- htop / gtop
- zsh
- emacs + spacemacs + adobe-source-code-pro-fonts
- vim
- ranger + w3m + trash-cli (sudo easy_install trash-cli)
- keepass/keepassxc + xdotools
- youtube-dl

### Optional
- peek (record screen and make gif)
- ttyrec (recording terminal actions and playing them back)

## Fonts
- powerline fonts (https://github.com/powerline/fonts)
- ttf-font-awesome

## Japanese Input
- fcitx-im (all)
- fcitx-mozc

Must also add and configure input methods in fcitx-configtool (add mozc) and also shortcuts. May be necssary to mess with the composition mode. May also be necessary to add the following to the .xinitrc file

     export GTK_IM_MODULE=fcitx
     export QT_IM_MODULE=fcitx
     export XMODIFIERS="@im=fcitx"

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

## Gnome
- tilix
- dconf (to back up configurations)

### Themes
- [Paper](https://snwh.org/paper/download)
- [Adapta](https://github.com/adapta-project/adapta-gtk-theme#installatiohttps://github.com/godlyranchdressing/United-GNOMEn-from-packages)
- [United](https://github.com/godlyranchdressing/United-GNOME)
- [Ant](https://www.opendesktop.org/s/Gnome/p/1099856/)
- [Numix]()
- [Flat-Plat](https://www.opendesktop.org/s/Gnome/p/1084960/)
- [Arc](https://github.com/horst3180/Arc-theme#installation)

## i3 related
- feh: Image viewer + sets wallpapers on wm's
- scrot: For taking screenshots
- rofi: Alternative to dmenu
- i3lock-fancy
- imagemagick: required for i3lock-fancyxev
- python-pywal (yaourt)(former wal)
- compton
- transmission-cli: (cli torrent client)
- ttf-font-awesome (font for displaying symbols)

# KDE
## Add shortcut to switch between desktops "there is no shortcut to change desktop"
You can add it. Global shortcuts -> System Settings Module -> different kinds of switching Or left click on a Pager -> Configure Desktops -> Switchings and choose it there. 


## Add a shortcut to drag windows to another desktop"no shortcut to drag your windows to another desktop 
You can add it. Global shortcuts -> System Settings Module -> Window to Desktop "alt tab doesn't include windows from every desktop" You can change it. Task Switcher -> Filter windows by and uncheck Virtual desktops 

## "When you type in the menu and search for an application it opens up a new window by default and if you configure it to open only one instance it does so, but only if the other instances are on the same desktop" 

Isn't it per program dependant? Tried Smplayer(1 instance mode enabled), opened in desktop 1 tried to open in desktop 2 KDE switched to desktop 1 to already opened Smplayer. 

To change application launcher type:
- unlock widgets ->  right click logo ->  alternatives

## Num-pad is off when the computer starts
Something [here](https://forum.manjaro.org/t/solved-how-to-turn-on-numlock-on-boot-on-plasma/8301/2) solved the issue.

# Media drive mounting
Look for the drive's UUID via lsblk and then mount the drive to some location (which must exist) and then create an entry in the /etc/fstab file using noatime. This line should work by replacing sdb1 with the name of the drive and /run/media/dsalvio/Media with the desired mount point.

    echo "UUID=$(lsblk -no UUID /dev/sdb1) /run/media/dsalvio/Media $(lsblk -no FSTYPE /dev/sdb1) defaults,noatime 0 2" >> /etc/fstab 

Make sure ntfs-3g is installed since linux struggles with some ntfs variations.

By default root may take ownership of the mounted folder so it may be necessary to take measures to provide other users with access. This may be done via configuration in the fstab file or by taking ownership of the mounted drive:

    sudo chown -R myUserName: /media/MD

It's possible that the media drive may be set to read only because of windows. If that's the case, switch to windows and disable hibernation as well as fast start up.



# Postgres Fedora installation
jdbc:postgresql://localhost:5432/postgres
Usuario y contraseña para la version de postgresql local, instalada en fedora 23.

Para instalar la base de datos use el comando:
sudo dnf install postgresql-server postgresql-contrib pgadmin

Para preparar la base de datos para su ejecución por primera vez:
sudo postgresql-setup --initdb --unit postgresql

Para inicializar la base de datos:
sudo systemctl start postgresql

Para comprobar que este corriendo:
sudo systemctl status postgresql

Para inicializar la base de datos cada vez que inicia el sistema:
sudo systemctl enable postgresql

En caso de que ya exista el /var/lib/pgsql/data y de un error de inicializacion:
sudo rm -rf /var/lib/pgsql/data

Para acceder a la consola de postgres:
su
su - postgres
psql

Para poder acceder con el usuario administrador 'postgres' por defecto cambiar la pass una vez dentro de la consola:
\password

Para crear un usuario, dentro de la consola (no recomendado):
CREATE USER dsalvio WITH PASSWORD 'Axx2A9inFFEk6muS';

Para crear una base de datos, dentro de la consola:
CREATE DATABASE instalationTestDB OWNER dsalvio;

Para listar las bases de datos dentro de la consola:
\l

Para listar todas las tablas dentro de una base de datos en la consola:
\dt

Para ver la estructura de una tabla cualquiera:
\d cualquiera

Para salir de la terminal de postgres:
\q

Por defecto hay que configurar el metodo de autenticacion de postgres para permitir conexiones locales mediante usuario y contraseña, por lo cual hay que editar el archivo "/var/lib/pgsql/data/pg_hba.conf" pero eso no se puede hacer dentro de la consola de postgres, asi que hay que salir de la consola o en otra terminal:
sudo gedit /var/lib/pgsql/data/pg_hba.conf

Hay que modificar la configuración a password siguiente:
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     password
# IPv4 local connections:
host    all             all             127.0.0.1/32            password

Para reiniciar el postgres en caso de hacer algun cambio:
sudo systemctl restart postgresql

Para conectarse a la consola desde cualquier usuario en la terminal:
psql -h localhost -U postgres

Tutorial: https://www.youtube.com/watch?v=IQ3WeCPo0B4

-- Manjaro
pg_ctl -D /var/lib/postgres/data -l logfile start
You can now start the database server using:
sudo pacman -Sy postgresql pgadmin3
su
su - postgres
sudo systemctl start postgresql

usuario: postgres
pass: 

https://www.youtube.com/watch?v=YyAEho7sDro
