FROM alpine:3.19.1

RUN apk add nginx --update --no-cache
    
RUN chown -R 10000:0 /etc/nginx \ 
		    /var/lib/nginx \ 
		    /var/log/nginx \ 
		    /run/nginx	

EXPOSE 80

USER 10000

CMD ["nginx", "-g", "daemon off;"]
