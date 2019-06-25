FROM alpine:latest
RUN apk update
RUN apk upgrade

RUN apk add torsocks

RUN rm /var/cache/apk/*

COPY ./url-smasher.sh ~/url-smasher.sh
COPY ./user_agents ~/user_agents
COPY ./entrypoint.sh ~/entrypoint.sh

ENTRYPOINT ["~/entrypoint.sh"]
CMD ["bash"]
