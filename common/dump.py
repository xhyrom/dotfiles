from glob import glob
import shutil
import os

def dump(stuff: list[str]):
    for pattern in stuff:
        expand = os.path.expanduser(pattern)

        for path in glob(expand, recursive=True):
            normalized_path = path.removeprefix(os.path.expanduser("~/"))
            if os.path.isdir(path):
                if os.path.exists(normalized_path):
                    shutil.rmtree(normalized_path)

                os.makedirs(normalized_path)
            else:
                dirname = os.path.dirname(normalized_path)
                if dirname:
                    os.makedirs(dirname, exist_ok=True)

                shutil.copy2(path, normalized_path)

    exit(1)
