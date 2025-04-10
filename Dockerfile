FROM node:18-bullesye

WORKDIR /home/ubuntu//ceg3120-cicd-masedagr8/a
ngular-site/angular-bird/wsu-hw-ng-main

RUN npm install

RUN npm install -g @angular/cli

COPY angular-site

CMD ["python", "/project/hello.py"]
ng serve --host 0.0.0.0
