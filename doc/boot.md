# Документация по boot.asm

Простейший BIOS-загрузчик (MBR) для x86. При запуске выводит "Init MBR" и останавливает процессор.

### Запуск на Windows

```bash
nasm -f bin boot.asm -o boot.bin # Компиляция
qemu-system-x86_64 -fda boot.bin # Запуск в QEMU
```