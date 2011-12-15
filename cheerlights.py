import sys
import re

cheerlights_regex = re.compile("\#cheerlights\s(\w+)", re.IGNORECASE)

try:
    import json
except ImportError:
    try:
        import simplejson as json
    except ImportError:
        sys.stderr.write("no json module :(\n")
        sys.exit(1)

while True:
    line = sys.stdin.readline()
    if line == "":
        sys.stderr.write("Empty twitter line\n")
        sys.stderr.flush()
        continue
    try:
        tweet = json.loads(line)
    except ValueError:
        continue
    if 'text' in tweet:
        text = tweet['text']
        sys.stderr.write("Tweet with text: %s\n" % (text,))
        sys.stderr.flush()
        search = cheerlights_regex.search(text)
        if search:
            color = search.group(1)
            sys.stderr.write("Color: %s\n" % (color,))
            sys.stderr.flush()
            print color 
