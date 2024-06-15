FROM node:20.13-alpine as builder
RUN apk add --no-cache git
WORKDIR /
RUN git clone https://github.com/pagefaultgames/pokerogue
WORKDIR pokerogue
RUN npm ci && npm cache clean --force

FROM nginx:1.14.1-alpine
RUN rm -rf "/usr/share/nginx/html/*"
COPY --from=builder /pokerogue /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]