#!/bin/bash

filename="inscriptions.json"

echo "<html><body>"
echo "<style>
body { background-color: rgb(225, 223, 219); }
h1 { text-align: center; }
h1 img#logo { width: 50%; margin: 0 auto; }
#grid {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  justify-items: center;
  gap: 3px 3px;
  /* max-width: 800px; */
  margin: 0 auto;
  /* padding: 100px 50px; */
}
#grid div img { width: 100%; }
a { color: #f0f; }
</style>"
echo '<div id="container">'
echo '<h1><img id="logo" src="logo.png" alt="Maxibots" /></h1>'
echo '<div id="grid">'
cat inscriptions.json |
  jq -r '.[] .inscription' |
  xargs -n1 sh -c 'echo " \
<div> \
  <a href=\"https://ordinals.com/inscription/$1\"> \
    <img src=\"https://ordinals.com/preview/$1\" /> \
  </a> \
</div> \
"' sh

echo '</div>'
echo '</div>'
echo '</body</html>'
