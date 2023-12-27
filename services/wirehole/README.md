- Adlists = https://firebog.net/
- https://v.firebog.net/hosts/lists.php
- Whitelist = https://discourse.pi-hole.net/t/commonly-whitelisted-domains/212
```bash
# youtube history
pihole -w s.youtube.com 
pihole -w video-stats.l.google.com
```
- Add DNS Record `A in mijnmodem.kpn - 192.168.2.254`