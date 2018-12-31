set $mod Mod1
font pango:URW Gothic 12
#font pango:DejaVu Sans Mono 8
floating_modifier $mod
bindsym $mod+Return exec tilix
bindsym $mod+Shift+q kill
bindsym $mod+d exec dmenu_run
# bindsym $mod+d exec --no-startup-id i3-dmenu-desktop
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right
bindsym $mod+h split h
bindsym $mod+v split v
bindsym $mod+f fullscreen toggle
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split
bindsym $mod+Shift+space floating toggle
bindsym $mod+space focus mode_toggle
bindsym $mod+a focus parent
#bindsym $mod+d focus child
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10
bindsym --release Print exec spectacle -r
bindsym $mod+f4 kill

#audio
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +1000
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -1000
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle

#bindsym --whole-window button3 exec --no-startup-id ~/useful-scripts/rightclick.sh

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

focus_follows_mouse no
mouse_warping none

#gaps inner 30
#gaps outer -30

#set $active #00000000
set $active #888a85 
#set $active #1dcf00
#set $active #f6ad1b 

set $inact #2c1700 
#set $inact #2e3436 #gray colors
#set $inact #00000000
set $b_width 2

for_window[class="^.*"] border pixel $b_width

#class                  border  backgr. text     indicator child_border
client.focused          $active $active #ffffff     $active   $active
client.focused_inactive $inact  $inact  #ffffff     $inact    $inact
client.unfocused        $inact  $inact  #ffffff     $inact    $inact
client.urgent           $active  $active  #ffffff     $active    $active
client.placeholder      $invis  $invis  #ffffff     $invis    $invis

client.background       $inact
 
exec xsetroot -solid '#000000'

exec --no-startup-id sshfs cloud:/home/cloud/storage /home/cody/personal/cloud >> /home/cody/personal/log/sshfs.log

#uncomment this to have slideshow wallpaper
#exec --no-startup-id ~/screen-desk.sh
#uncomment this to set static wallpaper
exec --no-startup-id nitrogen --restore &

exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &
exec --no-startup-id pasystray &
exec --no-startup-id tint2 &
exec --no-startup-id compton -b --config ~/.config/compton/compton.conf &
exec --no-startup-id thunderbird &
exec --no-startup-id pamac-tray &

smart_gaps true
smart_borders true

for_window [class="Nitrogen"] floating enable;
for_window [class="Galculator"] floating enable;
for_window [class="Xscreensaver-demo"] floating enable;
for_window [title="Tint2 panel themes"] floating enable;
for_window [window_type="popup_menu"] floating enable;
for_window [window_type="dropdown_menu"] floating enable;
for_window [window_type="splash"] floating enable;
for_window [window_type="dialog"] floating enable;
