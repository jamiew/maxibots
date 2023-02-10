#!/bin/bash

filename="inscriptions.json"
echo "<html><body>"

cat inscriptions.json | jq -r '.[] .inscription' | xargs -n1 sh -c 'echo "<iframe src=\"$1\" />"' sh

echo "</body</html>"
