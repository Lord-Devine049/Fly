FROM ubuntu:24.04

RUN apt update && apt install -y \
    docker.io \
    openssh-server \
    curl \
    sudo

RUN mkdir /var/run/sshd
RUN echo 'root:00123NIGHT' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD service docker start && /usr/sbin/sshd -D
