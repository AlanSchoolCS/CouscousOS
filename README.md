# CouscousOS
My Computer Science Internal Assessment: an operating system written in NASM and C, with incorporated visualisers

---
# Table of contents
1) [Current Features](#features)
2) [Installation Guide](#installation)

---
## Features
*CouscousOS is currently very early stages, so it will be prone to errors*

---
## Installation
### Virtual Machine
*This guide requires you to be on a Linux based system, if on Windows, then it is recommended to install the "Windows Subsystem for Linux" (WSL)*
*To install the WSL, simply run the command:* `wsl --install` *and follow the on-screen prompts, before restarting your system.*

1) First you will need to clone this repository before you can proceed with the installation
2) Locate the installation script in `source/install.sh` and run it from the same directory in your terminal using `./install.sh`
   - This will install QEMU, NASM and GCC
3) To verify your installation, run:
   ```shell
   qemu-system-i386 --version
   nasm -v
   gcc --version
   ```
4) Run the build script located in `source/build.sh`
5) Enjoy your emulated CouscousOS experience! 🎉🎉

### x86 based device
*TBD*