Network version of the flamegraph to convert flamegraph logs to the SVG
representation.

Run the service with

    docker run --rm -d  -p 127.0.0.1:4444:4444 imankulov/flamegraph

To use it, send the logfile to 127.0.0.1:4444 and get back the response. You
can use netcat, for example

    nc localhost 4444 < flamegraph.log > flamegraph.svg
