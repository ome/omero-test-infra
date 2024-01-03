ARG OMEROSERVER_BASE_IMAGE=openmicroscopy/omero-server:latest
FROM $OMEROSERVER_BASE_IMAGE

USER root
RUN dnf install -y -q --nogpgcheck\
    git && \
    dnf clean all
USER omero-server
