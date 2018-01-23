FROM perl:latest
LABEL maintainer "Roman Imankulov <roman.imankulov@gmail.com>"

EXPOSE 8000
RUN apt-get update && \
    apt-get install -y ucspi-tcp && \
    rm -rf /var/lib/apt/lists/*
COPY FlameGraph /usr/src/FlameGraph
WORKDIR /usr/src/FlameGraph
CMD ["tcpserver", "0.0.0.0", "8000", "perl", "./flamegraph.pl"]
