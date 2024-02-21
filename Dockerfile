FROM almalinux:9

RUN dnf update -y

RUN dnf groupinstall -y GNOME
RUN dnf install -y tigervnc-server
RUN dnf install -y epel-release
RUN dnf --enablerepo=epel -y install xrdp
RUN dnf install -y vim passwd

RUN echo 1234 | passwd --stdin root

RUN groupadd -g 1000 abc
RUN useradd --uid 1000 --gid 1000 --shell /bin/bash -G abc abc
RUN echo 1234 | passwd --stdin abc
