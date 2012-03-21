```
                    _ _ _       _
 _ __ ___   ___ ___(_) | | __ _| |_ ___  _ __
| '_ ` _ \ / _ \_  / | | |/ _` | __/ _ \| '__|
| | | | | | (_) / /| | | | (_| | || (_) | |
|_| |_| |_|\___/___|_|_|_|\__,_|\__\___/|_|
```
Light weight data visualization library.

Global Libraries
----------------

The following libraries are available globally in minified versions.

* *d3* (`lib/d3.js`): A JavaScript visualization library for HTML and SVG
* *jQuery* (`lib/jquery.js`): jQuery JavaScript Library
* *underscore.js* (`lib/underscore.js`): JavaScript's utility _ belt


Development
===========

Prerequisites
-------------

In order to build you need make 3.8 or later, Node.js 0.2 or later, and git 1.7 or later.
(Earlier versions might work OK, but are not tested.)

Windows users have two options:

1. Install [msysgit](https://code.google.com/p/msysgit/) (Full installer for official Git),
   [GNU make for Windows](http://gnuwin32.sourceforge.net/packages/make.htm), and a
   [binary version of Node.js](http://node-js.prcn.co.cc/). Make sure all three packages are installed to the same
   location (by default, this is C:\Program Files\Git).
2. Install [Cygwin](http://cygwin.com/) (make sure you install the git, make, and which packages), then either
   follow the [Node.js build instructions](https://github.com/ry/node/wiki/Building-node.js-on-Cygwin-%28Windows%29)
   or install the [binary version of Node.js](http://node-js.prcn.co.cc/).

Mac OS users should install Xcode (comes on your Mac OS install DVD, or downloadable from
[Apple's Xcode site](http://developer.apple.com/technologies/xcode.html)) and
[http://mxcl.github.com/homebrew/](Homebrew). Once Homebrew is installed, run `brew install git` to install git,
and `brew install node` to install Node.js.

Linux/BSD users should use their appropriate package managers to install make, git, and node, or build from source
if you swing that way.

Building
--------

Clone a copy of the repository by running `git clone git://github.com/trevnorris/mozillator.git`. From inside the
repository folder run `make`. This will download needed submodules, build each dependency and place the built and
minified libraries directly in `lib/`.

To cleanup all submodules and library files run `make clean`.

Distributions
-------------

To build a distribution run `make dist`. By default his will create a `dist-<short_hash>` directory
where all the build and minified libraries will be copied. Then a `tar.gz` will be created of the distribution
folder.

`make dist` will build `HEAD` by default. To build at another revision run `make DIST_REV=(hash/tag/branch) dist`.

To change the location of the distribution directory and tar.gz run `make PREFIX=/my/dist/dir dist`.

Cleanup all distribution files by running `make distclean`.

Debugging
---------
If there are problems in the build process run `make DEBUG_LOG=<output.log> all`.


Using
------


* see `docs` for all usage
* use `fabfile.py` for user level commands.

