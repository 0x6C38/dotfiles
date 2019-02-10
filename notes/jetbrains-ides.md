# Jetbrains IDEs
## Support high dpi
Change xrandr's dpi to match your monitor:

    xrandr --dpi <dpi>

It can be checked with:

    xdpyinfo | grep resolution

Source:
- https://intellij-support.jetbrains.com/hc/en-us/community/posts/206153219-High-DPI-Support-on-Linux-in-IntelliJ-15-0-1-idea-IU-143-382-35-

## Sbt/Scala Projects
The sbt version set in `/project/build.properties` must match the sbt version installed in your system or intellij won't detect your project's modules.

## Shortcuts
### Duplicate Line

    File -> Settings Keymap -> Search "Duplicate Line or Selection" -> Ctr+Y -> Remove other assignments

### Delete Line

    File -> Settings Keymap -> Search "Delete Line" -> Ctr+D -> Remove other assignments


### Comment Shortcut
The shortcut for commenting stuff doesn't work if you aren't using a keyboard with an english layout so it must be reassigned in order to work:

    File -> Settings Keymap -> Search "Comment With Line Comment" -> Ctr+3 -> Remove other assignments