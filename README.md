# ceg3120-cicd-masedagr8
ceg3120-cicd-masedagr8 created by GitHub Classroom


steps to setup Run a container with the node:18-bullesye container image and configure it to run and server the Angular application in angular-site

steps to make new image and get it running
docker run -it -p 4200:4200 -v /home/ubuntu//ceg3120-cicd-masedagr8/angular-site/angular-bird/wsu-hw-ng-main:/angular node:18-bullseye bash
cd angular/
cd wsu-hw-ng-main/
npm install -g @angular/cli
npm install
ng serve --host 0.0.0.0


cite

to get docker working on and EC2 instance i used https://docs.docker.com/engine/install/ubuntu/ 
I just followed to commands to install in on an EC2 instance of ubuntu.

ask chatgbt for example of from command in dockerfile
