FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or npm-shrinkwrap.json) files
COPY package*.json ./

# Install dependencies including ts-node and TypeScript
RUN npm install
RUN npm install -g typescript

# Copy the rest of your application code
COPY . .

# Ensure all files are executable
RUN chmod -R +x .

# Run build using the globally installed TypeScript compiler
RUN tsc

# Generate Prisma client
# RUN npx prisma generate

# Your app binds to port 3000 so you'll use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 3001

RUN npm run start