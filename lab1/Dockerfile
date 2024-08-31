FROM alpine:3.19.1

RUN apk update && \ 
    apk add nginx && \
    rm -rf /var/cache/apk/*

RUN chown -R 1001:0 /etc/nginx \ 
		    /var/lib/nginx \ 
		    /var/log/nginx \ 
		    /run/nginx	

EXPOSE 80

USER 1001

CMD ["nginx", "-g", "daemon off;"]
