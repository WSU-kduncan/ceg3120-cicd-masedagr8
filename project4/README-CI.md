1. Docker Setup
   -commands to install docker on EC2 instance ubuntu
   
   -`for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done`
   
   -`sudo apt-get update`

    `sudo apt-get install ca-certificates curl`

    `sudo install -m 0755 -d /etc/apt/keyrings`

    `sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc`

    `sudo chmod a+r /etc/apt/keyrings/docker.asc`

   -`sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`
   
   -to verify successful install run `sudo docker run hello-world`

3. Manually Setting up a Container
    - How to run a container to test the Angular application
    -  docker run -it -p 4201:4201 --name madeWithDockerFile -v /home/ubuntu/ceg3120-cicd-masedagr8/angular-site/angular-bird/wsu-hw-ng-main:/angula node:18-bullseye bash
      - -it -t allocates a pseudo-tty and attach to the standard input of the container
          -i (interactive) keep stdin open even if not attached
      - -p 4201:4201
          - expose container port to host port
      - --name madeWithDockerFile
            -set name of container
        - -v host_folder:container_folder
           -path to folder i want and the folder i want it in
      - node:18-bullseye set image to 18-bullseye
        
      -inside the container
      -cd angular/

      -npm install -g @angular/cli

      -npm install

      -ng serve --host 0.0.0.0

    - verify that the container isserving the Angular
      - validate from container side "curl 4200"
      - validate from host side curl "localhost:4200"
4. `Dockerfile` & Building Images
    - from is node:18-bullesye the image i want to use
    - workdir is the path to where angular is down loaded
    - copy copies everything in the current directory on host into the current working directory
    - the two run command should do the same they do in the command line install angular and npm install
    - cmd is the command to serve it broken up
    - my Dockerfile
`FROM node:18-bullseye

COPY . .

WORKDIR /angular-bird/wsu-hw-ng-main

RUN npm install -g @angular/cli

RUN npm install

CMD ["ng", "serve", "--host", "0.0.0.0"]
`
    - How to run a container that will serve the Angular application from the image built by the `Dockerfile`
    - `docker run -it -p 4201:4201 --name madeWithDockerFile -v /home/ubuntu/ceg3120-cicd-masedagr8/angular-site/angular-bird/wsu-hw-ng-main:/angula node:18-bullseye bash` 
    - How to verify that the container is successfully serving the Angular application
      - validate from container side `curl 4201`
      - validate from host side `localhost:4201`


.4 Working with your DockerHub Repository
    - How to create a public repo in DockerHub
    
    -`once you have an account go to docker hub and in repository click create repository`
    
    - How to create a PAT for authentication (note recommended scope for this task)
    
    -`go to docker account center go down to personal access token and make one, dont forget not to lose token(ive have many tokens now:)`
    `make sure token has read and write priv` 
    
    - To authenticate with DockerHub via CLI using DockerHub credentials
    
    -`docker login --username masedagr80ne` `your username`
    
    -instead of password paste you PAT
      
    - How to push container image to your DockerHub repository
    
    `docker push masedagr80ne/ceg3120 masedagr80ne/ceg3120`
    `docker push masedagr80ne/ceg3120`
    
    - **Link** to your DockerHub repository for this project
   `https://hub.docker.com/repository/docker/masedagr80ne/ceg3120/general`



steps to setup Run a container with the node:18-bullesye container image and configure it to run and server the Angular application in angular-site

steps to make new image and get it running Angular application
docker run -it -p 4200:4200 -v /home/ubuntu//ceg3120-cicd-masedagr8/angular-site/angular-bird/wsu-hw-ng-main:/angular node:18-bullseye bash

cd angular/

idk what change this doesnt seem to be needed anymore
cd wsu-hw-ng-main/

npm install -g @angular/cli

npm install

ng serve --host 0.0.0.0


cite used 

to get docker working on and EC2 instance i used https://docs.docker.com/engine/install/ubuntu/ 
I just followed to commands to install in on an EC2 instance of ubuntu.

ask chatgbt for examples of from and CDM command in dockerfile, `can I get examples on how to use FROM and CDM in a Dockerfile and expain the different parts of the commands` 

