Network version of the flamegraph to convert flamegraph logs to the SVG
representation.

Run the service with:

    docker run --rm -d  -p 127.0.0.1:4444:4444 imankulov/flamegraph

To use it, send the logfile to 127.0.0.1:4444 and get back the response. You
can use netcat, for example

    nc localhost 4444 < flamegraph.log > flamegraph.svg

Python example to do the same:

    import socket
    sock = socket.socket(socket.AF_INET, ('127.0.0.1', 4444)))
    sock.connect(converter)
    try:
        with open("flamegraph.log", "rb") as fd:
            sock.sendall(fd.read())
        sock.shutdown(socket.SHUT_WR)

        chunk_size = 4096
        chunks = []
        while True:
            data = sock.recv(chunk_size)
            chunks.append(data)
            if '</svg>' in data:
                break
            if len(data) < chunk_size:
                break
    finally:
        sock.close()
    with open("flamegraph.svg", "wb") as fd:
        fd.write(''.join(chunks))
