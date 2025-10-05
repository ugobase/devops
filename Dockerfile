FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .

FROM gcr.io/distroless/nodejs:18
WORKDIR /app
COPY --from=build /app ./
EXPOSE 3000
CMD ["index.js"]


