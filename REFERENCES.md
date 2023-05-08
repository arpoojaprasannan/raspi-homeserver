- Install Portainer
- Setup initial user

1. Container 
<!-- docker-swag + authelia + dashboard + cloudflare-real-ip + autoreload + autoproxy -->
<!-- guacamole (ssh client) -->
<!-- duckdns DDNS? -->
<!-- fractal gateway for reverse proxy -->
<!-- https://youtu.be/MPRLKtXt_lQ (Cloudflare WARP for teams) -->
<!-- https://www.reddit.com/r/WireGuard/comments/ejxkm3/wireguard_as_both_client_and_server/?utm_source=share&utm_medium=android_app&utm_name=androidcss&utm_term=1 -->

1. Download Management
    <!-- example config https://github.com/dmn001/youtube_channel_archiver/blob/master/yt-dlp.conf -->
    <!-- --match-filters "title ~= (?i)full\sspecial" -->
<!-- telegram downloader -->

1. Media Management
- jellyfin
- jellyseerr

- sonarr
- radarr
- bazarr
- prowlarr (instead of jackett)
- unpackerr
recyclarr (sync settings to sonarr and radarr automatically?)
tdarr

1. Books management
<!-- calibre + calibre-web Calibre use Desktop version -->
openbooks + lazylibrarian + readarr + mylar3 (manga)
kavita + tahciyomi (android client)
audiobookshelf + app (to download) + Smart audioplayer

1.  Notes
monica (personal CRM)
code-server (vscode on server)
trilium (notion)

1.  Other
HomeAssistant
mobile VPN on raspi
easy tether
https://databurst.medium.com/running-easytether-and-wireguard-on-a-raspberry-pi-4-3804a2bc9447
wget http://www.mobile-stream.com/beta/raspbian/9/easytether_0.8.9_armhf.deb
easytether:armhf depends on libbluetooth3 (>= 4.91).
easytether:armhf depends on libc6 (>= 2.16).
easytether:armhf depends on libssl1.1 (>= 1.1.0).
sudo nano /etc/network/interfaces.d/tun-easytether
```
allow-hotplug tun-easytether

iface tun-easytether inet static
	address 192.168.117.0
	netmask 255.255.255.254
	broadcast 255.255.255.255
	gateway 192.168.117.1
	mtu 1464
	post-up echo "nameserver 192.168.117.1" | /sbin/resolvconf -a tun-easytether
	pre-down /sbin/resolvconf -d tun-easytether
```

cal.com calendly alternative 
postal sendgrid alternative
listmonk mailchimp alternative 
activity watch 
changedetection.io
shlink vs yourls for custom url.shortner implementation 
docusaurus website builder + obsidian md editor

Leantime vs OpenProject (Project Manager)
Invoice Ninja (business series?)
Fider (Customer Suggestions?)
LittleLink (self hosted linktree alternative)

Mind mapping software obsidian vs xmind

Briefkasten bookmark manager
PiAlert + Apprise Notify
guacd
Lazytainer

Ghost blog (wordpress alternative)
Self hosted Bookmark Manager
Vandam STL Manager for managing 3D assets
Sendgrid for emails
Adobe fuse
Mixamo
Touch portal
Free .tube dns record
Retropie gaming (Supreme Duo)
Handbrake/Tdarr to reencode
Double commander vs Krusader vs Cloud Commander
MotionEye For Raspi (IPTV)
Portainer templates for self hosted (80+ docker compose)
Code server(vscode)

"---
version: ""3""

services:
db:
image: jsurf/rpi-mariadb:latest
environment:
MYSQL_ROOT_PASSWORD: monica
MYSQL_DATABASE: monica
MYSQL_USER: homestead
MYSQL_PASSWORD: secret
volumes:
- mysql:/var/lib/mysql
restart: always
ports:
- 3306:3306


phpmyadmin:
image: phpmyadmin
restart: always
ports:
- 8081:80
environment:
PMA_ARBITRARY: 1
PMA_HOST: db
depends_on:
- db

monica:
image: monica:latest
restart: always
environment:
DB_HOST: db
APP_TRUSTED_PROXIES: ""*""
ports:
- 8080:80
volumes:
- data:/var/www/html/storage
- /etc/timezone:/etc/timezone:ro
depends_on:
- db

cron:
image: monica
environment:
DB_HOST: db
APP_TRUSTED_PROXIES: ""*""
restart: always
volumes:
- data:/var/www/html/storage
command: cron.sh
depends_on:
- db

volumes:
mysql:
data:

version: ""3""

services:
mariadb:
image: wodby/mariadb
environment:
MYSQL_RANDOM_ROOT_PASSWORD: 1
MYSQL_USER: adminer
MYSQL_PASSWORD: adminer
MYSQL_DATABASE: adminer

adminer:
image: $IMAGE
depends_on:
- mariadb
environment:
ADMINER_DEFAULT_DB_DRIVER: mysql
ADMINER_DEFAULT_DB_HOST: mariadb
ADMINER_DEFAULT_DB_NAME: adminer
ADMINER_DESIGN: nette
ADMINER_PLUGINS: tables-filter tinymce
ports:
- 8080:9000
---

temp monitor on prometheus node exporter
Cloudflare service tokens + Cloudflare access rule
IFTTT + Google Assistant + Custom Webhook

Build your own Raspberry Pi Pirate Radio
Raspberry Pi DSLR Camera Control
Raspberry Pi Kiosk
Raspberry Pi LED Controller
Raspberry Pi Wireless-access-point + VPN
Raspberry Pi Captive Portal
webmin for administration of raspi using web interface

autobrr	Autobrr monitors IRC announce channels to get releases as soon as they are available with good filtering
changedetection-io	changedetection-io helm package
cryptpad	Free MSOffice/GoogleSheets alternative
dnsmadeeasy-webhook	Cert-Manager Webhook for DNSMadeEasy
esphome	ESPHome is a system to control your ESP8266/ESP32 by simple yet powerful configuration files and control them remotely through Home Automation systems.
focalboard	Focalboard is an open source, self-hosted project management alternative to Trello, Notion, and Asana.
freshrss	FreshRSS is a self-hosted RSS feed aggregator
gatus, uptime-kuma	
haste-server	Simple text sharing
home-assistant	Home Assistant
homebox 
Jitsi
komga	A comics/mangas server to serve/stream pages via API
lidarr	Looks and smells like Sonarr but made for music
littlelink-server	A lightweight open source alternative to linktree
miniflux	Miniflux is a minimalist and opinionated feed reader.
monica	A Personal Relationship Management tool to help you organize your social life
mosquitto	Eclipse Mosquitto - An open source MQTT broker
mqtt-exporter	Simple and generic Prometheus exporter for MQTT. Tested with Mosquitto MQTT and Xiaomi sensors.
ntfy+mobile app	Send push notifications to your phone or desktop using PUT/POST
owncast	Take control over your live stream video by running it yourself. Streaming + chat out of the box. (twitch/yt live alternative)
paperless	Paperless - Index and archive all of your scanned paper documents
shinobi, frigate, motioneye, zoneminder	NVR With Realtime Object Detection for IP Cameras
speedtest-exporter	Speedtest Exporter made in python using the official speedtest bin
theme-park	theme-park helm package
touchportal
Readarr: Book, Magazine, Comics Ebook and Audiobook Manager and Automation
Mylar3: Manages your comic library
Listrr: With listrr.pro, you can create personalized trakt.tv lists for tv shows and movies with a variety of different filters, and use them with your ultimate PLEX setup.
mdblist.com: listrr.pro alternative with scrapped movie ratings from imdb, tmdb, trakt, letterboxd, rottentomatoes and metacritics.
Traktarr: Add content to Radarr/Sonarr from Trakt.tv
Gaps: Gaps searches through your Plex Server or local folders for all movies, then queries for known movies in the same collection.
Pulsarr: Browser extension for adding movies to Radarr or Series' to Sonarr while browsing IMDB or TVDB.
Renovate scan on Github repo
cloudflare zero trust-bookmark
cloudflare email-bookmark
cloudflare -bookmark
https://annas-archive.org/
act - run github actions locally
apprise - notify
guacamole, bastillion - browser ssh
audiobookshelf - Audiobookshelf is a self-hosted audiobook and podcast server. 
authelia - SSO
authentik - authentik is an open-source Identity Provider focused on flexibility and versatility.
autobrr - 
baby buddy
shields.io - badges for open source projects
baserow - airtable database
browsh - text based browser
codimd - Collaborative Markdown sharing - alternative to Confluence https://github.com/hackmdio/codimd
crowdsec - Crowdsourced Firewall Rules
cryptpad - secure office suite
directus - instant SQL DB to API?
docspell vs paperless vs papermerge
draw.io - selfhosted miro alternative https://github.com/jgraph/docker-drawio
Dendron  obsidian 
retropie vs batocera
ESPHome - is a system to control your ESP8266

3. Docker compose merge files

Etherpad - real time collaboration self hosted notepad
Ferdium(open source alternative) Franz 5 - chat messenger aggregator (WA, Telegram, FB Messenger, Slack etc)
Forgejo - self hosted github
Mattermost - self hosted slack
Octoprint
FileBot - ultimate tv and anime renamer
Fileflows - automations on files and directories (like nodered)
Fleet - OSQuery manager (device fleet manager)

https://bing.com/?q=github+freeipa
https://bing.com/?q=github+freenas
https://bing.com/?q=github+freenom
https://bing.com/?q=github+freepbx
https://bing.com/?q=github+frigate
https://bing.com/?q=github+fronius
https://bing.com/?q=github+funkwhale
https://bing.com/?q=github+gameyfin
https://bing.com/?q=github+gaps
https://bing.com/?q=github+gatus
https://bing.com/?q=github+geckoview
https://bing.com/?q=github+gentoo
https://bing.com/?q=github+ghost
https://bing.com/?q=github+ghostfolio
https://bing.com/?q=github+gigaset
https://bing.com/?q=github+gitea
https://bing.com/?q=github+gladys-assistant
https://bing.com/?q=github+glances
https://bing.com/?q=github+glpi
https://bing.com/?q=github+goaccess
https://bing.com/?q=github+gogs
https://bing.com/?q=github+golang
https://bing.com/?q=github+grav
https://bing.com/?q=github+graylog
https://bing.com/?q=github+graylog-red
https://bing.com/?q=github+grist
https://bing.com/?q=github+grocy
https://bing.com/?q=github+hammond
https://bing.com/?q=github+handbrake
https://bing.com/?q=github+haproxy
https://bing.com/?q=github+harbor
https://bing.com/?q=github+hard-forum
https://bing.com/?q=github+harvester
https://bing.com/?q=github+hasura
https://bing.com/?q=github+hatsh
https://bing.com/?q=github+hdhomerun
https://bing.com/?q=github+headphones
https://bing.com/?q=github+helium-token
https://bing.com/?q=github+hetzner
https://bing.com/?q=github+hexo
https://bing.com/?q=github+hikvision
https://bing.com/?q=github+home-assistant
https://bing.com/?q=github+home-assistant-circle
https://bing.com/?q=github+homebox
https://bing.com/?q=github+homebridge
https://bing.com/?q=github+homepage
https://bing.com/?q=github+homer
https://bing.com/?q=github+homeseer
https://bing.com/?q=github+honeygain
https://bing.com/?q=github+hoppscotch
https://bing.com/?q=github+hubitat
https://bing.com/?q=github+huginn
https://bing.com/?q=github+hugo
https://bing.com/?q=github+humhub
https://bing.com/?q=github+hyperion
https://bing.com/?q=github+icecast
https://bing.com/?q=github+icinga
https://bing.com/?q=github+idrac
https://bing.com/?q=github+ihatemoney
https://bing.com/?q=github+ilo
https://bing.com/?q=github+immich
https://bing.com/?q=github+infoblox
https://bing.com/?q=github+instagram
https://bing.com/?q=github+inventree
https://bing.com/?q=github+invidious
https://bing.com/?q=github+invoiceninja
https://bing.com/?q=github+iobroker
https://bing.com/?q=github+ionos
https://bing.com/?q=github+ipboard
https://bing.com/?q=github+ipcamtalk
https://bing.com/?q=github+irc
https://bing.com/?q=github+iredmail
https://bing.com/?q=github+ispconfig
https://bing.com/?q=github+ispy
https://bing.com/?q=github+jeedom
https://bing.com/?q=github+jelu
https://bing.com/?q=github+jenkins
https://bing.com/?q=github+joal
https://bing.com/?q=github+joplin
https://bing.com/?q=github+julia
https://bing.com/?q=github+kaizoku
https://bing.com/?q=github+kamatera
https://bing.com/?q=github+kapacitor
https://bing.com/?q=github+kasm
https://bing.com/?q=github+kasm-workspaces
https://bing.com/?q=github+kaufland
https://bing.com/?q=github+keila
https://bing.com/?q=github+keycloak
https://bing.com/?q=github+kimai
https://bing.com/?q=github+kinto
https://bing.com/?q=github+kitana
https://bing.com/?q=github+kitchenowl
https://bing.com/?q=github+kiwix
https://bing.com/?q=github+ko-fi
https://bing.com/?q=github+koel
https://bing.com/?q=github+koillection
https://bing.com/?q=github+kopia
https://bing.com/?q=github+kotlin
https://bing.com/?q=github+kutt
https://bing.com/?q=github+lanraragi
https://bing.com/?q=github+leanote
https://bing.com/?q=github+leantime
https://bing.com/?q=github+lemonldapng
https://bing.com/?q=github+libreddit
https://bing.com/?q=github+librenms
https://bing.com/?q=github+librephotos
https://bing.com/?q=github+librespeed
https://bing.com/?q=github+librex
https://bing.com/?q=github+lidarr
https://bing.com/?q=github+lightning-terminal
https://bing.com/?q=github+lighttpd
https://bing.com/?q=github+linkace
https://bing.com/?q=github+linkding
https://bing.com/?q=github+linuxserver-io
https://bing.com/?q=github+listmonk
https://bing.com/?q=github+lnbits
https://bing.com/?q=github+logitech
https://bing.com/?q=github+logitech-gaming
https://bing.com/?q=github+logitech-legacy
https://bing.com/?q=github+logstash
https://bing.com/?q=github+loki
https://bing.com/?q=github+longhorn
https://bing.com/?q=github+lsio
https://bing.com/?q=github+lua
https://bing.com/?q=github+lychee
https://bing.com/?q=github+mailcow
https://bing.com/?q=github+mailcowsogo
https://bing.com/?q=github+mailhog
https://bing.com/?q=github+mailinabox
https://bing.com/?q=github+mailu
https://bing.com/?q=github+mainsail
https://bing.com/?q=github+mak
https://bing.com/?q=github+manjaro
https://bing.com/?q=github+mantisbt
https://bing.com/?q=github+marginalia
https://bing.com/?q=github+mariadb
https://bing.com/?q=github+mastodon
https://bing.com/?q=github+matomo
https://bing.com/?q=github+matrix
https://bing.com/?q=github+matrix-synapse
https://bing.com/?q=github+mattermost
https://bing.com/?q=github+mayanedms
https://bing.com/?q=github+mcmyadmin
https://bing.com/?q=github+mealie
https://bing.com/?q=github+mediathekview
https://bing.com/?q=github+mediawiki
https://bing.com/?q=github+medusa
https://bing.com/?q=github+mega-nz
https://bing.com/?q=github+memos
https://bing.com/?q=github+mempool
https://bing.com/?q=github+meraki
https://bing.com/?q=github+mercusys
https://bing.com/?q=github+meshcentral
https://bing.com/?q=github+metabase
https://bing.com/?q=github+metube
https://bing.com/?q=github+microbin
https://bing.com/?q=github+microsoft-365
https://bing.com/?q=github+microsoft-todo
https://bing.com/?q=github+mikrotik
https://bing.com/?q=github+minecraft
https://bing.com/?q=github+mineos
https://bing.com/?q=github+miniflux
https://bing.com/?q=github+minio
https://bing.com/?q=github+mkdocs
https://bing.com/?q=github+mobaxterm
https://bing.com/?q=github+mobotix
https://bing.com/?q=github+mojeek
https://bing.com/?q=github+molecule
https://bing.com/?q=github+mongodb
https://bing.com/?q=github+monica
https://bing.com/?q=github+monit
https://bing.com/?q=github+moodle
https://bing.com/?q=github+motioneye
https://bing.com/?q=github+mpm
https://bing.com/?q=github+mqtt
https://bing.com/?q=github+mstream
https://bing.com/?q=github+musicbrainz
https://bing.com/?q=github+mylar
https://bing.com/?q=github+mysql
https://bing.com/?q=github+n8n
https://bing.com/?q=github+nagios
https://bing.com/?q=github+navidrome
https://bing.com/?q=github+ncore
https://bing.com/?q=github+neko
https://bing.com/?q=github+neocities
https://bing.com/?q=github+nessus
https://bing.com/?q=github+netapp
https://bing.com/?q=github+netatmo
https://bing.com/?q=github+netboot
https://bing.com/?q=github+netbootxyz
https://bing.com/?q=github+netbox
https://bing.com/?q=github+netcam-studio
https://bing.com/?q=github+netdata
https://bing.com/?q=github+netgear
https://bing.com/?q=github+netlify
https://bing.com/?q=github+netmaker
https://bing.com/?q=github+network-weathermap
https://bing.com/?q=github+newsblur
https://bing.com/?q=github+nextdns
https://bing.com/?q=github+nitter
https://bing.com/?q=github+nocodb
https://bing.com/?q=github+node.js
https://bing.com/?q=github+nodejs-alt
https://bing.com/?q=github+nodered
https://bing.com/?q=github+nomad
https://bing.com/?q=github+nomie
https://bing.com/?q=github+notifiarr
https://bing.com/?q=github+nowshowing
https://bing.com/?q=github+ntfy
https://bing.com/?q=github+ntop
https://bing.com/?q=github+nxfilter
https://bing.com/?q=github+nxlog
https://bing.com/?q=github+nzbget
https://bing.com/?q=github+nzbhydra
https://bing.com/?q=github+obico
https://bing.com/?q=github+obitalk
https://bing.com/?q=github+observium
https://bing.com/?q=github+octoeverywhere
https://bing.com/?q=github+olivetin
https://bing.com/?q=github+omada
https://bing.com/?q=github+ombi
https://bing.com/?q=github+omnidb
https://bing.com/?q=github+onedev
https://bing.com/?q=github+onlyoffice
https://bing.com/?q=github+openeats
https://bing.com/?q=github+openhab
https://bing.com/?q=github+openmaptiler
https://bing.com/?q=github+openmediavault
https://bing.com/?q=github+opensearch
https://bing.com/?q=github+openspeedtest
https://bing.com/?q=github+opensprinkler
https://bing.com/?q=github+opensuse
https://bing.com/?q=github+oracle-cloud
https://bing.com/?q=github+organizr
https://bing.com/?q=github+oscarr
https://bing.com/?q=github+osticket
https://bing.com/?q=github+outline
https://bing.com/?q=github+overclockers
https://bing.com/?q=github+overseerr
https://bing.com/?q=github+ovh
https://bing.com/?q=github+ovirt
https://bing.com/?q=github+owncloud
https://bing.com/?q=github+ownphotos
https://bing.com/?q=github+pagerduty
https://bing.com/?q=github+pale-moon
https://bing.com/?q=github+paloaltonetworks
https://bing.com/?q=github+paperless
https://bing.com/?q=github+paperless-ng
https://bing.com/?q=github+papermerge
https://bing.com/?q=github+partkeepr
https://bing.com/?q=github+pastatool
https://bing.com/?q=github+pastey
https://bing.com/?q=github+peertube
https://bing.com/?q=github+petio
https://bing.com/?q=github+pfsense
https://bing.com/?q=github+pgadmin
https://bing.com/?q=github+phantombot
https://bing.com/?q=github+photonix
https://bing.com/?q=github+photoprism
https://bing.com/?q=github+photostructure
https://bing.com/?q=github+photoview
https://bing.com/?q=github+php
https://bing.com/?q=github+phpipam
https://bing.com/?q=github+phpldapadmin
https://bing.com/?q=github+phpmyadmin
https://bing.com/?q=github+pi-alert
https://bing.com/?q=github+pi-alert-dark
https://bing.com/?q=github+piaware
https://bing.com/?q=github+pihole
https://bing.com/?q=github+pihole-unbound
https://bing.com/?q=github+pikvm
https://bing.com/?q=github+pingdom
https://bing.com/?q=github+pivpn
https://bing.com/?q=github+piwigo
https://bing.com/?q=github+pixelfed
https://bing.com/?q=github+planka
https://bing.com/?q=github+plausible
https://bing.com/?q=github+pleroma
https://bing.com/?q=github+plesk
https://bing.com/?q=github+plex
https://bing.com/?q=github+plex-new
https://bing.com/?q=github+plex-new-transparent
https://bing.com/?q=github+plex-square
https://bing.com/?q=github+plexdrive
https://bing.com/?q=github+plexrequests
https://bing.com/?q=github+plume
https://bing.com/?q=github+podify
https://bing.com/?q=github+poly
https://bing.com/?q=github+polycom
https://bing.com/?q=github+polycom-alt
https://bing.com/?q=github+polywork
https://bing.com/?q=github+portainer
https://bing.com/?q=github+portainer-v2
https://bing.com/?q=github+portus
https://bing.com/?q=github+poste
https://bing.com/?q=github+postgres
https://bing.com/?q=github+powerdns
https://bing.com/?q=github+powerpanel
https://bing.com/?q=github+premium-mobile
https://bing.com/?q=github+premium-mobile-v1
https://bing.com/?q=github+premium-mobile-v2
https://bing.com/?q=github+printer
https://bing.com/?q=github+pritunl
https://bing.com/?q=github+privacyidea
https://bing.com/?q=github+private-internet-access
https://bing.com/?q=github+privatebin
https://bing.com/?q=github+projectsend
https://bing.com/?q=github+prometheus
https://bing.com/?q=github+prowlarr
https://bing.com/?q=github+proxmox
https://bing.com/?q=github+prtg
https://bing.com/?q=github+psitransfer
https://bing.com/?q=github+pterodactyl
https://bing.com/?q=github+pufferpanel
https://bing.com/?q=github+pushfish
https://bing.com/?q=github+pushover
https://bing.com/?q=github+putty
https://bing.com/?q=github+pwndrop
https://bing.com/?q=github+pwpush
https://bing.com/?q=github+pydio
https://bing.com/?q=github+pyload
https://bing.com/?q=github+python
https://bing.com/?q=github+qbittorrent
https://bing.com/?q=github+qinglong
https://bing.com/?q=github+qnap
https://bing.com/?q=github+quant-ux
https://bing.com/?q=github+r
https://bing.com/?q=github+rabbitmq
https://bing.com/?q=github+radarr
https://bing.com/?q=github+radicale
https://bing.com/?q=github+rainloop
https://bing.com/?q=github+rancher
https://bing.com/?q=github+raneto
https://bing.com/?q=github+raritan
https://bing.com/?q=github+raspberrymatic
https://bing.com/?q=github+raspberrypi
https://bing.com/?q=github+rathole
https://bing.com/?q=github+rclone
https://bing.com/?q=github+rdt-client
https://bing.com/?q=github+readarr
https://bing.com/?q=github+readthedocs
https://bing.com/?q=github+real-debrid
https://bing.com/?q=github+recalbox
https://bing.com/?q=github+recipesage
https://bing.com/?q=github+reddit
https://bing.com/?q=github+redis
https://bing.com/?q=github+remotely
https://bing.com/?q=github+requestrr
https://bing.com/?q=github+resiliosync
https://bing.com/?q=github+rhasspy
https://bing.com/?q=github+rhodecode
https://bing.com/?q=github+riot
https://bing.com/?q=github+rocketchat
https://bing.com/?q=github+rocky-linux
https://bing.com/?q=github+rompya
https://bing.com/?q=github+rook
https://bing.com/?q=github+roundcube
https://bing.com/?q=github+router
https://bing.com/?q=github+rpi-monitor
https://bing.com/?q=github+rport
https://bing.com/?q=github+rspamd
https://bing.com/?q=github+rss-bridge
https://bing.com/?q=github+rsshub
https://bing.com/?q=github+rstudioserver
https://bing.com/?q=github+ruby
https://bing.com/?q=github+rundeck
https://bing.com/?q=github+runeaudio
https://bing.com/?q=github+runonflux
https://bing.com/?q=github+runonflux-mark-blue
https://bing.com/?q=github+rust
https://bing.com/?q=github+rustdesk
https://bing.com/?q=github+rutorrent
https://bing.com/?q=github+sabnzbd
https://bing.com/?q=github+sabnzbd-text
https://bing.com/?q=github+safari-ios
https://bing.com/?q=github+sagemcom
https://bing.com/?q=github+samsung-internet
https://bing.com/?q=github+sandstorm
https://bing.com/?q=github+scrutiny
https://bing.com/?q=github+scrypted
https://bing.com/?q=github+seafile
https://bing.com/?q=github+searxmetasearchengine
https://bing.com/?q=github+searxng
https://bing.com/?q=github+security-onion
https://bing.com/?q=github+selfhosted
https://bing.com/?q=github+sendinblue
https://bing.com/?q=github+sensu-green
https://bing.com/?q=github+sensu-logo
https://bing.com/?q=github+servarr
https://bing.com/?q=github+serviio
https://bing.com/?q=github+shaarli
https://bing.com/?q=github+shell
https://bing.com/?q=github+shellhub
https://bing.com/?q=github+shellngn
https://bing.com/?q=github+shelly
https://bing.com/?q=github+shinobi
https://bing.com/?q=github+shiori
https://bing.com/?q=github+shlink
https://bing.com/?q=github+SHODAN
https://bing.com/?q=github+shoko
https://bing.com/?q=github+sickbeard
https://bing.com/?q=github+sickchill
https://bing.com/?q=github+sickgear
https://bing.com/?q=github+silverbullet
https://bing.com/?q=github+simplelogin
https://bing.com/?q=github+sinusbot
https://bing.com/?q=github+siyuan
https://bing.com/?q=github+skylink-fibernet
https://bing.com/?q=github+skype
https://bing.com/?q=github+slack
https://bing.com/?q=github+smokeping
https://bing.com/?q=github+snapdrop
https://bing.com/?q=github+snibox
https://bing.com/?q=github+snipe-it
https://bing.com/?q=github+snipe-it-alt
https://bing.com/?q=github+snippetbox
https://bing.com/?q=github+sogo
https://bing.com/?q=github+solid-invoice
https://bing.com/?q=github+sonarqube
https://bing.com/?q=github+sonarr
https://bing.com/?q=github+soulseek
https://bing.com/?q=github+sourcegraph
https://bing.com/?q=github+spamassassin
https://bing.com/?q=github+sparkleshare
https://bing.com/?q=github+specter-desktop
https://bing.com/?q=github+speedtest-tracker
https://bing.com/?q=github+sphinx-doc
https://bing.com/?q=github+sphinx-relay
https://bing.com/?q=github+splunk
https://bing.com/?q=github+spotify
https://bing.com/?q=github+spotweb
https://bing.com/?q=github+sqlitebrowser
https://bing.com/?q=github+squidex
https://bing.com/?q=github+sshwifty
https://bing.com/?q=github+startpage
https://bing.com/?q=github+stash
https://bing.com/?q=github+statping
https://bing.com/?q=github+storj
https://bing.com/?q=github+strapi
https://bing.com/?q=github+streama
https://bing.com/?q=github+supermicro
https://bing.com/?q=github+swift
https://bing.com/?q=github+swizzin
https://bing.com/?q=github+symmetricom
https://bing.com/?q=github+sympa
https://bing.com/?q=github+syncany
https://bing.com/?q=github+synclounge
https://bing.com/?q=github+syncthing
https://bing.com/?q=github+synology
https://bing.com/?q=github+synology-audio-station
https://bing.com/?q=github+synology-calendar
https://bing.com/?q=github+synology-chat
https://bing.com/?q=github+synology-contacts
https://bing.com/?q=github+synology-download-station
https://bing.com/?q=github+synology-drive
https://bing.com/?q=github+synology-drive-app
https://bing.com/?q=github+synology-dsm
https://bing.com/?q=github+synology-filestation
https://bing.com/?q=github+synology-note-station
https://bing.com/?q=github+synology-photo-station
https://bing.com/?q=github+synology-photos
https://bing.com/?q=github+synology-surveillance-station
https://bing.com/?q=github+synology-video-station
https://bing.com/?q=github+taiga
https://bing.com/?q=github+tailscale
https://bing.com/?q=github+tandoorrecipes
https://bing.com/?q=github+tanoshi
https://bing.com/?q=github+tar1090
https://bing.com/?q=github+taskcafe
https://bing.com/?q=github+tasmoadmin
https://bing.com/?q=github+tasmota
https://bing.com/?q=github+tautulli
https://bing.com/?q=github+tdarr
https://bing.com/?q=github+technitium
https://bing.com/?q=github+teedy
https://bing.com/?q=github+telegraf
https://bing.com/?q=github+telegram
https://bing.com/?q=github+teleport
https://bing.com/?q=github+tenda
https://bing.com/?q=github+terraform
https://bing.com/?q=github+teslamate
https://bing.com/?q=github+thanos
https://bing.com/?q=github+theia
https://bing.com/?q=github+thelounge
https://bing.com/?q=github+thunderhub
https://bing.com/?q=github+timemachines
https://bing.com/?q=github+timetagger
https://bing.com/?q=github+tinypilot
https://bing.com/?q=github+tinytinyrss
https://bing.com/?q=github+tipi
https://bing.com/?q=github+todoist
https://bing.com/?q=github+tooljet
https://bing.com/?q=github+tplink
https://bing.com/?q=github+traccar
https://bing.com/?q=github+traefik
https://bing.com/?q=github+trakt
https://bing.com/?q=github+transmission
https://bing.com/?q=github+trilium
https://bing.com/?q=github+truenas
https://bing.com/?q=github+truenas-enterprise
https://bing.com/?q=github+truenas-scale
https://bing.com/?q=github+truenascore
https://bing.com/?q=github+tube-archivist
https://bing.com/?q=github+tubearchivist
https://bing.com/?q=github+tubesync
https://bing.com/?q=github+tux
https://bing.com/?q=github+tvheadend
https://bing.com/?q=github+tvp-vod
https://bing.com/?q=github+twitch
https://bing.com/?q=github+twitter
https://bing.com/?q=github+typescript
https://bing.com/?q=github+typo3
https://bing.com/?q=github+ubiquiti
https://bing.com/?q=github+ubiquiti-networks
https://bing.com/?q=github+ubooquity
https://bing.com/?q=github+ubuntu
https://bing.com/?q=github+ubuntu-alt
https://bing.com/?q=github+uc
https://bing.com/?q=github+udemy-learning
https://bing.com/?q=github+ultimateguitar
https://bing.com/?q=github+umbrel
https://bing.com/?q=github+unami
https://bing.com/?q=github+unifi
https://bing.com/?q=github+unifi-controller
https://bing.com/?q=github+unifi-protect
https://bing.com/?q=github+unificontroller
https://bing.com/?q=github+uninterruptible-power-supply
https://bing.com/?q=github+universal-media-server
https://bing.com/?q=github+unmanic
https://bing.com/?q=github+unraid
https://bing.com/?q=github+untangle
https://bing.com/?q=github+updog
https://bing.com/?q=github+upsnap
https://bing.com/?q=github+uptime-kuma
https://bing.com/?q=github+urbackup
https://bing.com/?q=github+valetudo
https://bing.com/?q=github+vault
https://bing.com/?q=github+vaultwarden
https://bing.com/?q=github+veeam
https://bing.com/?q=github+verizon
https://bing.com/?q=github+vi
https://bing.com/?q=github+vikunja
https://bing.com/?q=github+virtualmin
https://bing.com/?q=github+virtualradarserver
https://bing.com/?q=github+vmware
https://bing.com/?q=github+vmwareesxi
https://bing.com/?q=github+vmwarehorizon
https://bing.com/?q=github+vmwarevcenter
https://bing.com/?q=github+voip-info
https://bing.com/?q=github+voip-ms
https://bing.com/?q=github+volumio
https://bing.com/?q=github+voron
https://bing.com/?q=github+vscode
https://bing.com/?q=github+vultr
https://bing.com/?q=github+vuplus
https://bing.com/?q=github+wakapi
https://bing.com/?q=github+wallabag
https://bing.com/?q=github+wanikani
https://bing.com/?q=github+ward
https://bing.com/?q=github+watcher
https://bing.com/?q=github+watchtower
https://bing.com/?q=github+watchyourlan
https://bing.com/?q=github+wazuh
https://bing.com/?q=github+wbo
https://bing.com/?q=github+webdav
https://bing.com/?q=github+webhook
https://bing.com/?q=github+webhookd
https://bing.com/?q=github+webkit
https://bing.com/?q=github+webmin
https://bing.com/?q=github+webtools
https://bing.com/?q=github+webtop
https://bing.com/?q=github+webtorrent
https://bing.com/?q=github+wekan
https://bing.com/?q=github+wetty
https://bing.com/?q=github+wger
https://bing.com/?q=github+wggenweb
https://bing.com/?q=github+whatsapp
https://bing.com/?q=github+whisparr
https://bing.com/?q=github+whoami
https://bing.com/?q=github+whooglesearch
https://bing.com/?q=github+wikijs
https://bing.com/?q=github+windows-11
https://bing.com/?q=github+windows-7
https://bing.com/?q=github+windows-95
https://bing.com/?q=github+windows-98
https://bing.com/?q=github+windows-admin-center
https://bing.com/?q=github+windows-vista
https://bing.com/?q=github+windows-xp
https://bing.com/?q=github+wireguard
https://bing.com/?q=github+wizarr
https://bing.com/?q=github+wled
https://bing.com/?q=github+woodpecker-ci
https://bing.com/?q=github+wordpress
https://bing.com/?q=github+workadventure
https://bing.com/?q=github+xbackbone
https://bing.com/?q=github+xbrowsersync
https://bing.com/?q=github+xcp-ng
https://bing.com/?q=github+xen-orchestra
https://bing.com/?q=github+xenorchestra
https://bing.com/?q=github+xigmanas
https://bing.com/?q=github+xmrig
https://bing.com/?q=github+xteve
https://bing.com/?q=github+xwiki
https://bing.com/?q=github+yacht
https://bing.com/?q=github+yahoo
https://bing.com/?q=github+yahoo-mail
https://bing.com/?q=github+yandex
https://bing.com/?q=github+yarn-social
https://bing.com/?q=github+ymarks
https://bing.com/?q=github+ynab
https://bing.com/?q=github+yourls
https://bing.com/?q=github+yunohost
https://bing.com/?q=github+zabbix
https://bing.com/?q=github+zabka
https://bing.com/?q=github+zammad
https://bing.com/?q=github+zendesk
https://bing.com/?q=github+zerotier
https://bing.com/?q=github+zigbee2mqtt
https://bing.com/?q=github+zipline
https://bing.com/?q=github+znc
https://bing.com/?q=github+zohomail
https://bing.com/?q=github+zoneminder
https://bing.com/?q=github+zulip
https://bing.com/?q=github+zwavejs
https://bing.com/?q=github+zwavejs2mqtt
