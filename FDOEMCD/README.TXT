FreeDOS OEM CD-ROM disc builder assistant.
simplify building bootable DOS CD-ROM discs for 386 and higher computers

Step 0: Disclaimer
------------------
  The FreeDOS OEM CD builder assistant files and included programs
are provided as-is.  Source is available as separate downloads at
the same location (and time) as the binary archive.  Please read
and understand the license of all used tools and included programs
prior to use or distribution.  No warranty nor liability is provided;
no fitness for any particular purpose; etc. as permitted by law;
if your local laws do not allow for such, you may not use.  Please
respect all copyrights and other legal restrictions for your area.
For assistance refer to normal FreeDOS help channels or you may
try me personally (though I make no guarantees of timeliness nor
even if I will be available to assist you) by mailing
jeremyd<at>computer.org or fdos.org.


Step 1: Boot disk
-----------------
  The boot disk is composed of the several FreeDOS components
and the Eltorito CD-ROM driver from Bart Lagerweij.
  - For Eltorito.sys see licenses\nu2lic.txt
  - SHSUCDX is a copyright reserved, free use program.
    (c)John H. McCoy, 1994, 1995, 1996 Sam Houston St. Univ., TX 77341-2206
  - The FreeDOS kernel, FreeCom, Himem, CuteMouse, and cdrcache are
    licensed under the GNU General Public License, see licenses\gpl.txt

  This boot disk is designed to boot DOS (FreeDOS kernel + FreeCom),
load himem for extended memory support, eltorito.sys + cdrcache + shsucdx
to support a CD-ROM drive with cache support, and finally Cutemouse to
support the mouse.  Once booted and drivers loaded, drives are searched
(from A to Z) for \AUTORUN.BAT, once found, execution passes on to it.
If the CD-ROM can not be found, a message is presented to the user and
they are asked to reboot.  

Please be aware this boot disk will only provide CD-ROM support if the
computer is booted from the CD-ROM drive.  If the target system does
not support booting from CD-ROM drive (or its support is flaky), consider
booting Smart Boot Manager from floppy and chain booting the CD.  Other
alternatives include customizing the disk image to include a different
CD-ROM device driver.

Customization:  This boot disk is designed to be useful without any
need for changes, but if you need to:
  1) add or change files in CBDTDSK subdirectory
     (in particular you may wish to alter CDBTDSK\README to reflect
      your program, add/change drivers along with updating CDBTDSK\CONFIG.SYS
      and/or CDBTDSK\AUTOEXEC.BAT as necessary)
  2) run mkbtdsk.bat
     (it will recreate CDROOT\isolinux\BTDSK.IMG, a 360KB floppy diskette image)
  3) [optional] zip compress BTDSK.IMG (do not change filename)

Notes:
  -- The included kernel has its config options set to not display
how drives are assigned and wait for F5/F8 disabled.


Step 2: CD-ROM
--------------
  The actual OEM program and all of its data files should reside within
the CDROOT subdirectory.  The CDROOT\AUTORUN.BAT must be modified to properly
invoke your program.  You may choose to edit the text (CDROOT\isolinux\*.TXT)
files displayed during boot, but it isn't required.  Please copy all
necessary files and directory structure to the 'CDROOT' directory (as long
as the directory structure is valid for an ISO 9660 CD-ROM filesystem, and
you do not overwrite the isolinux/memdisk files, this may be in any
layout you wish).  Please change MKISOFS.RC to reflect your program,
name, and CD-ROM contents.  Then run MAKEISO.BAT and burn the resulting
FDOEM.ISO CD image file using your normal CD writing program.

Notes:
  -- In order to fit all the necessary command line arguments to 
MKISOFS, the command line arguments are written to makeiso.$$$, which
is then passed to mkisofs as a response file (@makeiso.$$$); the 
boot.catalog is created as _$ and then hidden; additionally the
environment variable MKISOFSRC is set to mkisofs.rc, if it is 
already set, the current value is stored in MKISOFSRC.$$$ environment
variable and later restored.


Step 3: Distribution
--------------------
  Simply upload FDOEM.ISO (or whatever you renamed the CD-ROM ISO 9660
image file to) along with source archive (e.g. FDOEMCD.source.zip)
and if you made any, the changes you have made to the included GPL'd
programs.  You do NOT need to distribute FDOEMCD.builder.zip and its
associated source archive.  If you choose to distribute your generated
CD-ROM on physical discs, please be sure to include necessary source
files (e.g. FDOEMCD.source.zip) or per GPL a written document as to
where to obtain them [you may not redirect users to fdos.org unless
prior arrangements have been made].


APPENDIX A: FILES
-----------------
  bfi.exe      Build Floppy Image (win32 only), see nu2lic.txt
  BOOTSECT.FD  FreeDOS floppy boot sector, see gpl.txt
  fdoem.iso    generated bootable ISO image
  makeiso.bat  simplifies creating ISO image
  mkbtdsk.bat  simplifies creating boot disk image used by ISO image
  mkisofs.exe  creates ISO images, see gpl.txt
  mkisofs.rc   used to set CD label and similar values
  README.TXT   this file, general information
  CDROOT\      root of the generated CD image
    AUTORUN.BAT  starts OEM program (please edit)
    isolinux\    contains the bootable CD files
      BOOTMSG.TXT  displayed when the user boots the CD
      BTDSK.IMG    360KB floppy diskette image that is booted
                   [may be regenerated by running mkbtdsk.bat]
      F1_HELP.TXT  help text displayed when user presses F1 key
      F2_LICEN.TXT basic license information displayed for F2 key
      F_ABOUT.TXT  general information about FreeDOS, F4-F10 keys
      isolinux.bin actual ISOLINUX program (ensure not read only)
      ISOLINUX.CFG configuration data for ISOLINUX program
      memdisk      supports booting the floppy image
  CDBTDSK\     contents of the boot floppy (360KB limit)
    AUTOEXEC.BAT finishes loading DOS drivers, chains to AUTORUN.BAT
    COMMAND.COM  FreeCom, command interpreter
    CONFIG.SYS   loads DOS drivers
    KERNEL.SYS   FreeDOS kernel (DOS)
    README       a basic description of the boot disk (may be edited)
    DRIVERS\     contains the DOS drivers loaded during boot phase
      cdrcache.sys adds caching support to CD-ROM drives, see gpl.txt
      ctmouse.exe  adds support for mice, see gpl.txt
      Eltorito.sys supports CD-ROM via BIOS bootable CD support, see nu2lic.txt
      himem.sys    provides extended memory support, see gpl.txt
      shsucdx.exe  provides DOS CD-ROM extensions (to support CD as drive)
  licenses\    contains license files for used programs
    gpl.txt      GNU General Public License version 2, most FreeDOS programs
    nu2lic.txt   License most of Bart Lagerweij's programs available under


APPENDIX B: Quick Usage
-----------------------
  - Unzip FDOEMCD.builder.zip, eg. to C:\TEMP
  - start a command prompt (Start->Run  cmd)
  - change into FDOEMCD builder directory, eg. CD \TEMP\FDOEMCD
  - [optional] make changes in CDBTDSK, then run mkbtdsk.bat
               Note: mkbtdsk.bat uses bfi.exe which is a Win32 program
  - add your program/files/etc in CDROOT directory, 
    e.g. xcopy /s \MYPROGRAM CDROOT\
  - change AUTORUN.BAT to invoke your program
    e.g. edit CDROOT\AUTORUN.BAT   ---> @ECHO OFF
                                        CLS
                                        CALL MYPROGRAM\START.BAT
  - edit mkisofs.rc to reflect your CD-ROM
  - generate the new ISO image by running makeiso.bat
    Note: makeiso.bat uses mkisofs.exe, a DJGPP (DOS) version
  - burn FDOEM.ISO using your normal CD writing software
  - boot from the CD and give it a try


20040714 - original
20050213 - correct 'CD' directory to 'CDROOT', update my email address
           (Thanks to Chris for informing me of the issue.)
           updated kernel (for boottime config.sys read failure fixes)
