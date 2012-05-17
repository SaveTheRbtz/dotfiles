#!/usr/bin/env python
# vim: set fileencoding=utf-8 :

import logging as log

if __debug__:
    log.basicConfig(level=log.DEBUG)
else:
    log.basicConfig()

def main():
    pass

if __name__ == '__main__':
    from optparse import OptionParser
    parser = OptionParser()
    #parser.add_option("-f", type="string", dest="file", default="")
    (options, args) = parser.parse_args()

    main()
