# Use the official Node.js image as a parent image
FROM node:23-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or npm-shrinkwrap.json) files
COPY package*.json ./

# Install dependencies including ts-node
RUN npm install

# Copy the rest of your application code
COPY . .

RUN npm run build
# Generate Prisma client
# RUN npx prisma generate

# Your app binds to port 3000 so you'll use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 3001

RUN npm run start
# Define the command to run your app using ts-node
# CMD ["ts-node", "src/server.ts"]