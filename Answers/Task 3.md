![[Pasted image 20251126025654.png]]

## **1. Validar informação do dispositivo de CD/DVD**

`lsblk`

---

## 📀 **2. Montar imagem do disco**

> _(Trocar os valores conforme o nome real do dispositivo — normalmente `/dev/sr0`)_

`dd if=/dev/sr0 of=rhel10.iso bs=1M`


![[Pasted image 20251126030904.png]]


---

## 📁 **3. Criar diretório para montar a imagem do repositório**

`mkdir /repo`

---

## 📝 **4. Adicionar entrada persistente no `/etc/fstab`**

Editar o arquivo:

`vi /etc/fstab`

Adicionar a linha:

`/rhel10.iso   /repo   iso9660   defaults   0 0`


![[Pasted image 20251126031601.png]]


Montar:

`mount -a 
`ls /repo`

---

## 📦 **5. Configurar repositórios BaseOS e AppStream**

### **BaseOS**

`vi /etc/yum.repos.d/BaseOS.repo`

Conteúdo:

```bash
[BaseOS] 
name=BaseOS 
baseurl=file:///repo/BaseOS 
gpgcheck=0
```

### **AppStream**

`vi /etc/yum.repos.d/AppStream.repo`

Conteúdo:
```bash
[AppStream] 
name=AppStream 
baseurl=file:///repo/AppStream 
gpgcheck=0`
```
---

## 🛠️ **6. Instalar VIM e HTTPD**

`dnf install -y vim httpd`

---

## 🌐 **7. Configurar o servidor HTTPD para servir o repositório**

Editar o arquivo principal:

`vim /etc/httpd/conf/httpd.conf`

Alterar:

`DocumentRoot "/repo"  
`<Directory "/repo">`    

![[Pasted image 20251126033433.png]]


---

# 🔐 **8. Ajustar SELinux para permitir acesso HTTP ao `/repo`**

### **Definir o contexto**

`semanage fcontext -a -t httpd_sys_content_t "/repo(/.*)?"`

➡️ _Informa ao SELinux que `/repo` será servido pelo Apache._

### **Aplicar o contexto**

`restorecon -Rv /repo`

➡️ _Reaplica os contextos corretos nos arquivos._

---

# 🚀 **9. Ativar e iniciar o serviço HTTPD**

`systemctl enable --now httpd`

➡️ _Ativa e inicia o Apache imediatamente._

---

# 🔥 **10. Liberar HTTP no firewall**

### Ativar:

`firewall-cmd --add-service=http`

### Permanente:

`firewall-cmd --add-service=http --permanent`


validar
systemctl status httpd

Agora atualizar url de repositorios

`vi /etc/yum.repos.d/AppStream.repo`
`vi /etc/yum.repos.d/BaseOS.repo`

Change baseurl
`baseurl=http://server1.example.com/BaseOS`
`baseurl=http://server1.example.com/ApStream`

Validar mundanças com

`dnf clean all`
`dnf repolist`
`dnf install -y nmap`


### Server 2

validar se esta configurado o dns de ambos server no /etc/hosts
![[Pasted image 20251126040442.png]]

Criar repositorios de instalação

`vi /etc/yum.repos.d/AppStream.repo`

Conteúdo:
```bash
[AppStream] 
name=AppStream 
baseurl=http://server1.example.com/AppStream 
gpgcheck=0`
```

`vi /etc/yum.repos.d/BaseOS.repo`

Conteúdo:
```bash
[AppStream] 
name=AppStream 
baseurl=http://server1.example.com/BaseOS
gpgcheck=0
```

dnf repolist

dnf install -y nmap

para finalizar desmontar a unidade 

