#!/bin/bash

#install java and set environment variable
sudo yum install -y java-17-amazon-corretto-devel
sudo tee -a /etc/profile <<'EOF'
export JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto.x86_64
export PATH=$JAVA_HOME/bin:$PATH
EOF
source /etc/profile


#install maven and set environmentvariable
sudo yum install maven -y
sudo echo "MAVEN_HOME=\"/usr/share/maven\"" >> /etc/profile
sudo echo "PATH=\$MAVEN_HOME/bin:\$PATH" >> /etc/profile
source /etc/profile


#install Git 
sudo yum install git -y

# install jenkins
sudo yum update
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins


# install terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# install kubectl
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

