
![[Pasted image 20251130045618.png]]

```bash
mkdir /root/sugidfiles
find /usr -perm /6000 -size -100k
find /usr -perm /6000 -size -100k -exec cp {} /root/sugidfiles/ \;
ls /root/sugidfiles/ 
```