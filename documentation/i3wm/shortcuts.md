# Shortcuts:
I have made some valuable shortcuts in my i3 config, that I find really helpful.

## Changes:
To see all the shortcuts, you can use the shortcut `$mod+Shift+b`. This will open up rofi, listing all the shortcuts in my i3 config.

1. Added PulseAudio shortcut, to open up PulseAudio. This is really helpful, as I might want to swap my mic or choose to use my headphones. Shortcut: `$mod+Shift+v`
2. Added screenshot utility, really helpful for taking screenshots really easily. The tool is called flameshot. Shortcut: `$mod+p`
3. Added shortcut to play work music. First, open up `scripts/play_audio.sh` with Neovim, and change the audio path to the audio you want to play. Then, we need to move the bash script to `/usr/bin/`, and make sure it is executable:
```bash # assuming you are already in my dotfiles directory
chmod +x ./scripts/play_audio.sh ; sudo mv ./scripts/play_audio.sh /usr/bin
```
To start the music, use the shortcut `$mod+Shift+p`, and to stop the music, use `$mod+Shift+s`. To choose the music to play, go to `scripts/play_audio.sh`, and modify 
4. Added shortcut to enable and disable touchpad on my laptop. Super userful if you find your palm touching the touchpad, moving the cursor around. Run the command `xinput`, and you will see all the devices. It will look something like this: 
```bash
⎡ Virtual core pointer                          id=2    [master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
⎜   ↳  USB OPTICAL MOUSE                        id=10   [slave  pointer  (2)]
⎜   ↳ Compx 2.4G Wireless Receiver Mouse        id=13   [slave  pointer  (2)]
⎜   ↳ Compx 2.4G Wireless Receiver Keyboard     id=14   [slave  pointer  (2)]
⎜   ↳ DELL0816:00 044E:121F Mouse               id=16   [slave  pointer  (2)]
⎣ Virtual core keyboard                         id=3    [master keyboard (2)]
    ↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
    ↳ Power Button                              id=6    [slave  keyboard (3)]
    ↳ Video Bus                                 id=7    [slave  keyboard (3)]
    ↳ Power Button                              id=8    [slave  keyboard (3)]
    ↳ Sleep Button                              id=9    [slave  keyboard (3)]
    ↳ Solid State System Co.,Ltd. MIC300        id=11   [slave  keyboard (3)]
    ↳ Compx 2.4G Wireless Receiver              id=12   [slave  keyboard (3)]
    ↳ DELL0816:00 044E:121F UNKNOWN             id=15   [slave  keyboard (3)]
    ↳ Intel HID events                          id=18   [slave  keyboard (3)]
    ↳ Intel HID 5 button array                  id=19   [slave  keyboard (3)]
    ↳ Dell WMI hotkeys                          id=20   [slave  keyboard (3)]
    ↳ AT Translated Set 2 keyboard              id=21   [slave  keyboard (3)]
    ↳ Compx 2.4G Wireless Receiver Keyboard     id=22   [slave  keyboard (3)]
∼ DELL0816:00 044E:121F Touchpad                id=17   [floating slave] # in my case, this is my touchpad
```
In my case, the device `∼ DELL0816:00 044E:121F Touchpad`. Find out which one is yours, and replace the line device in your i3 config:
```i3/config
# bindings to enable and disable touchpad (change the value inside the `` to the name of your touchpad)
bindsym $mod+o exec --no-startup-id "xinput disable 'DELL0816:00 044E:121F Touchpad'" 
bindsym $mod+Shift+o exec --no-startup-id "xinput enable 'DELL0816:00 044E:121F Touchpad'"
```
Then, reload your i3 config. For me it is `$mod+Shift+c`.

## Conclusion:
This is it for my i3 config so far. I will make futher changes later on. If you think I missed something, or if you have some other valuable scripts and shortcuts that can be useful, feel free to leave an issue or make a pull request.
