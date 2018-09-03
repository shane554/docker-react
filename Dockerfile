# install dependiceis and build app
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

# copy over all of source code into container
COPY  . .

#execute code
RUN npm run build

# configuration for the run stage
FROM nginx

# we want to copy somthing from the builder pahse
COPY --from=builder /app/build /usr/share/nginx/html