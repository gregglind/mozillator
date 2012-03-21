this is where the buildable docs for the whole project should go.  There might also be docs
in the doc directories of each individual app.



FAQ
====

* add a new app?  Put it in `apps/`.  Add the urlstuff to `apps/registry.json`
* add a new data source:  `fab newdata:myname` adds things to data

What actually happens at `index.html`

* we load the basic js code, that reads the data and app registration
* then do stuff with that (by default, create a list of app & data combinations

What is an app?

* an app is intented to be a container for some visualization tools and widgets,
that is rewarded for knowing about our conventions.  But it doesn't have to!

What is a widget?

* we aren't sure either.  It seems to be something like a "blob or pattern
that lots of apps might like to use", but this isn't really codified.

Bugs
=====

* send them to....


