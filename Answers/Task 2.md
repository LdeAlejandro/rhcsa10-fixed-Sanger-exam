
![[Pasted image 20251125022231.png]]


Restart the machien and press E to enter the grub

adicionar no final da linha de linux 

```bash
init=/bin/bash
ctrl+x
```

![[Pasted image 20251125023346.png]]

```bash
mount -o remount,rw /        # Remonta o filesystem raiz (/) como leitura-e-escrita
passwd                        # Altera a senha do usuário root

touch /.autorelabel            # Solicita relabeling do SELinux no próximo boot
exec /usr/lib/systemd/systemd # Reiniciar
```

![[Pasted image 20251125023843.png]]

Se desde server1 não permite fazer o teste de root login ssh

validar o arquivo

/etc/ssh/sshd_config

PermitRootLogin yes
PasswordAuthentication yes


reiniciar serviço sshd

sudo systemctl restart sshd

