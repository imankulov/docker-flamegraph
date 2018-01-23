Network version of the flamegraph to convert flamegraph logs to the SVG
representation.

Run the service with

    docker run --rm -d  -p 127.0.0.1:8000:8000 imankulov/flamegraph

To use it, send the logfile to 127.0.0.1:8000 and get back the response. You
can use netcat, for example

    nc localhost 8000 < flamegraph.log > flamegraph.svg
