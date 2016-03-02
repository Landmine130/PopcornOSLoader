/dev/sdb : boot.bin kernel.bin
	sudo dd if=boot.bin of=/dev/sdb
	sudo dd if=kernel.bin of=/dev/sdb seek=1
boot.bin : boot.asm
	nasm boot.asm -f bin -o boot.bin
kernel.bin : kernel.asm
	nasm kernel.asm -f bin -o kernel.bin
