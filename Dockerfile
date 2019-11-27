FROM centos:latest
Maintainer John Shea <johshea@cisco.com>

RUN yum update -y && yum install -y  epel-release && yum install -y nodejs npm && yum install -y ansible && yum install -y git  && yum install -y sudo && yum install -y curl && yum install -y wget && yum install -y python3 && yum install -y nano && yum update -y

#add our non root user & group
RUN groupadd -r devnet -g 1000 && useradd -m devnet --uid=1000 -g devnet && echo "devnet:devnet" | \
      chpasswd
#add devnet user to wheel for sudo
RUN usermod -a -G wheel devnet

#RUN /bin/bash chmod go+rwx /home/devnet  

#set the working directory
WORKDIR /home/devnet

#create a persistant volume in devnet and set permissions
#RUN mkdir /home/devnet/data && chown devnet /home/devnet/data
#VOLUME /home/devnet/data

RUN pip3 install urllib3 && pip3 install meraki && pip3 install webexteamssdk && pip3 install paramiko && pip3 install pprint && pip3 install ipython &&  pip3 install datetime && pip3 install virtualenv

#select the user to execute all commands
USER devnet


#Clone git repositories for offline use
RUN  git clone https://github.com/CiscoDevNet/dnav3-code.git /home/devnet/dnac && git clone https://github.com/CiscoDevNet/devnet-express-code-samples.git /home/devnet/samples && git clone https://github.com/CiscoDevNet/dciv2-code.git /home/devnet/dci

