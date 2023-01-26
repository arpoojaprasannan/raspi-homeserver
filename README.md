## OS Setup
- Using Raspi Imager Flash Raspbian Lite 64 Bit + Setup SSH & Wifi

## Infra Setup
- Run command copy `~/.ssh/id_rsa.pub` to authorized_keys within the Raspi and passwordless SSH with private key
  ```
  RASPI_IP=
  ssh-copy-id pi@${RASPI_IP}
  ```
- Clone repo, update the IP address, username and ssh_key path in [inventory.yml](./ansible/inventory.yml)
  ```zsh
  cd ansible
  ansible-playbook infra/playbook.yml
  # APT Upgrade
  # Install dependencies
  # Install Docker 
  # Install Docker-compose
  # Install PIP dependencies
  ```

## Run Services
- Run Docker Services in the order
  1. wirehole
  2. samba
  3. API Key for Sonarr, Radarr, Prowlarr
  4. Aria2Remote, Qbittorrent Controller mobile apps

## Update HTTP(s) endpoints to homer, uptime-kuma, and cloudflare tunnel container, and cloudflare terraform for DNS