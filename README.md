# deploy_docker_images_jenkins
This repo contains files related automating docker images build, test &amp; deploying on server using jenkins

# Process Flow of this taks is:
<h2>Jenkins + Docker Architecture</h2>

<pre>
Jenkins Container
    │
    ├── Docker CLI (inside container)
    │
    ▼
/var/run/docker.sock (host bridge)
    │
    ▼
Host Docker Engine
    │
    ▼
Runs containers (your apps)
</pre>

# Prerequisites:
Refer startup_script.sh to install the pre-reqisties python package & then followed by ansible playbook.yaml file.

# Docker Image: [custom-jenkins-docker](https://hub.docker.com/repository/docker/liteshz/custom-jenkins-docker/general)

# Command to run container & validate docker version & process which is connected with host server container.
Note: Check the docker groupid in host & update same in below command

1. docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock  --group-add 995 liteshz/custom-jenkins-docker:latest
2. docker container ls
3. docker container exec -it {{ container_id }} cat /var/jenkins_home/secrets/initialAdminPassword
4. docker exec -u root -it {{ container_id }} bash
5. docker version
6. docker ps

# Jenkins Home Directory on Host Server: 
/var/lib/docker/volumes/jenkins_home/_data

# Output Screens
<img width="2880" height="1712" alt="image" src="https://github.com/user-attachments/assets/a9560b12-da87-4497-afcb-2d161c434a2c" />

<img width="2880" height="1706" alt="image" src="https://github.com/user-attachments/assets/2acd60cf-3654-4729-9cf9-c3085d6c3b1d" />


# Note: 
1. if we face any issue while Docker CLI inside of jenkins container from Host Server then execute below command in jenkins contaianer
    chmod 666 /var/run/docker.sock

2. This is happening bcoz of docker groupid is different in host machine & jenkins container. 
    used this cmd to know the groupid: getent group docker

Have handle that issue in 1st command as well while creating the jnkins container refer the same.
