FROM registry.access.redhat.com/rhscl/nodejs-6-rhel7 
EXPOSE 3000 
# Mandate that all Node.js apps use /usr/src/app as the main folder (APP_ROOT)

RUN mkdir -p /opt/app-root/ WORKDIR /opt/app-root
# Copy the package.json to APP_ROOT 
ONBUILD COPY package.json /opt/app-root
# Install the dependencies 
ONBUILD RUN npm install
# Copy the app source code to APP_ROOT 
ONBUILD COPY src /opt/app-root

# Start node server on port 3000 
CMD [ "npm", "start" ]


