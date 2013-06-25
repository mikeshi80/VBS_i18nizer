#!/usr/bin/env python
# -*- encoding: utf8 -*-

import codecs
import os.path

class SourceWriter(object):
    '''
    The writer to write the processed source code
    '''
    def __init__(self, fname, encoding='UTF-16LE'):
        self.__lines = []
        self.__fname = fname
        self.__encoding = encoding

    @property
    def encoding(self):
        return self.__encoding

    @encoding.setter
    def encoding(self, value):
        self.__encoding = value

    def replace(self, line, infos, index):
        '''
        replace the line's japanese strings with
        LoadResString function

        arguments:
        line -- the target line
        infos -- the StringTableInfo array
        index -- the index array

        return:
        the processed line, now the Japanese strings
        are replaced with LoadResString function.
        '''
        if len(infos) == 0:
            return line

        retVal = u''
        last = 0

        i = 0
        for info in infos:
            retVal = retVal + line[last:info.begin] + 'LoadResString(' + str(index[i]) + ')'
            i = i + 1
            last = info.end

        if last == 0:
            retVal = line
        else:
            retVal = retVal + line[last:]

        return retVal

    def addLine(self, line):
        '''
        store the processed line for generating the source code

        arguments:
        line -- the processed line
        '''
        self.__lines.append(line)


    def write(self, test=False):
        f = codecs.open(self.__fname + ('.test' if test else ''), 'w', self.encoding)
        self.addLoadResStringSubroutine(f)
        f.writelines(self.__lines)
        f.close()

    def addLoadResStringSubroutine(self, f):
        rf = open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "data/LoadResString.vbs"), "r")
        f.write(rf.read().replace('\n', '\r\n'))
        rf.close()

    
  

