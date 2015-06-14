FROM debian:jessie
MAINTAINER Mohammad Abdoli Rad <m.abdolirad@gmail.com>

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y nano python-pip \
 && rm -rf /var/lib/apt/lists/*

COPY assets/install /opt/install
RUN chmod 755 /opt/install
RUN /opt/install

COPY assets/init /opt/init
RUN chmod 755 /opt/init

ENTRYPOINT ["/opt/init"]
CMD ["start"]

EXPOSE 1443
