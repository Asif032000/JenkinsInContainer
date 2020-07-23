FROM centos
RUN yum install sudo -y
RUN   yum install wget -y
RUN   yum install java-11-openjdk.x86_64 -y
RUN   sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN   sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN   sudo yum install jenkins -y
RUN   sudo yum install /sbin/service -y
RUN   sudo yum install git -y
RUN   sudo yum install openssh-clients -y


RUN   echo -e "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
cmd sudo service jenkins start -DFOREGROUND && /bin/bash
expose 8080

