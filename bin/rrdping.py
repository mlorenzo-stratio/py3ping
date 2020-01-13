#!/usr/bin/env python3
""" Pings host & generates graphs """

import sys
import getopt
import py3ping


def main(argv):
    """
    pings host and stores latency and icmp_seq data into an RRD file
        # rrdping.py [-d|--destination_host <host_ip>] [-f|--file <rrd_file>]
    """
    #pylint: disable-msg=unused-variable
    try:
        opts, args = getopt.getopt(argv, "d:f:h", ["destination_host=", "file=", "help"])
    #pylint: enable-msg=unused-variable
    except getopt.GetoptError:
        help(main)
        sys.exit(1)
    for opt, arg in opts:
        if opt in ("-d", "--destination_host"):
            host = arg
        elif opt in ('-f', '--file'):
            file = arg
        elif opt in ('-h', '--help'):
            help(main)
            sys.exit()

    if not host:
        help(main)
        sys.exit(1)

    py3ping.ping(host)

    #if _r.ret_code == 0:
    #    print("Success")
    #else:
    #    print("Failed with {}".format(_r.ret_code))

if __name__ == "__main__":
    main(sys.argv[1:])
