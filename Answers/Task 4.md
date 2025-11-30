
![[Pasted image 20251127021943.png]]


Modo interativo do disco
```bash
fdisk /dev/sdb
```


primeira partição:

![[Pasted image 20251127033218.png]]

segunda partição (swap)9

P para validar antes de salvar

![[Pasted image 20251127052826.png]]

Criar sistema de arquivos e swap:

mkfs.ext4 /dev/sdb1

mkswap /dev/sdb2

![[Pasted image 20251127053945.png]]

agora vamos pega os id:]

blkid

![[Pasted image 20251127054021.png]]


Agora vamos a copiar a uuid no /etc/fstab para montagem persistente

```bash
blkid | awk '/sdb1/ {print $2} >> /etc/fstab'
blkid | awk '/sdb2/ {print $2} >> /etc/fstab'
```


```bash
UUID="711657a5-ea04-45ed-9497-07df808f47d1"   /mnt/files   ext4   defaults   0  0
UUID="4b4cf557-a84c-42d0-8e74-4e646a02f9f7"   none        swap   defaults   0  0

```

o melhor jeito de testar é reiniciar

validar montagem

![[Pasted image 20251127055930.png]]

Ativar swap

swapon -a

e verificar memoria swap

swapon
free -m 

![[Pasted image 20251127060038.png]]

para troubleshooting em caso de problemas

lsblk
fdisk -l /dev/sdb
blkid