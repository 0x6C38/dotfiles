# Japanese Input / fcitx
- fcitx-im (all)
- fcitx-mozc

Must also add and configure input methods in `fcitx-configtool` (uncheck "only show current language" -> add mozc) and also configure shortcuts shortcuts. At this point fcitx input should work.

If it still doesn't work, it may be necessary to add the following to the `.xinitrc` file

     export GTK_IM_MODULE=fcitx
     export QT_IM_MODULE=fcitx
     export XMODIFIERS="@im=fcitx"

 Lastly, messing with the composition mode may also be necessary.