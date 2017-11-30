OMERO Test Infra
================

`omero-test-infra` provides simplified integration testing
for projects that are built on OMERO.server or OMERO.web.

Any repository that relies on an existing OMERO installation
can depend on this directory whether for testing in travis
or locally.

Setup
-----

The directory MUST BE located at .omero at the top-level of
your source code. This can be achieved most simply by:

```
git clone git://github.com/openmicroscopy/omero-test-infra .omero
```

but adding the repository as a submodule or downloading a
zip file are also permissible.

Basic usage
-----------

`.omero/compose up` will start an basic OMERO stack including
PostgreSQL, OMERO.server, and OMERO.web using the current
production docker images. The definition of the stack is available
in `docker-compose.yml` with a number of environment variables
being specified in `.env`.

Docker commands
---------------

Each of the `*-docker` commands runs a full build in the given style:

 * `app-docker` for testing OMERO.web applications
 * `cli-docker` for testing `omero-cli-*` projects
 * `lib-docker` for testing client-side libraries

These scripts are invoked directly by the `script` step in project .travis.yml
files.

Other commands
--------------

 * `py-setup` runs standard Python package build steps
 * `wait-on-login` periodically attempts to login to OMERO.server

