ARG MAINTAINER="Oleksandr"
ARG NAME="lawrider/server"
ARG VERSION="0.1"

FROM python:3.8-alpine

LABEL MAINTAINER=${MAINTAINER}
LABEL NAME=${NAME}
LABEL VERSION=${VERSION}

RUN adduser -D server
WORKDIR /home/server
COPY server.sh .
RUN apk --no-cache add bash
    
RUN chown -R server:server .
USER server

EXPOSE 8000
ENTRYPOINT [ "bash" ]
CMD [ "server.sh" ]

