"""
Where the Makefile is for project building,
something like a fabfile, rakefile, paver script
or such is useful for actually running / installing /
user level tasks like:

* add data set
* verify consistency
* (other 'user level') tasks

Perhaps these will all live in the makefile eventually?


"""

from fabric.api import task, run, lcd, local

@task
def newdata(name):
    """ create a new data set instruction pack in data"""
    with lcd("data") as datadir:
        local("mkdir " + name)
        with lcd(name) as namedir:
            #with mkdir(name + "/l10n")
            local("touch data.json")
            local("touch en_us.json")
            print "edit data/%s/data.json with your data specifics... see: some/url" % (name,)

@task
def newapp():
    """ create a new app """
    pass



