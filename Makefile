.PHONY:watch test install
bower=./node_modules/.bin/bower
brunch=./node_modules/.bin/brunch
mocha-phantomjs=./node_modules/.bin/mocha-phantomjs

test:
	$(mocha-phantomjs) -R spec http://0.0.0.0:8000/test/\?grep\=${grep}

watch:
	rm -rf public/*; \
	$(brunch) watch --server

install:
	npm install; \
	$(bower) install; \
	$(bower) install lodash;

clean:
	$(bower) cache clean; \
	rm -rf node_modules; \
	rm -rf bower_components; \