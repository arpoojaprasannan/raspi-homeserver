# Homeserver project on raspberry pi - Documentation

## Setting up OS
- To get a minimal install of Raspberry Pi OS download the Raspberry Pi OS (64-bit) Lite image.
- Download and install Raspberry Pi Imager to a computer with an SD card reader - https://www.raspberrypi.com/software/
- To install an operating system using Raspberry Pi Imager - https://www.youtube.com/watch?v=ntaXWS8Lk34

## Create github repo
- Click on the + on top right corner.Enter a name and create repository.
- In your local machine, create a new folder
- From that folder run the following commands
  ```bash
  git init
  git remote add origin <github-repo-url>
  # Create files
  # Add and commit files
  git push -u origin <branch>
  ```
## Adding Collaborators to github
- Go to your repository
- Go to `Settings` tab and select `Collaborators` from left pane
- Click on `Add people` and invite github users

## Create readme
- Create a new file `README.md`
- Add content and commit to git using
  ```bash
  git add .
  # git add <filename>
  git commit -m "<message>"
  git push -u origin <branch>
  ```
## ssh into raspi
- Use the command
  ```bash
  ssh <username>@<hostname/host_ip>
  # if not using the default key at ~/.ssh/id_rsa, use the below command
  ssh -i <path/to/key> <username>@<hostname/host_ip>
  ```
- Enter password

## Install ansible in windows
- There are multiple methods - the easiest is to use `Cygwin`.
- Download the installer and select `ansible` from the list of packages

## Passwordless authentication for ssh
- We need to generate a key-pair using command
  ```bash
  ssh-keygen
  ```
- You can manually copy the public key and add it to the file at `~/.ssh/authorized_keys` (remote) as one method or run below command to copy the default public key at `~/.ssh/id_rsa.pub` (local) 
  ```bash
  ssh-copy-id <username>@<hostname/host_ip>
  ```
## Configure Cygwin as VSCode integrated terminal
- add vscode workspace settings at [.vscode/settings.json](.vscode/settings.json) for cygwin as integrated terminal
  ```json
   "terminal.integrated.shell.windows": "C:\\cygwin64\\bin\\bash.exe"
   "terminal.integrated.env.windows": {
    "CHERE_INVOKING": "1"
    },
   "terminal.integrated.shellArgs.windows": ["--login", "-i"],
  ```
## Add ansible inventory
- Created an `inventory.ini` file 
- Created groups, variables, username, private key file, python interpreter
  ```ini
  [<group_name>]
  <hostname/host_ip>

  [<group_name>:vars]
  ansible_user=
  ansible_ssh_private_key_file=
  ansible_python_interpreter=
  ```
## Ping and test ansible
```bash
   ansible -i <path/to/inventory.ini> -m ping <group/hostname>
```
## Gather facts from remote host
- Facts are variables that are set by ansible based on the capabilities on the remote host
- In playbooks, `gather_facts` key can be used to enable or disable this action
- Facts may be useful for specific tasks to dynamically populate values based on the remote host
- To manually gather facts one can use 
  ```bash
   ansible -i <path/to/inventory.ini> -m setup <group/hostname>
  ```
## Create ansible config file
- To simplify ansible commands and not pass `-i <path/to/inventory>` each time we can create a `ansible.cfg` file at the path where we are running the ansible commands
- To set the default inventory file use the following:
  ```ini
  [defaults]
  inventory = <path/to/inventory.ini>
  ```
## apt update and upgrade using ansible  
- Create tasks to update and upgrade apt packages
```ansible
    name: Update and upgrade apt packages
    become: true
    apt:
      upgrade: "yes"
      update_cache: true
      cache_valid_time: 86400 #One day
      force_apt_get: true
```
## Create role to install docker and docker compose using ansible
- Created based on samples from [geerlinguy.docker](https://github.com/geerlingguy/ansible-role-docker) ansible role
- Also refer [docker reference](https://docs.docker.com/engine/install/debian/)

## Found ansible module for docker-compose > 1.7.0 (latest version - 2.14.2), identified pre-requisites 
- [Ansible module reference](https://docs.ansible.com/ansible/2.9/modules/docker_compose_module.html)
- Identified Docker SDK for Python, PyYAML and docker-compose 

## Role for pip install `docker`, `docker-compose` and `pyyaml` 
- based out of https://github.com/geerlingguy/ansible-role-pip/blob/master/tasks/main.yml
  ```bash
  - name: Ensure pip_install_packages are installed.
    pip:
        name:
        - docker
        - PyYAML
        - docker-compose
        state: latest
        executable: "{{ pip_executable }}"

  ```
## Write custom roles for aptupgrade, docker, docker-compose and pip install (needed for docker-compose module)  
- To create a role, we need a `roles` folder in the same level as the playbook
- For each role create a new folder as the role name within the `roles` folder
- For a role we need at least two folders `meta` and `tasks` 
- The `meta` folder contains the `main.yml` file with license and author details
  ```yaml
  galaxy_info:
    author: Pooja
    description: Raspi Docker Install Role
    company: Home
    license: MIT
    min_ansible_version: "2.4"
    galaxy_tags: []
  dependencies: []
  ```
- The `tasks` folder contains the `main.yml` and potentially other yaml files which may be included in the `main.yml` file.This contains the tasks that are executed when the role is invoked.
- Optionally there could be `defaults` folder with all the variables used by the role that can be overwritten by the playbooks and there could be `handlers` folder for handlers that the task can notify

## run playbook with roles 
- To use the roles in the playbook they were included as shown:
  ```yaml
  roles:
    - <rolename1>
    - <rolename2>
  ```
- they were executed using the command `ansible-playbook playbook.yml`
## error with docker service
- tried `sudo apt install --reinstall raspberrypi-bootloader raspberrypi-kernel` 
- rebooted server (ssh and sudo reboot) and issue was fixed  

## Create sample docker compose
- Used a sample httpbin docker-compose yaml.
  ```yaml
  version: "3.9"
  services:
    httpbin:
      image: kong/httpbin
      container_name: httpbin
      ports:
        - "80:80"

  ```
## Create an ansible role for running docker-compose services
- Created a `roles` folder and a `compose` folder with the required tasks and meta folders
- In the tasks folder created a `main.yml` that includes the tasks to copy the `docker-compose.yml` and run it using `docker-compose` ansible module
- The source and destination of the copy module uses variables that are defined in the `defaults` folder
  
## run sample compose yaml on raspi using ansible and docker compose
- In the playbook, the role is included using the `include_role` module and looped with a services array containing the name of all the docker compose services we want to deploy 
  ```yaml
    - name: Install all Services
      include_role:
        name: compose
      with_items: "{{ services }}"
      loop_control:
        loop_var: service
  ```
