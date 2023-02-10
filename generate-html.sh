#!/bin/bash

filename="inscriptions.json"

echo "<html><body>"
echo "<title>Maxibots</title>"
echo "<style>
body { background-color: rgb(225, 223, 219); padding-bottom: 2rem; }
h1 { text-align: center; }
h1 img#logo { width: 50%; }
#sub { font-family: sans-serif; color: #212121; }
#buttons { display:flex; }
#container {
  max-width: 1100px;
  margin: 0 auto 50px auto;
}
#grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  justify-items: center;
  gap: 3px 3px;
}
#grid div img { width: 100%; }
a { color: #000; }
@media (min-width: 768px) { #grid { grid-template-columns: repeat(4, 1fr); } }
@media (min-width: 1024px) { #grid { grid-template-columns: repeat(5, 1fr); } }
</style>"
echo '<div id="container">'
echo '<h1><a href="https://maxibots.xyz"><img id="logo" src="logo.png" alt="Maxibots" /></a></h1>'
echo '<div id="sub">108 lil’ bots inscribed on the Bitcoin blockchain</div>'
echo '<div id="buttons"><a>discord</a><a>roadmap</a></div>'
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
