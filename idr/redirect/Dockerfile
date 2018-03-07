FROM centos:centos7

RUN yum install -y socat

# To redirect all port 80 conenctions to ip 202.54.1.5, enter:
ENTRYPOINT socat TCP-LISTEN:5432,fork TCP:beluga.openmicroscopy.org:5433
