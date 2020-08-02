# JenkinsInContainer



Here is the Dockerfile we can use:


FROM centos <br>
RUN yum install sudo -y <br>
RUN   yum install wget -y <br>
RUN   yum install java-11-openjdk.x86_64 -y <br>
RUN   sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo <br>
RUN   sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key <br>
RUN   sudo yum install jenkins -y <br>
RUN   sudo yum install /sbin/service -y <br>
RUN   sudo yum install git -y <br>
RUN   echo -e "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers <br>
cmd sudo service jenkins start -DFOREGROUND && /bin/bash <br>
expose 8080 <br>




Here, the baseos we’re using is centos with latest version,
* FROM centos

Next line is :
* RUN yum install sudo -y 

which is to install sudo in the centos 

To download Jenkins we need wget command , so next line is 
 * RUN yum install wget -y 

To run Jenkins we need Java installed in our os ,so first we need to install that  ,therefore : 

* RUN yum install java-11-openjdk.x86_64 -y

Now lets import jenkins repo from internet:

* RUN   sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

* RUN   sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

Next is installing jenkins 

* RUN   sudo yum install jenkins -y

To start the jenkins service we need to first install jenkins service 

* RUN   sudo yum install /sbin/service -y

Now we need to give permissions to user jenkins so we add Jenkins user to sudoers file  

* RUN   echo -e "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

starting jenkins service 

* cmd sudo service jenkins start -DFOREGROUND && /bin/bash

exposing the port 

* expose 8080



Next we need to build the image with some name 
docker build -t jenkinsimage .

Thus our jenkins image is ready and we can start a jenkins container using it 
