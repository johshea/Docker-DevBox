# Docker-DevBox
Experimental use of a docker container to act as a development platform

# Requirments:
1. Docker CE / Compose
2. Persistant data volume - docker volume create <volume name>
  
# Running Dev-Box
1. Place the dockerfile in the director
2. from the cli compile the dockerfile via docker build -t devnet .
3. launch the box with docker run -ti --mount source=<volume name>,target=/home/devnet/data devnet
  *note replace <name> with the name you gave your persistant volume
  
# Installed APPS
1. Curl
2. Wget
3. Python 3.6
4. PIP
5. Ansible
6. sudo

# Installed Python Libraries
1. virtualenv
2. urllib3
3. meraki
4. pprint
5. datetime
6. webexteamssdk
