# ceg3120-cicd-masedagr8
ceg3120-cicd-masedagr8 created by GitHub Classroom

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
    - Instance type 
    - Recommended volume size
    - Security Group configuration
    - Security Group configuration justification / explanation
2. Docker Setup on OS on the EC2 instance
    - How to install Docker for OS on the EC2 instance
    - Additional dependencies based on OS on the EC2 instance
    - How to confirm Docker is installed and that OS on the EC2 instance can successfully run containers
3. Testing on EC2 Instance
    - How to pull container image from DockerHub repository
    - How to run container from image 
      - Note the differences between using the `-it` flag and the `-d` flags and which you would recommend once the testing phase is complete
    - How to verify that the container is successfully serving the Angular application
      - validate from container side
      - validate from host side
      - validate from an external connection (your physical system)
    - Steps to manually refresh the container application if a new image is available on DockerHub
4. Scripting Container Application Refresh
    - Create a `bash` script on your instance that will:
      - pull the image from your DockerHub repository
      - kill and remove the previously running container
      - start a new container with the freshly pulled image
    - How to test that the script successfully performs its taskings
    - **LINK to bash script** in repository
5. Configuring a `webhook` Listener on EC2 Instance
    - How to install [adnanh's `webhook`](https://github.com/adnanh/webhook) to the EC2 instance
    - How to verify successful installation
    - Summary of the `webhook` definition file
    - How to verify definition file was loaded by `webhook`
    - How to verify `webhook` is receiving payloads that trigger it
      - how to monitor logs from running `webhook`
      - what to look for in `docker` process views
    - **LINK to definition file** in repository
6. Configuring a Payload Sender
    - Justification for selecting GitHub or DockerHub as the payload sender
    - How to enable your selection to send payloads to the EC2 `webhook` listener
    - Explain what triggers will send a payload to the EC2 `webhook` listener
    - How to verify a successful payload delivery
7. Configure a `webhook` Service on EC2 Instance 
    - Summary of `webhook` service file contents
    - How to `enable` and `start` the `webhook` service
    - How to verify `webhook` service is capturing payloads and triggering bash script
    - **LINK to service file** in repository



      source ask chatgbt how to end listener on port 9000. "I have a webhook listening on port 9000 i want to end"
      commands
      sudo lsof -i :9000
      sudo kill -9 PID


