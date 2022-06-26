FROM ubuntu:16.04
LABEL name="Sumeet Kumar Yadav"
LABEL email="sumeetpri@outlook.com"
RUN apt-get update && apt-get install -y tree
ENV PASS password
ENV NAME sumeet
RUN pwd>/tmp/1.txt
WORKDIR /tmp
RUN cd /tmp
RUN pwd>/tmp/2.txt
RUN apt-get update && apt-get install -y openssh-server && apt-get install -y python
RUN useradd -d /home/sumeet -g root -G sudo -m -p $(echo "$PASS"| openssl passwd -1 -stdin) $NAME
RUN whoami > /tmp/1st.txt
USER $NAME
RUN whoami > /tmp/2nd.txt
RUN mkdir -p /tmp/project
USER root
ADD localdir /tmp/project
RUN mkdir -p /var/run/sshd
ENTRYPOINT ["tree"]
CMD ["--version"]
#CMD ["python"]
#EXPOSE 22
#CMD ["/usr/sbin/sshd","-D"]
