# change this path if you want to debug output
DEBUG_LOG=/dev/null


all: grab_submodules d3 jquery underscore
	@echo 'Done building libraries'

grab_submodules:
	@git submodule update --init

d3:
	@echo 'Building d3'
	@cd lib/d3 && npm install > $(DEBUG_LOG) 2>&1
	@cd lib/d3 && git reset --hard > $(DEBUG_LOG) 2>&1
	@cd lib/d3 && make > $(DEBUG_LOG) 2>&1
	@echo 'Copying d3 library to lib/'
	@cp -f lib/d3/d3.v2.min.js lib/d3.js
	@chmod 664 lib/d3.*

jquery:
	@echo 'Building jQuery'
	@cd lib/jquery && git reset --hard > $(DEBUG_LOG) 2>&1
	@cd lib/jquery && make > $(DEBUG_LOG) 2>&1
	@echo 'Copying jQuery library to lib/'
	@cp -f lib/jquery/dist/jquery.min.js lib/jquery.js

underscore:
	@echo 'Grabbing underscore.js'
	@cp -f lib/underscore/underscore-min.js lib/underscore.js

clean: jquery_clean
	@echo 'Removing all built libraries from lib'
	@rm -f lib/*.js;

jquery_clean:
	@echo 'Cleaning jQuery'
	@cd lib/jquery && make distclean > $(DEBUG_LOG) 2>&1

.PHONY: all grab_submodules d3 jquery clean jquery_clean
