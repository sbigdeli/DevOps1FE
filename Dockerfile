# tar en image från node:18 och döper till build
FROM node:18 AS build
# skapar mapp och döper till app
WORKDIR /app
# kopierar package.json och package-lock.json till Docker containern
COPY package*.json ./ 
# installerar node.js dependencies i package.json
RUN npm install
# kopierar allting
COPY . .
# bygger projektet i React
RUN npm run build
# startar en optimerad Nginx-server
FROM nginx:alpine
# kopierar från build-mappen som skapades via npm run build och lägger in i Nginx mappen
COPY --from=build /app/build /usr/share/nginx/html
# använder port 80
EXPOSE 80
# kör nginx, -g, daemon off; i Docker
CMD ["nginx", "-g", "daemon off;"]  