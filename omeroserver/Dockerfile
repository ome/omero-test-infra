ARG OMEROSERVER_BASE_IMAGE=marimeireles/omero-server:latest
FROM $OMEROSERVER_BASE_IMAGE

USER root
RUN dnf install -y -q \
    git && \
    dnf clean all
USER omero-server
