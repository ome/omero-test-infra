Any repository that relies on an existing OMERO server
for testing can add this directory as a submodule, both
for testing in travis as well as locally.

Setup
-----

 * git clone git://github.com/openmicroscopy/test-omero .omero


CLI Usage
---------

For CLI plugins, the following commands are available:

cli-setup
========

Install necessary requirements followed by building and
installing the current CLI plugin into the current environment.

cli-build
=========

Test that the plugin has been properly installed and run
and available integration tests.


cli-docker
==========

This runs a full suite, starting up an OMERO.server via
docker-compose followed by running both cli-setup and cli-docker.
