FROM amazonlinux:2
#https://hub.docker.com/_/amazonlinux

MAINTAINER Gonzalo del Castillo <gonzalo.delcastillo@digitas.com>>

RUN yum -y install python python-pip procps groupinfo sudo openssh openssh-server openssh-clients && yum -y clean all

RUN useradd -rm -d /home/ec2-user -s /bin/bash -g root -u 1000 ec2-user
RUN usermod -aG wheel ec2-user 
RUN sed -i 's/^%\(wheel.*\)/#%\1/' /etc/sudoers && sed -i 's/^#\s\(%wheel.*\)/\1/' /etc/sudoers && sed -i 's/#\(PubkeyAuthentication\syes\)/\1/' /etc/ssh/sshd_config 



RUN mkdir -p /home/ec2-user/.ssh
COPY id_rsa /home/ec2-user/.ssh/
COPY id_rsa.pub /home/ec2-user/.ssh/

RUN /usr/bin/ssh-keygen -A && \
    chmod 700 /home/ec2-user/.ssh && \
    chmod 600 /home/ec2-user/.ssh/id_rsa && \
    chmod 600 /home/ec2-user/.ssh/id_rsa.pub && \
    cp -a /home/ec2-user/.ssh/id_rsa.pub /home/ec2-user/.ssh/authorized_keys && \
    chown -R ec2-user /home/ec2-user/.ssh

ENTRYPOINT ["/usr/sbin/sshd", "-D"]

#USER ec2-user
#WORKDIR /home/ec2-user 

