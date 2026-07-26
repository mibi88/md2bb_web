.POSIX:

build: index.html md2bb.pl/md2bb.pl build/webperl.js
	mkdir -p build
	cp -r md2bb.pl build
	cp index.html build/index.html

build/webperl.js:
	wget https://github.com/haukex/webperl/releases/download/v0.09-beta/webperl_prebuilt_v0.09-beta.zip -O build/webperl.zip
	unzip build/webperl.zip -d build/
	mv build/webperl_prebuilt_v0.09-beta/webperl.js \
	build/webperl_prebuilt_v0.09-beta/emperl.* build/
	rm -r build/webperl_prebuilt_v0.09-beta
	rm build/webperl.zip

index.html: content.html mibi88.github.io/simple_template.html
	sed "s/{current_year}/`date +%Y`/g;s/{title}/md2bb.pl/g" \
	mibi88.github.io/simple_template.html \
	| sed "/{content}/r content.html" \
	| sed "s/{content}//" > index.html

test: build
	mkdir -p build/md2bb_web
	cp -r build/*.* build/md2bb_web
	cp -r mibi88.github.io/* build
	cp index.html build/md2bb_web
