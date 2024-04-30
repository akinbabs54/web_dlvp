FROM alpine:3.18
WORKDIR /app
COPY /my-react-app/package.json ./
RUN npm install
COPY . .
EXPOSE 5000
CMD ["npm","run","start"]