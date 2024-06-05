#!/bin/sh

nasm -f bin -o bootloader.bin bootloader.asm # Assemble the NASM bootloader into a binary

gcc -ffreestanding -m32 -c kernel.c -o kernel.o # Compile kernel
ld -m elf_i386 -T linker.ld kernel.o -o kernel.elf -v # Make kernel executable (-v makes verbose)
objcopy -O binary kernel.elf kernel.bin

dd if=/dev/zero of=floppy.img bs=512 count=2880 # Blank floppy using dd

dd if=bootloader.bin of=floppy.img bs=512 count=1 conv=notrunc # Write the binary file to the empty floppy

dd if=kernel.bin of=floppy.img bs=512 seek=1 conv=notrunc # Load kernel into second sector of the floppy img

qemu-system-i386 -drive format=raw,file=floppy.img,if=floppy,media=disk # Run the floppy in QEMU!