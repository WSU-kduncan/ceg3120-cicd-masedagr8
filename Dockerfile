FROM python:3

# example if we used full ubuntu as a base image
#RUN apt update && apt install -y python3 python3-pip
# installs, libraries, stuff you code needs
COPY . /project

CMD ["python", "/project/hello.py"]
