FROM jenkins/jenkins:lts-jdk21

USER root

# Install Docker CLI (NOT daemon)
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean

# Give Jenkins permissions
RUN usermod -aG docker jenkins

USER jenkins
