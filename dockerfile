#remove the folder 
rm -rf dockerimg
#create folder dockerimg
mkdir -m 777 dockerimg
#get inside the dockerimg
cd dockerimg
#create dockerfile
touch dockerfile
#copy the war file and keep inside of dockerimg
cp /var/lib/jenkins/workspace/abc-package-01/target/addressbook.war .
#get into the dockerfile
echo "
#choose container OS
FROM ubuntu:latest
#Define the author name
MAINTAINER "mrudula"
#update the container
RUN apt update -y
#install GIT
RUN apt install git -y
#install java
RUN apt install defualt-jdk -y
#Download TOMcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz
#Extract the TOMcat tar file
RUN tar -zvxf /opt/apache-tomcat-9.0.73.tar.gz
#Deploy an app
COPY addressbook.war apache-tomcat-9.0.73/webapps
#Configure port number
EXPOSE 8080" >> dockerfile
sudo docker build -t app1:v1
