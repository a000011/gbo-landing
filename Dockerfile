FROM node:lts-alpine AS base
WORKDIR /app

COPY package.json yarn.lock ./

FROM base AS prod-deps
RUN yarn install --production --frozen-lockfile

FROM base AS build-deps
RUN yarn install --frozen-lockfile

FROM build-deps AS build
COPY . .
RUN yarn build

FROM base AS runtime
COPY --from=prod-deps /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist

CMD ["node", "./dist/server/entry.mjs"]