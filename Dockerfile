FROM node:carbon
WORKDIR /usr/src/spp
COPY package*.json./
RUN npm install
COPY . .
Expose 8080
CMD ["npm","Start"]
