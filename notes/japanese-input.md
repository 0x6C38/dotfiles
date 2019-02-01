# Japanese Input
- fcitx-im (all)
- fcitx-mozc

Must also add and configure input methods in fcitx-configtool (add mozc) and also shortcuts. May be necssary to mess with the composition mode. May also be necessary to add the following to the `.xinitrc` file

     export GTK_IM_MODULE=fcitx
     export QT_IM_MODULE=fcitx
     export XMODIFIERS="@im=fcitx"
