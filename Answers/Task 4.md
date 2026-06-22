



Modo interativo do disco
```bash
fdisk /dev/sdb
```


primeira partição:



segunda partição (swap)9

P para validar antes de salvar



Criar sistema de arquivos e swap:

mkfs.ext4 /dev/sdb1

mkswap /dev/sdb2



agora vamos pega os id:]

blkid




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



Ativar swap

swapon -a

e verificar memoria swap

swapon

free -m 



para troubleshooting em caso de problemas

lsblk
fdisk -l /dev/sdb
blkid
