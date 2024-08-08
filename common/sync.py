from glob import glob
import shutil
import os

def sync(stuff: list[str]):
    for pattern in stuff:
        normalized_pattern = pattern.removeprefix("~")
        normalized_pattern = normalized_pattern.removeprefix("/")
        pattern_prefix = pattern[:2] if pattern.startswith("~") else pattern[0]
        overwrite = False

        for path in glob(normalized_pattern, recursive=True):

            system_path = os.path.expanduser(pattern_prefix + path)
            if os.path.isdir(path):
                os.makedirs(system_path, exist_ok=True)
            else:
                print(f"Copying {path} to {system_path}")
                if os.path.exists(system_path) and not overwrite:
                    print(f"Path {system_path} already exists. Do you want to overwrite it with {path}? y/n/a")

                    ask = input()
                    if ask not in ("y", "a"):
                        continue

                    overwrite = ask == "a"

                shutil.copy2(path, system_path)


    exit(1)
