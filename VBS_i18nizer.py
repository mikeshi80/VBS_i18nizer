#!/usr/bin/env python
# -*- encoding: utf8 -*-

import os.path
import sys
import codecs

from StringTableGenerator import StringTableGenerator
from LineProcessor import LineProcessor
from SourceScanner import SourceScanner
from SourceWriter import SourceWriter

def writeRCs(stg, topdir):
    fj = codecs.open(os.path.join(topdir, 'StringTable_JP.RC'), 'w', 'utf-16')
    fj.write(stg.generate('jp'))
    fj.close()

    fc = codecs.open(os.path.join(topdir, 'StringTable_CN.RC'), 'w', 'utf-16')
    fc.write(stg.generate('cn'))
    fc.close()

    fc = codecs.open(os.path.join(topdir, 'StringTable.RC'), 'w', 'utf-16')
    fc.write(stg.generate('en'))
    fc.close()

def main():
    start = 1001
    stg = StringTableGenerator(start)
    lineproc = LineProcessor()
    scanner = SourceScanner(stg, lineproc)

    fname = sys.argv[1]
    if not os.path.isdir(fname):
        writer = SourceWriter(fname)
        scanner.scan(fname, writer)
        writer.write()

    writeRCs(stg, os.path.dirname(fname))

if __name__ == '__main__':
    main()
