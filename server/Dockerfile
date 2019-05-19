FROM node

WORKDIR /server

COPY . /server

EXPOSE 8888

RUN npm install pm2 -g

CMD ["pm2-runtime", "app.js"]