@ECHO OFF
\DRIVERS\shsucdx.exe /D:CDRCACH$
SET CDDRIVE=
FOR %%x IN ( C D E F G H I J K L M N O P Q R S T U V W X Y Z ) DO IF EXIST %%x:\AUTORUN.BAT SET CDDRIVE=%%x:
IF "%CDDRIVE%"=="" GOTO errormsg
%CDDRIVE%
CD \
REM Note that we do NOT 'call' AUTORUN.BAT, so we should not return
AUTORUN.BAT
:errormsg
ECHO ERROR: Failure loading; unable to find CD-ROM drive!
ECHO ERROR: If you have multiple CD-ROM drives, please remove the other
ECHO ERROR: CD-ROM discs and try again.  Otherwise your disc may be corrupt
ECHO ERROR: or the CD-ROM driver does not correctly support your system.
ECHO ERROR:
ECHO ERROR: Please reboot your computer now.
:loopforever
pause > NUL
GOTO loopforever
