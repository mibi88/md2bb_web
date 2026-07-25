.POSIX:

index.html:
	sed "s/{current_year}/`date +%Y`/g;s/{title}/md2bb.pl/g" \
	mibi88.github.io/simple_template.html \
	| sed "/{content}/r content.html" \
	| sed "s/{content}//" > index.html

test: index.html
	mkdir -p build/md2bb_web
	cp index.html build/md2bb_web
	cp md2bb.js build/md2bb_web
	cp -r mibi88.github.io/* build
	cp -r md2bb.pl build/md2bb_web

index.html: content.html
