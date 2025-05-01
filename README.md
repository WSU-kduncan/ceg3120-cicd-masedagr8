# change me `14`
# ceg3120-cicd-masedagr8
ceg3120-cicd-masedagr8 created by GitHub Classroom



1. Summarize the project contents in the repository
   
3.   Link to `README-CI.md`  [Link to `README-CI.md`](https://github.com/WSU-kduncan/ceg3120-cicd-masedagr8/blob/main/project4/README-CI.md )
4. 
5.   Link to `README-CD.md`  [Link to `README-CD.md`](https://github.com/WSU-kduncan/ceg3120-cicd-masedagr8/blob/main/project5/README-CD.md)

   # part 4
current state of site running on server, before making a change

show the page in the browser "http://98.85.197.27:9000/"

show the docker status "sudo systemctl status docker"

making a change to the project file (from your local system)  vim README.md

commit and push of the change (from your local system) 

`git add README.md`
`git commit -m "to test push"`
`git push`

tag the commit and push the tag (from your local system)
`git tag v1.0.0
git push --tags`

the GitHub Action triggering, relevant logs that it worked [link to action](https://github.com/WSU-kduncan/ceg3120-cicd-masedagr8/actions)

DockerHub receiving a new set of tagged images (modified time should be visible) [link to docker hub](https://hub.docker.com/repository/docker/masedagr80ne/ceg3120/general)

Payload sent log from DockerHub or GitHub [link to webhook](https://github.com/WSU-kduncan/ceg3120-cicd-masedagr8/settings/hooks)
`broken:.(`

status of webhook running as a service on the server `sudo systemctl status webhook.service`

webhook logs that validate container refresh has been triggered `sudo journalctl -u webhook.service -f`

post-change state of site running on server

show the page in the browser `http://98.85.197.27:9000/`

show the docker status `sudo systemctl status docker`

   
