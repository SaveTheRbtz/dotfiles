#!/usr/bin/env python
# vim: set fileencoding=utf-8 :

def main():
    pass

if __name__ == '__main__':
    from optparse import OptionParser
    parser = OptionParser()
    #parser.add_option("-f", type="string", dest="file", default="")
    (options, args) = parser.parse_args()

    main()
