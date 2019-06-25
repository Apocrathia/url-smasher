FROM alpine:latest
RUN apk update
RUN apk upgrade

RUN apk add torsock

RUN rm /var/cache/apk/*

COPY ./url-smasher.sh ~/url-smasher.sh
COPY ./user_agents ~/user_agents

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
