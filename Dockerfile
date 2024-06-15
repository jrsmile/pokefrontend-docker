FROM node:20.13-alpine
RUN apk add --no-cache git
RUN git clone https://github.com/pagefaultgames/pokerogue
WORKDIR pokerogue
RUN npm install
EXPOSE 8000
CMD ["npm", "serve", "--port 8000"]