# ceg3120-cicd-masedagr8
ceg3120-cicd-masedagr8 created by GitHub Classroom

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

