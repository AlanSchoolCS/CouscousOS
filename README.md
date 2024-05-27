# CouscousOS
My Computer Science Internal Assessment: an operating system written in NASM and C, with incorporated visualisers


## Installation
### Virtual Machine
*This guide requires you to be on a Linux based system, if on Windows, then it is recommended to install the "Windows Subsystem for Linux" (WSL)*
*To install the WSL, simply run the command:* `wsl --install` *and follow the on-screen prompts, before restarting your system.*

(Before install, make sure you run `sudo apt update`, in order to ensure your package list is up to date)

1) First, you will need to install QEMU, an open source, full system emulator. This will be used to actually run the operating system without risk of damage to your machine. To install, simply run: `sudo apt install qemu-system`

2) Next, install the Nasm ("the Netwide Assembler") using: `sudo apt install nasm`

3) Then install the GCC compiler for C: `sudo apt install gcc`

4) To verify installation, run:
- `qemu-system-i386 --version`
- `nasm -v`
- `gcc --version`

5) Clone the repository

6) Run the build script located in `source/build.sh`

7) Enjoy your emulated CouscousOS experience! 🎉🎉

### x86 based device
*TBD*
