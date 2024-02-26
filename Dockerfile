FROM node:12.2

ENV HOME=/home/app

# Use the non-interactive mode for apt-get
ARG DEBIAN_FRONTEND=noninteractive

# Update package lists and install htop
RUN apt-get update && apt-get install -y htop

# Create the working directory
WORKDIR $HOME/node_docker

# Copy package files and install dependencies
COPY package.json package-lock.json $HOME/node_docker/
RUN npm install --silent --progress=false

# Copy the application code
COPY . $HOME/node_docker

# Set the default command to run your application
CMD ["npm", "start"]
