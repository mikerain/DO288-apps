FROM registry.access.redhat.com/rhscl/nodejs-6-rhel7
#centos/nodejs-8-centos7:latest 
#FROM registry.access.redhat.com/rhel7:7.3
EXPOSE 3000
RUN mkdir -p /opt/app-root/ 
WORKDIR /opt/app-root
# Copy the package.json to APP_ROOT 
ONBUILD COPY package.json /opt/app-root
# Install the dependencies 
#ONBUILD RUN npm install
# Copy the app source code to APP_ROOT 
#ONBUILD COPY src /opt/app-root
# Start node server on port 3000 
#CMD [ "npm", "start" ]



#docker build -t nparent:latest .