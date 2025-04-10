1. Docker Setup
    - How to install Docker for your OS
    - Additional dependencies based on your OS
      - Ex. Windows systems need WSL2
    - How to confirm Docker is installed and your system can successfully run containers
2. Manually Setting up a Container
    - How to run a container to test the Angular application
      - Include explanation of flags / arguments used
    - Commands needed internal to the container to get additional dependencies
    - Commands needed internal to the container to run the application
    - How to verify that the container is successfully serving the Angular application
      - validate from container side
      - validate from host side
3. `Dockerfile` & Building Images
    - Summary / explanation of instructions written in the `Dockerfile`
    - How to build an image from the repository `Dockerfile`
    - How to run a container that will serve the Angular application from the image built by the `Dockerfile`
    - How to verify that the container is successfully serving the Angular application
      - validate from container side
      - validate from host side
5. Working with your DockerHub Repository
    - How to create a public repo in DockerHub
    - How to create a PAT for authentication (note recommended scope for this task)
      - **DO NOT** add your DockerHub PAT to your documentation 
    - How to authenticate with DockerHub via CLI using DockerHub credentials
      - **DO NOT** add your DockerHub PAT to your documentation 
    - How to push container image to your DockerHub repository
    - **Link** to your DockerHub repository for this project

steps to setup Run a container with the node:18-bullesye container image and configure it to run and server the Angular application in angular-site

steps to make new image and get it running Angular application
docker run -it -p 4200:4200 -v /home/ubuntu//ceg3120-cicd-masedagr8/angular-site/angular-bird/wsu-hw-ng-main:/angular node:18-bullseye bash

cd angular/

idk what change this doesnt seem to be needed anymore
cd wsu-hw-ng-main/

npm install -g @angular/cli

npm install

ng serve --host 0.0.0.0


cite

to get docker working on and EC2 instance i used https://docs.docker.com/engine/install/ubuntu/ 
I just followed to commands to install in on an EC2 instance of ubuntu.

ask chatgbt for example of from command in dockerfile

