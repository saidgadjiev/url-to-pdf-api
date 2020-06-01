FROM ubuntu:20.04

WORKDIR /app
ENV DEBIAN_FRONTEND noninteractive
ENV USE_SANDBOX false

RUN apt-get update -y
RUN apt-get install -y curl gconf-service libasound2 libatk1.0-0 libatk-bridge2.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

COPY . .
RUN npm install
RUN npm install env-cmd
RUN cp .env.sample .env

EXPOSE 9000
CMD ["npm", "start"]
