FROM node:lts-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install env-cmd
COPY . .
RUN cp .env.sample .env

EXPOSE 9000
CMD ["npm", "start"]
