FROM node:22.12.0-alpine AS build

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .
RUN yarn build

FROM nginx:1.27-alpine AS production

COPY --from=build /app/dist /usr/share/nginx/html


CMD ["nginx", "-g", "daemon off;"]
