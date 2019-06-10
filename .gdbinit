target extended-remote localhost:4242

load build/main.elf

monitor reset

tbreak main
