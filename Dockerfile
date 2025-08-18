FROM node:laetest
WORKDIR /apps
COPY . /apps
RUN npm install && npm run build
EXPOSE 3000
CMD ["node", "index.js"]
# This Dockerfile sets up a Node.js application in a Docker container.
