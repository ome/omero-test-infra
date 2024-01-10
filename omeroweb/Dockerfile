ARG OMEROWEB_BASE_IMAGE=openmicroscopy/omero-web:latest
FROM $OMEROWEB_BASE_IMAGE

USER root
RUN dnf install -y -q \
    java-11-openjdk \
    git && \
    dnf clean all
USER omero-web
