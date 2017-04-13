# PrimeOS
An operating system that can only generate primes, ad infinitum. Generates them at a steady rate of 1 prime/sec.

![alt text?](https://my.mixtape.moe/sktcae.png)

[demo](https://streamable.com/d18ht)


This operating system is a modified FreeDos disk running a crappy prime generator written in C, using the DPMI so we have enough ram to generate `thicc primes`.

Uses the [FreeDOS OEM Disk Builder](http://www.fdos.org/bootdisks/ISO/README.TXT) to create a disk image booting FreeDos.

## Why.
I don't know.

## Build Instructions
1. Build `CPrimes` using `make` in the `src` directory, with a DJGPP build environment.
2. Copy `primes.exe` into the `CDROOT` folder in `FDOEMCD`.
3. Modify the `ISOLINUX` configuration and `AUTORUN.BAT` to suit your liking (I already configured them nicely)
4. Run `makeiso.bat` in the `FDOEMCD` directory to create `fdoem.iso`
5. Burn `fdoem.iso` to a cd-rom and wreak havoc to your heart's content

OR

Use the file `primeos.iso` available in the root of this repo.

oh yeah, i forgot to mention, you need a 16-bit support to compile this, so nothing x64 will do ~

## omg, how do i install it on my own computer
I'm glad you asked. Build it, get the ISO, then burn its essence onto your computer's hard drive after performing a rain dance and sacrificing a goat.

## i dont wanna mess up my computer to try out this garbage
It's okay, you can use QEMU or some other funky software to run a VM with this iso. You don't need to sacrifice anything, just type:
```
qemu-system-i386 -cdrom primeos.iso
```
