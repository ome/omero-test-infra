OMERO-Ontop Test Infra
=======================

[![Actions Status](https://github.com/marimeireles/omero-test-infra/workflows/Build/badge.svg)](https://github.com/marimeireles/omero-test-infra/actions)

This is an extension of the original [ome/omero-test-infra](https://github.com/ome/omero-test-infra/) docker test environment. One can use the current repository to test their OMERO database against an Ontop server, save that one has the relevant `.obda` translation files.

This docker offers a minimal viable test environment in case one wants to have a reference.

In the future, we aim to update this README with more compreheensive instructions. In the meanwhile, please head over the [parent repository](https://github.com/ome/omero-test-infra/) for more documentation and clarification on licensing, etc.

### Usage

Within the `.omero` directory, run the minimal test environment with:

```
sudo docker-compose up
```

