#!/usr/bin/env python
import os
import sys
import subprocess as subp

if len(sys.argv) < 2 or sys.argv[1] in ['-h', '--help']:
    args = [
        "docker", "run", "-it", "--rm", "imankulov/flamegraph-docker", "--help"
    ]
else:
    filename = os.path.abspath(sys.argv[1])
    dirname = os.path.dirname("")
    args = [
        "docker", "run", "-it", "--rm", "-v",
        os.path.dirname(filename) + ":/data",
        "imankulov/flamegraph-docker",
    ]
    args += sys.argv[2:]
    args.append("/data/" + os.path.basename(filename))

raise SystemExit(subp.call(args))
