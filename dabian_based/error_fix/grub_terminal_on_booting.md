# GRUB terminal problem at installing ubuntu based Linux distro.
## Like, ubuntu, mint, zorin, elementary

> in the grub rescue> command line type
``` 
ls 
```
### ... to list all available devices.<br>
> Then you have to go through each, type something like (depends what is shown by the ls command)
```
ls (hd0,1)/
ls (hd0,2)/ 

```
### ... and so on, until you find:
> (hd0,1)/boot/grub   OR (hd0,1)/grub

### ... or, in case of "UEFI", it look something like:
> (hd0,1)/efi/boot/grub OR (hd0,1)/efi/grub

### (.)  Now you have to set the boot parameters accordingly - just type the following (with the correct numbers for your case) and after each line press return:
```
set prefix=(hd0,1)/grub
```
### ... or (if grub is in a sub-directory):
```
set prefix=(hd0,1)/boot/grub
```
### Then continue with
```
set root=(hd0,1)
insmod linux
insmod normal
normal
```
## Now it should boot.

### Go to the commandline (e.g. start a "terminal") now, and execute:
```
sudo update-grub
```

### ... this should correct the missing information and it should boot next time.

## If NOT - you have to go through the steps again an might have to repair or install grub again:
> Please look at the "Boot-Repair"-tool from this article: <a href="https://help.ubuntu.com/community/Boot-Repair"><b>https://help.ubuntu.com/community/Boot-Repair</b></a> (I had positive experiences with it, when previous steps wouldn't survive the reboot)

