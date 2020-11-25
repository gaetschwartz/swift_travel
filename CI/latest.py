import json
import sys

map = json.load(sys.stdin)
channel = sys.argv[1]
hash = map["current_release"][channel]
release = next(x for x in map["releases"] if x["hash"] == hash)
print(map["base_url"]+"/"+release["archive"])
