FROM node:20.13-alpine as builder
RUN apk add --no-cache git
WORKDIR /
RUN git clone https://github.com/pagefaultgames/pokerogue
WORKDIR pokerogue
ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV
RUN sed -s '/s/^VITE_SERVER_URL=.*/VITE_SERVER_URL=https\:\/\/pokeapi\.jrcloud\.eu\//g' .env
RUN npm ci && npm cache clean --force

FROM nginx:stable-alpine
RUN rm -rf "/usr/share/nginx/html/*"
COPY --from=builder /pokerogue /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]