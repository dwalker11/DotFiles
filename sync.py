#!/usr/bin/python

import os
import shutil

def parse_files(source_dir):
    for file in source_dir:
        if file in exceptions:
            if exceptions[file] is not None:
                dcopy(file, exceptions[file])
        else:
            dcopy(file)

def dcopy(source, destination=None):
    print('copying ' + source)

    if destination is None:
        destination = home_dir + '/' + source

    if os.path.isdir(source):
        if not os.path.isdir(destination):
            os.mkdir(destination)

        for content in os.listdir(source):
            dcopy(source + '/' + content, destination + '/' + content)
    else:
        shutil.copy(source, destination)

home_dir = os.getenv('HOME')

exceptions  = {
  '.git':       None,
  '.gitignore': None,
  'fonts':      None,
  'config':     home_dir + '/.config',
  'refind':     None,
  'vim':        None,
  'notes':      None,
  'sync.py':    None,
  'README.md':  None
}

source_dir = os.listdir()
parse_files(source_dir)

print('done')
