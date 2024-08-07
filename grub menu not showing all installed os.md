

1. Edit the file ```/etc/default/grub```

2. change these variable.

    ```
    GRUB_TIMEOUT=10
    GRUB_TIMEOUT_STYLE=menu
    GRUB_DISABLE_OS_PROBER=false
    ```

3. update the grub with following command
    ```
    sudo update-grub
    ```
    then
    
    ```
    sudo grub-install /dev/sda
    ```

now go to the ``` Bios setting > Boot sequence ```
and put the os (where you changed the bios settings) top on the list. Now save the settings with F10 key and exit from bios.

## Now this problem should be fixed.