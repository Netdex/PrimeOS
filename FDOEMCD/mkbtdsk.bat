@ECHO OFF
ECHO Creating boot disk image for use when booting from CD-ROM.
ECHO Uses Bart Lagerweij's bfi.exe (Build Floppy Image) program,
ECHO which is created using WinImage SDK copyright Gilles Vollant.
REM add -v for more verbose output
REM use -t=6 when testing 1.44MB disk images
IF EXIST CDROOT\isolinux\BTDSK.IMG del CDROOT\isolinux\BTDSK.IMG > NUL
bfi -t=3 -f=CDROOT\isolinux\BTDSK.IMG -l=FDOEM -b=BOOTSECT.FD CDBTDSK
IF EXIST CDROOT\isolinux\BTDSK.IMG ECHO CDROOT\isolinux\BTDSK.IMG created.
