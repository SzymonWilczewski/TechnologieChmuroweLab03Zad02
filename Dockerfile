FROM node:14 AS builder
WORKDIR /my_react_app
COPY package.json /my_react_app
RUN yarn install
COPY . /my_react_app
RUN yarn build

FROM nginx
COPY --from=builder /my_react_app/build /usr/share/nginx/html
