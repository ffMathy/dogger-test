FROM node:15.14.0-alpine

# create destination directory
RUN mkdir -p /frontend
WORKDIR /frontend

# copy the app, note .dockerignore
COPY . /frontend/
RUN yarn

# build necessary, even if no static files are needed,
# since it builds the server as well
RUN yarn build

# expose 5000 on container
EXPOSE 5000

# set app serving to permissive / assigned
ENV NUXT_HOST=0.0.0.0

# set app port
ENV NUXT_PORT=5000

# start the app
CMD [ "yarn", "start" ]