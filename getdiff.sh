printf "<article>\n<h2 id='%s'>%s</h2>\n<pre>\n" $(echo "$1" | tr -d ' ') "$1" >> "$3"
git diff --diff-algorithm=minimal "$2" | \
    delta --no-gitconfig --light --syntax-theme "Solarized (light)" --width 120 --tabs 4 --commit-style omit --file-style omit --line-numbers --wrap-max-lines unlimited --side-by-side | \
    aha -n -x -r | \
    sed -e :a -e '/./,$!d;/^\n*$/{$d;N;};/\n$/ba' >> "$3"
printf "</pre>\n</article>\n" >> "$3"