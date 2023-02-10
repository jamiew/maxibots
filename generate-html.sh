#!/bin/bash

filename="inscriptions.json"

echo "<html><body>"

cat inscriptions.json | jq -r '.[] .inscription' | xargs -n1 sh -c 'echo "<iframe src=\"https://ordinals.com/preview/$1\" width=\"770\" height=\"770\" scrolling=\"no\" style=\"overflow: hidden;\"></iframe><br />"' sh

echo "</body</html>"
