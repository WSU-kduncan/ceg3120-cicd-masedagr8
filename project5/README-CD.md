# part 1

1. Generating `tag`s 

    - To see tags in a `git` repository
      `Under Actions commits and tags can be viewed`
      
    - How to generate a `tag` in a `git` repository
      `git tag v1.0.0`
      
    - How to push a tag in a `git` repository to GitHub
      `git push --tags`
      
2. Semantic Versioning Container Images with GitHub Actions
    - Summary of what your workflow does and when it does it
      `The workflow starts with docker meta which is used for tags`
      
      `logs into dockerhub with the username and token in secrets`
      
      `Next it installs QEMU` "from what I tell QEMU allows you to run linux on virtual machine?"
      
      `Then we need docker buildx which i simial to docker build but allows you to build images on another machine`
      
      `Build and pushs image to docker repo with the the 3 tags latest, major, major minor`
      
    - Explanation / highlight of values that need updated if used in a different repository
      - changes in workflow
        `under docker meta step if in a different repo under with images, "masedagr80ne/ceg3120" will need change based on what repo you are using`
      - changes in repository
        `According to github's docker build-puhs-action file`
      
          Building from the current repository automatically uses the [GitHub Token](https://docs.github.com/en/actions/security-guides/automatic-token-authentication),
          so it does not need to be passed. If you want to authenticate against another
          private repository, you have to use a [secret](https://docs.docker.com/build/ci/github-actions/secrets)
          named `GIT_AUTH_TOKEN` to be able to authenticate against it with Buildx
        `So just the Github Token`
      [workflow in github repo]([https://docs.docker.com/ci-cd/github-actions/](https://github.com/WSU-kduncan/ceg3120-cicd-masedagr8/actions)
3. Testing & Validating
    - How to test that your workflow did its tasking
      `first under Action see if workflow failed`
      `If it didnt fail check dockerhub and see if it has updated with the new 3 tags`
    - How to verify that the image in DockerHub works when a container is run using the image
      `connect to the image in the browser`

# part 2

1. EC2 Instance Details
    - AMI information
    - Instance type: `t2.medium`
    - Recommended volume size: `24 gib`
    - Security Group configuration: `port 9000,4200,4201,22 source 0.0.0.0
    - Security Group configuration justification / explanation: ` those are the ports we use`
2. Docker Setup on OS on the EC2 instance
    - How to install Docker for OS on the EC2 instance
    -  -`for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done`


   
   -`sudo apt-get update`

    `sudo apt-get install ca-certificates curl`

    `sudo install -m 0755 -d /etc/apt/keyrings`

    `sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc`

    `sudo chmod a+r /etc/apt/keyrings/docker.asc`
   `the five line above should able to run at once if you like`

   -`sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`
   
   -to verify successful install run `sudo docker run hello-world`

3. Testing on EC2 Instance
    - How to pull container image from DockerHub repository: `docker pull <image-name>`
    - How to run container from image:
      ` sudo docker run hello-world`
      `sudo docker run -it 0919bf7401ef`
      - Note the differences between using the `-it` flag and the `-d` flags and which you would recommend once the testing phase is complete:`I recommend -it(interactive) because it can be hard to tell whats happening when using -d(background)`
    - How to verify that the container is successfully serving the Angular application
      - validate from container side ` curl http://localhost:80`
      - validate from host side `curl http://localhost:9000`
      - validate from an external connection `curl http://98.85.197.27:9000/hooks/hooksid`
    - Steps to manually refresh the container application if a new image is available on DockerHub
      `docker pull masedagr80ne/ceg3120:latest`
      `docker ps -a`
      `docker kill banana`
      `docker rm banana`
      `docker run -d -p 9000:80 masedagr80ne/ceg3120:latest`

4. Scripting Container Application Refresh
    - Create a `bash` script on your instance that will:
      - pull the image from your DockerHub repository
      - kill and remove the previously running container
      - start a new container with the freshly pulled image
    - How to test that the script successfully performs its taskings
      `inside deployment run "./refresh-it.sh"`
      `docker images` check was pulled
      `docker ps -a` check is running
    - **LINK to bash script** [in repository](https://github.com/WSU-kduncan/ceg3120-cicd-masedagr8/blob/main/project5/deployment/refresh-it.sh)
5. Configuring a `webhook` Listener on EC2 Instance
    - How to install [adnanh's `webhook`](https://github.com/adnanh/webhook) to the EC2 instance
      sudo apt install webhook
      sudo system ttl status
      sudo systemctl status webhook.service
    - How to verify successful installation `which webhook`
    - Summary of the `webhook` definition file `json configuration is the file that defines hooks for the webhook`
    - How to verify definition file was loaded by `webhook` `webhook -hooks deployment/hooks.json -verbose`
    - How to verify `webhook` is receiving payloads that trigger it
      - how to monitor logs from running `webhook` `journalctl -u webhook.service -f`
      - what to look for in `docker` process views ` [webhook] 2025/05/01 17:31:08 [9fb8ee] hooksid hook triggered successfully`
    - **LINK to definition file** [in repository](https://github.com/WSU-kduncan/ceg3120-cicd-masedagr8/blob/main/project5/deployment/hooks.json)
6. Configuring a Payload Sender
    - Justification for selecting GitHub or DockerHub as the payload sender: `I think I understand how to do in github better`
    - How to enable your selection to send payloads to the EC2 `webhook` listener
      `in setting webhooks, add webhook`
      payload url `http://98.85.197.27/9000/hooks/hooksid`
      `content type application/json`
      `et me select individual events` (push release)
    - Explain what triggers will send a payload to the EC2 `webhook` listener
      `when a new push or release happens webhook should send a payload to webhook`
    - How to verify a successful payload delivery
      `under webhook in setting it will say it was successful`
      or `check webhook logs` according to chatgbt
7. Configure a `webhook` Service on EC2 Instance 
    - Summary of `webhook` service file contents
      `mostly default`
      added
      `After=network.target`
      `Restart=always`
    - How to `enable` and `start` the `webhook` service
       `sudo systemctl daemon-reload
       sudo systemctl enable webhook
       sudo systemctl start webhook
       sudo systemctl status webhook`
    - How to verify `webhook` service is capturing payloads and triggering bash script
      `journalctl -u webhook.service -f`
    - **LINK to service file** [in repository](https://github.com/WSU-kduncan/ceg3120-cicd-masedagr8/blob/main/project5/deployment/webhook.service)

# part 3

1. Continuous Deployment Project Overview
    - What is the goal of this project` to learn to use webhooks`
    - What tools are used in this project and what are their roles
      `my dockerfile makes the images`
      `refresh-it.sh bash script delete old and get new image`
      `hooks.json is my hooks file`
      `webhook.service restarts my webhook once EC2 instance is on`
    - Diagram of project
  [diagram](https://github.com/WSU-kduncan/ceg3120-cicd-masedagr8/blob/main/project5/Blank%20diagram%20(1).pdf)
      
    - [If applicable] What is **not working** in this project
      `the webhook in github wont work`
