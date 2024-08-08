from glob import glob
import shutil
import os

def dump(stuff: list[str]):
    for pattern in stuff:
        expand = os.path.expanduser(pattern)

        for path in glob(expand, recursive=True):
            normalized_path = path.removeprefix(os.path.expanduser("~/"))
            if os.path.isdir(normalized_path) and not os.path.exists(normalized_path):
                os.mkdir(normalized_path)
            elif os.path.isfile(normalized_path):
                shutil.copy2(path, normalized_path)

    exit(1)
