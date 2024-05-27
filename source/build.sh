#!/bin/sh

nasm -f bin -o bootloader.bin bootloader.asm # Assemble the NASM bootloader into a binary

dd if=/dev/zero of=floppy.img bs=512 count=2880 # Blank floppy using dd

dd if=bootloader.bin of=floppy.img bs=512 count=1 conv=notrunc # Write the binary file to the empty floppy

qemu-system-i386 -drive format=raw,file=floppy.img,if=floppy,media=disk # Run the floppy in QEMU!