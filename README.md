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
zip file is also permissible.

Basic usage
-----------

`.omero/compose up` will start a basic OMERO stack including
PostgreSQL, OMERO.server, and OMERO.web using the current
production docker images. The definition of the stack is available
in `docker-compose.yml` with a number of environment variables
being specified in `.env`.

Docker commands
---------------

To run a full build and install the desire applications, it is
recommended to use

 * .omero/docker NAME

where NAME is `app`, `cli`, `lib` or `scripts`.

It is also possible to combine several application e.g.

 * .omero/docker app scripts

These scripts are invoked directly by the `script` step in project .travis.yml
files.

Other commands
--------------

 * `py-check` runs standard Python quality tools
 * `py-common` runs standard Python package build steps
 * `py-setup` builds and install the Python package
 * `wait-on-login` periodically attempts to login to OMERO.server

 Environment variables
 ---------------------

 * `DOCKER_ARGS` will be passed to `docker run ... test` to allow
   mounting additional directories or exposing ports.
