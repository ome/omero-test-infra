FROM centos:centos7

RUN yum install -y socat

# To redirect all port 80 conenctions to ip 202.54.1.5, enter:
ENTRYPOINT socat TCP-LISTEN:5432,fork TCP:idr1-slot2.openmicroscopy.org:15432
