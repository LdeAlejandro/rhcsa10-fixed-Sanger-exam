
![[Pasted image 20251130002558.png]]



SERVER2

```bash
loginctl enable-linger chisha
ssh chisha@localhost

mkdir -p .config/systemd/user/
cd .config/systemd/user/
```

```bash
vi hello.service

[Unit]
Description=Write hello folks for syslog

[Service]
Type=oneshot
ExecStart=/usr/bin/logger "hello folks"

```

```bash
vi hello.timer
[Unit]
Description=Run hello.service Mon-Fri 2AM

[Timer]
OnCalendar=Mon..Fri *-*-* 02:00:00
Persistent=true
Unit=hello.service

[Install]
WantedBy=default.target
```

```bash
systemctl --user daemon-reload
systemctl --user enable --now hello.timer
systemctl --user list-timers hello.timer
```

