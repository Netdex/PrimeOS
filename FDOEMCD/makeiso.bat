@echo off
set isofile=fdoem.iso
set basedir=CDROOT
REM boot isolinux
set params=-b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -N
REM support Joliet (MS Windows (R) long filename support) filesystem
set params=%params% -J
REM support RockRidge filenames as well
set params=%params% -r
REM rename boot.catalog to _$ and hide it.
REM set params=%params% -c boot.catalog -hide boot.catalog -hide-joliet boot.catalog
set params=%params% -c _$ -hide-joliet _$ -hide _$
if exist %isofile% del %isofile%
if exist %isofile% GOTO errRO
if NOT "%MKISOFSRC%"=="" set MKISOFSRC.$$$=%MKISOFSRC%
set MKISOFSRC=mkisofs.rc
set msg=Creating cdrom imagefile %isofile% out of directory %basedir%
echo %msg%
if "%OS%"=="Windows_NT" title %msg%
echo -o %isofile% %params% %basedir% > makeiso_.$$$
type makeiso_.$$$
MKISOFS.EXE @makeiso_.$$$
if "%errorlevel%"=="0" set msg=Created cdrom imagefile %isofile% out of directory %basedir%
if "%errorlevel%"=="0" goto end
set msg=Error %errorlevel% :
if "%errorlevel%"=="65535" set msg=%msg% Rename isolinux directory and isolinux.bin all lowercase!
if "%errorlevel%"=="9020" set msg=%msg% Please shorten command line, command line too long.
if "%errorlevel%"=="255" set msg=%msg% Please do not rename or remove isolinux\isolinux.bin
if "%errorlevel%"=="13" set msg=%msg% Please remove read-only attribute from file isolinux.bin 
del %isofile%
goto end

:errRO
set msg=Error: Unable to remove existing ISO file: %isofile%
goto end

:end
if exist makeiso_.$$$ del makeiso_.$$$
if NOT "%MKISOFSRC.$$$%"=="" set MKISOFSRC=%MKISOFSRC.$$$%
set MKISOFSRC.$$$=
echo.
echo %msg%
REM when ran on NT, e.g. via explorer instead of from cmd shell
if "%OS%"=="Windows_NT" title %msg%  
if "%OS%"=="Windows_NT" pause
if "%OS%"=="Windows_NT" title ""
