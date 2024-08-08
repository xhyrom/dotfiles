from glob import glob
from os.path import expanduser, isdir
from os import mkdir
from shutil import copy2
import shutil

def dump(stuff: list[str]):
    for pattern in stuff:
        expand = expanduser(pattern)

        for path in glob(expand, recursive=True):
            normalized_path = path.removeprefix(expanduser("~/"))
            if isdir(normalized_path):
                mkdir(normalized_path)
            else:
                shutil.copy2(path, normalized_path)

    exit(1)
