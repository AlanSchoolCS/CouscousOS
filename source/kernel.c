void _start() {
    const char *str = "Welcome, user!";
    char *video_memory = (char *)0xb8000;        // VGA compatible hardware: text mode
    for (int i = 0; str[i] != '\0'; ++i) {       // Loop to end of null-terminated string
        video_memory[i * 2] = str[i];            // multiplied by 2 bc it takes up 2 bytes of memory per character
        video_memory[i * 2 + 1] = 0x07;          // white fg, black bg
    }
    while (1) {
        __asm__("hlt");                          // halt cpu
    }
}