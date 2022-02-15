FROM node:16.13.2

WORKDIR /app

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo,

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json

RUN npm install

COPY . .

ADD . /app

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]