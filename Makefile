# change this path if you want to debug output
DEBUG_LOG=/dev/null

# change DIST_VER to build different at a different revision
DIST_REV=HEAD
REV_NAME=`git rev-parse --short $(DIST_REV)`
CURR_REV=`git rev-parse --short HEAD`
PREFIX=dist-$(REV_NAME)


all: grab_submodules d3 jquery underscore
	@echo 'Done building libraries'

grab_submodules:
	@git submodule update --init

d3:
	@echo 'Building d3'
	@cd lib/d3 && npm install > $(DEBUG_LOG) 2>&1
	@cd lib/d3 && git reset --hard > $(DEBUG_LOG) 2>&1
	@cd lib/d3 && make > $(DEBUG_LOG) 2>&1
	@echo 'Copying d3 to lib/'
	@cp -f lib/d3/d3.v2.min.js lib/d3.js
	@chmod 664 lib/d3.*

jquery:
	@echo 'Building jQuery'
	@cd lib/jquery && git reset --hard > $(DEBUG_LOG) 2>&1
	@cd lib/jquery && make > $(DEBUG_LOG) 2>&1
	@echo 'Copying jQuery to lib/'
	@cp -f lib/jquery/dist/jquery.min.js lib/jquery.js

underscore:
	@echo 'Copying underscore.js to lib/'
	@cp -f lib/underscore/underscore-min.js lib/underscore.js

clean: jquery_clean
	@echo 'Removing all built libraries from lib'
	@rm -f lib/*.js;

jquery_clean:
	@echo 'Cleaning jQuery'
	@cd lib/jquery && make distclean > $(DEBUG_LOG) 2>&1

dist: all
	@echo 'Creating tar.gz distribution file'
	@mkdir -p $(PREFIX)
	@git archive --format=tar $(REV_NAME) | tar -C $(PREFIX) -xf -
	@rm -rf $(PREFIX)/lib/*
	@cp lib/*.js $(PREFIX)/lib/
	@tar czf $(PREFIX).tar.gz $(PREFIX)
	@mv $(PREFIX).tar.gz $(PREFIX)/

distclean:
	@echo 'Removing all distribution folders'
	@rm -rf dist-*/

.PHONY: all grab_submodules d3 jquery underscore clean jquery_clean dist distclean
