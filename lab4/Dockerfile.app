FROM express:build

COPY . .

RUN chown 10000:0 -R .
USER 10000

ENV PORT=2000
EXPOSE $PORT

CMD ["npm", "start"]
