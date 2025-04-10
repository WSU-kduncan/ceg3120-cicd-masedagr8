FROM node:18-bullesye

WORKDIR /angula/angular-site/angular-bird/wsu-hw-ng-main

COPY . .

RUN npm install -g @angular/cli

RUN npm install

CMD ["ng", "serve", "--host", "0.0.0.0"]
