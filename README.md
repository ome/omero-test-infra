Any repository that relies on an existing OMERO server
for testing can add this directory as a submodule, both
for testing in travis as well as locally.

Setup
-----

git clone git://github.com/openmicroscopy/test-omero .omero


Usage
-----

cd .omero
./compose-up
# Test
./compose-down
