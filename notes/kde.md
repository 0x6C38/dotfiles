# KDE
## Num-pad on Boot
For a KDE specific solution, something [here](https://forum.manjaro.org/t/solved-how-to-turn-on-numlock-on-boot-on-plasma/8301/2) solved the issue.

## HDIDPI
### Fonts
    System Settings > Fonts > Force fonts DPI > #

### Display Scaling
...

## General Configuraiton
### Resize Applications Panel
First make sure the panel is unlocked:

    Right click panel -> unlock widgets
    
With the panel unlocked:

    Right click panel -> Panel Options -> Configure Panel -> Click Height & Drag

### Change Panel Position
First make sure the panel is unlocked:

    Right click panel -> unlock widgets
    
With the panel unlocked:

    Right click panel -> Panel Options -> Configure Panel -> Screen Edge & Drag

### Change the Theme

    System Settings -> Workspace Theme -> Look & Feel -> Select Theme

### Configure Virtual Desktops

    System Settings -> Desktop Behavior -> Virtual Desktops -> Select Theme

### Configure Screen Locking

    System Settings -> Desktop Behavior -> Screen Locking

### Icons Only Applications Panel
First make sure the panel is unlocked:

    Right click panel -> unlock widgets
    
With the panel unlocked:

    Right click panel -> "Alternatives" -> Icons only Task Manager

### Wallpaper Slideshow

    Right Click Desktop -> Configure Desktop -> Wallpaper Type -> SlideShow -> Add Folder

### Menu Transparency

    System Settings -> Application Style -> Widget Style -> Applications -> Widget Style -> Configure.. -> Transparency -> Drag Slider

### Window Rules
Window rules can be used to make applications open in specific desktops, with a specific size, etc.

    System Settings -> Window Management -> Window Rules -> New ("Detect window properties", etc.)

## Shortcuts
### Close Window
    
    System Settings -> Shortcuts -> Global Shortcuts -> KWin -> Close Window

### Maximize Window
    
    System Settings -> Shortcuts -> Global Shortcuts -> KWin -> Maximize Window

### Switch Desktop

    System Settings -> Shortcuts -> Global Shortcuts -> KWin -> Switch One Desktop [X] / Switch to Desktop [X]

Or left click on a Pager -> Configure Desktops -> Switchings and choose it there. 

### Custom Command Shortcuts

    System Settings -> Shortcuts -> Custom Shortcuts -> Edit -> New -> Global Shortcut -> Command/URL -> Trigger [X] -> Action [C]

Adding the commands to a group enforces an "AND" condition, so don't do it.

### Tilix Quake

    System Settings -> Window Management -> Window Behavior -> Uncheck "Click raises active window" -> Set "Focus stealing prevention" to "None"

## Other Stuff
### Add a shortcut to drag windows to another desktop "no shortcut to drag your windows to another desktop 
You can add it. Global shortcuts -> System Settings Module -> Window to Desktop "alt tab doesn't include windows from every desktop" You can change it. Task Switcher -> Filter windows by and uncheck Virtual desktops 

### "When you type in the menu and search for an application it opens up a new window by default and if you configure it to open only one instance it does so, but only if the other instances are on the same desktop" 

Isn't it per program dependant? Tried Smplayer(1 instance mode enabled), opened in desktop 1 tried to open in desktop 2 KDE switched to desktop 1 to already opened Smplayer. 

To change application launcher type:
- unlock widgets ->  right click logo ->  alternatives