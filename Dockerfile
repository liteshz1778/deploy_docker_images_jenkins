FROM jenkins/jenkins:lts-jdk21

USER root

# Install Docker CLI (NOT daemon)
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get install -y maven && \
    apt-get clean

# Give Jenkins permissions
RUN docker && usermod -aG docker jenkins

USER jenkins
