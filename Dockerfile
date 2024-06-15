FROM node:20.13-alpine as builder
RUN apk add --no-cache git
WORKDIR /
RUN git clone https://github.com/pagefaultgames/pokerogue
WORKDIR pokerogue
RUN npm ci

FROM nginx:1.14.1-alpine
RUN rm -rf "/usr/share/nginx/html/*"
COPY --from=builder /pokerogue/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]