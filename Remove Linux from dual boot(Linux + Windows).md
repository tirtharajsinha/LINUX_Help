
1. Delete target linux partitions from windows disk management.
2. open cmd as administrator.

```
C:\Windows\system32>diskpart

DISKPART> list disk

  Disk ###  Status         Size     Free     Dyn  Gpt
  --------  -------------  -------  -------  ---  ---
  Disk 0    Online          476 GB   170 GB        *

DISKPART> select disk 0

Disk 0 is now the selected disk.

DISKPART> list partition

  Partition ###  Type              Size     Offset
  -------------  ----------------  -------  -------
  Partition 1    System             260 MB  1024 KB
  Partition 2    Reserved            16 MB   261 MB
  Partition 3    Primary            200 GB   277 MB
  Partition 4    Recovery           697 MB   200 GB
  Partition 5    Primary            103 GB   201 GB
  Partition 6    Recovery           519 MB   476 GB

DISKPART> select partition 1

Partition 1 is now the selected partition.

DISKPART> assign letter=z

DiskPart successfully assigned the drive letter or mount point.

DISKPART> exit

Leaving DiskPart...

C:\Windows\system32>Z:

Z:\>dir
 Volume in drive Z is SYSTEM
 Volume Serial Number is 4E77-BD2F

 Directory of Z:\

14-04-2024  06:57 PM    <DIR>          EFI
14-04-2024  07:00 PM    <DIR>          System
24-01-2024  08:00 PM                34 mach_kernel
               1 File(s)             34 bytes
               2 Dir(s)     157,691,904 bytes free

Z:\>cd EFI

Z:\EFI>dir
 Volume in drive Z is SYSTEM
 Volume Serial Number is 4E77-BD2F

 Directory of Z:\EFI

08-12-2020  04:20 AM    <DIR>          .
08-12-2020  04:20 AM    <DIR>          ..
08-12-2020  04:20 AM    <DIR>          Microsoft
14-04-2024  06:59 PM    <DIR>          Boot
11-03-2023  01:56 AM    <DIR>          HP
26-04-2024  11:43 PM    <DIR>          fedora
               0 File(s)              0 bytes
               6 Dir(s)     157,691,904 bytes free

Z:\EFI>rd fedora /s
fedora, Are you sure (Y/N)? Y

Z:\EFI>dir
 Volume in drive Z is SYSTEM
 Volume Serial Number is 4E77-BD2F

 Directory of Z:\EFI

08-12-2020  04:20 AM    <DIR>          .
08-12-2020  04:20 AM    <DIR>          ..
08-12-2020  04:20 AM    <DIR>          Microsoft
14-04-2024  06:59 PM    <DIR>          Boot
11-03-2023  01:56 AM    <DIR>          HP
               0 File(s)              0 bytes
               5 Dir(s)     175,747,072 bytes free

```