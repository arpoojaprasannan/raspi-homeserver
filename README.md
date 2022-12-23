# Homeserver project on raspberry pi

## TODO

- [x] raspberrypi os setup  
- [x] create github repo  
- [x] add collaborators  
- [x] create readme and todo list  
- [x] ssh into raspi  
- [x] install ansible in cygwin  
- [x] ssh-keygen to generate keypair 
- [x] ssh-copy-id to raspi  
- [x] copy private key and set .gitignore  
- [x] add vscode workspace settings at [.vscode/settings.json](.vscode/settings.json) for cygwin as integrated terminal  
- [x] add ansible inventory  
- [x] ansible ping test to raspi  
- [x] ansible command to gather facts from remote host  
- [x] add ansible config  
- [x] task to apt update and upgrade using ansible  
- [x] role to install docker using ansible  
- [x] role to install docker compose using ansible  
- [x] found ansible module for docker-compose > 1.7.0 (latest version - 2.14.2), identified pre-requisites  
- [x] task for pip install `docker` and `pyyaml`   
- [x] write custom roles for aptupgrade, docker, docker-compose and pip install (needed for docker-compose module)  
- [x] run playbook with roles - error with docker service, tried `sudo apt install --reinstall raspberrypi-bootloader raspberrypi-kernel`  
- [x] rebooted server (ssh and sudo reboot) and issue was fixed  
- [x] create sample docker compose  
- [x] run sample compose yaml on raspi using ansible and docker compose  
- [ ] Auto populate services array in playbook based on the directories at a specified path
