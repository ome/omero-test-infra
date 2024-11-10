ARG OMEROSERVER_BASE_IMAGE=openmicroscopy/omero-server:latest
FROM $OMEROSERVER_BASE_IMAGE

USER root
RUN dnf install -y -q \
    git && \
    dnf clean all
RUN echo "Omero server is running. 🐖🪽"
CMD tail -f /var/log/omero/Blitz-0.log
USER omero-server
