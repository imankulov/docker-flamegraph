FROM perl:latest
LABEL maintainer "Roman Imankulov <roman.imankulov@gmail.com>"

COPY FlameGraph /usr/src/FlameGraph
WORKDIR /usr/src/FlameGraph
VOLUME ["/data"]
ENTRYPOINT ["perl", "./flamegraph.pl"]
CMD ["--help"]
