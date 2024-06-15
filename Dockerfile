FROM node:20.13-alpine
RUN apk add --no-cache git
RUN git clone https://github.com/pagefaultgames/pokerogue
RUN cd pokerogue && npm install
EXPOSE 8000