# Just a makefile to make a piazza post out of README.md
piazza.html: README.md
	pandoc README.md -t html5 -o temp.html
	sed 's|<pre><code>|<pre>|g' temp.html | sed 's|</code></pre>|</pre>|g' > piazza.html
	echo -e "\n#pin" >> piazza.html
	rm temp.html
