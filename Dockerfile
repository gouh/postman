# Create image based on the official Node image from dockerhub
FROM node:lts-buster
 
# Create app directory
WORKDIR /app

# Install nodemon
RUN npm install -g nodemon

# Copy dependency definitions
COPY package*.json ./

# Install dependencies
#RUN npm set progress=false \
#    && npm config set depth 0 \
#    && npm i install
RUN npm ci
 
# Get all the code needed to run the app
COPY ../ .
 
# Expose the port the app runs in
EXPOSE 3000
 
# Serve the app
CMD ["nodemon", "--exec", "npm run start:dev"]