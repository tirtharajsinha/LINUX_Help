- Open HDAJackRetask and check `Show unconnected pins` in options section.

- Override pin 0x14 and set it to Internal Speaker (LFE). I believe this enables the amplifier that drives the top speakers. Setting it to something other than just "Internal Speaker" is important, so that pulseaudio does not try to redirect sound to that channel.
    
- Override pin 0x1e and set them to "Internal Speaker".
    

Hit Apply Now, and voila you have sound out of all four speakers.

Config screenshot:

[![enter image description here](https://i.sstatic.net/D4mj4.png)](https://i.sstatic.net/D4mj4.png)


# If you see this error 
> `tee: /sys/class/sound/hwC1D0/reconfig: Device or resource busy`

I found a work-around on another forum: skip the testing phase (clicking "Apply now") and just write your changes to disk (click "Install boot override") and reboot.  
  
Obviously this would be clumsy if you were proceeding by trial and error, but in my case the fix worked the first time.