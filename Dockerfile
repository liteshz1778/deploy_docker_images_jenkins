FROM jenkins/jenkins:lts-jdk21

USER root

# Installing docker & maven
RUN apt-get update && \
    apt-get install -y curl gnupg docker.io maven && \
    apt-get clean

# Install Node.js &  npm modules
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# Verify installations
RUN node -v && npm -v && mvn -v && docker --version

# Give Jenkins permissions to Docker
RUN usermod -aG docker jenkins

USER jenkins
