FROM node:19.5.0-alpine
WORKDIR /app
COPY package.json ./
COPY /public ./
RUN npm install
COPY . .
EXPOSE 5000
CMD ["npm","run","start"]
