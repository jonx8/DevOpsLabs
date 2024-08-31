FROM alpine:3.19.1 as build


RUN apk add nodejs npm --no-cache --update

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .

RUN npm run build

FROM alpine:3.19.1

RUN apk add nginx --update --no-cache
    
RUN chown -R 10000:0 /etc/nginx \ 
		    /var/lib/nginx \ 
		    /var/log/nginx \ 
		    /run/nginx	

EXPOSE 80

USER 10000

COPY --from=build /app/build /usr/share/nginx/html

CMD ["nginx", "-g",  "daemon off;" ]
