#!/bin/bash

filename="inscriptions.json"

echo "<html><body>"
echo "<style>
/* body { display: grid; grid-template-columns: repeat(3, 1fr); grid-gap: 1rem; } */
body { background-color: rgb(225, 223, 219); }
div { text-align: center; text-size: 80%; width: 30%; float: left; margin-right: 1rem; margin-bottom: 1rem; }
div img { width: 100%; }
a { color: #f0f; }
</style>"

cat inscriptions.json |
  jq -r '.[] .inscription' |
  xargs -n1 sh -c 'echo "<div><a href=\"https://ordinals.com/inscriptions/$1\"><img src=\"https://ordinals.com/preview/$1\" /></a></div>"' sh

echo "</body</html>"
