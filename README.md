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

All docker compose environment variables like COMPOSE_FILE will be
respected, except for COMPOSE_PROJECT_NAME which has special handling
via the PROJECT environment variable.

Docker commands
---------------

To run a full build and install the desire applications, it is
recommended to use

 * .omero/docker NAME

where NAME is `app`, `cli`, `lib` or `scripts`. The special `srv`
command will build the parent directory as a replacement for the
OMERO.server container.
The `setup` command can be used to setup a server for testing external applications using your own scripts.
For example, run `NOCLEAN=true OMERO_SERVER_SSL=4064: .omero/docker setup` and connect to `localhost:4064`.

It is also possible to combine several application e.g.

 * .omero/docker app scripts

but each of the applications must pass when it is run alone as well.

These commands should be invoked by the `script` step in the project's
.travis.yml file. Set any environment variables as necessary.

Extension mechanisms
--------------------

If none of the commands above work for your scenario, there are a
number of extension mechanisms that you can make use of.

 * Add your own task hook
 * Dockerfile: some commands assume a Dockerfile
 * Modify environment (.env)
   - different docker images
 * One or more compose files

Finally, if none of these options cover what you need, please
contact us via GitHub issues to suggest a new stage command.

### Hooks ###

Each command runs a number of subcommands or tasks which can be
overridden by placing an executable file of the same name in an
`.omeroci` directory *beside* the `.omero` directory.

 * `app-deps` installs dependencies for apps
 * `app-srv` gives apps a chance to modify the server
 * `py-check` runs standard Python quality tools
 * `py-common` runs standard Python package build steps
 * `py-setup` builds and install the Python package

### Environment variables ###

The .env defines a number of variables that can optionally be passed
to docker instances if specified in the docker compile file. By setting
these values in your calling environment or updating the .env file, you
can influence the behavior of omero-test-infra. Of particular use are:

 * `ROOTPASS` and `POSTGRES_PASSWORD` for securing your installation
 * `*_IMAGE` for choosing other bases Docker images
 * `*_PORT` for mapping local ports to the services, e.g. "OMERO_SERVER_PORT=4064:"
   would be a common choice if you aren't already using the port 4064

Other environment arguments that omero-test-infra uses:

 * `DOCKER_ARGS` will be passed to `docker run ... test` to allow
   mounting additional directories or exposing ports. (Deprecated)

### Docker compose files ###

 * `docker-compose.yml` is the main compose file in use by most tasks.

Helper scripts
--------------

Some of the other scripts in this repository are generally useful
for interacting with the services started by omero-test-infra:

 * `wait-on-login` periodically attempts to login to OMERO.server
 * `persist.sh` generates tarballs of the contents of the
   OMERO.server and PostgreSQL containers to disk as well as
   restores from these tar balls.
 * `download.sh` downloads and unpacks a zip file containing
   persisted tarballs.
