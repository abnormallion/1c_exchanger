FROM node:alpine

# Commands will run in this directory
WORKDIR /app

# Install app dependencies
COPY package.json /app
RUN yarn install

# Add all our code inside that directory that lives in the container
ADD . /app

# ARG NODE_ENV=production
# ENV NODE_ENV=$NODE_ENV
# Set environment variables
ENV NODE_ENV production

# Generate production files
RUN yarn build

ARG PORT=5001
ENV PORT=$PORT
EXPOSE PORT

# The command to run our app when the container is run
CMD ["yarn", "start"]
