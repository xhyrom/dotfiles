import re

def expand(pattern: str) -> list[str]:
    match = re.search(r'\{([^{}]*)\}', pattern)
    if not match:
        return [pattern]

    pre, post = pattern[:match.start()], pattern[match.end():]
    options = match.group(1).split(',')

    expanded_patterns = []
    for option in options:
        expanded_patterns.extend(expand(pre + option + post))

    return expanded_patterns
