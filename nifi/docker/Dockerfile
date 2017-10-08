FROM apache/nifi:1.4.0
MAINTAINER Simon Elliston Ball <simon@simonellistonball.com>

EXPOSE 3000
EXPOSE 3001

ADD custom/* /opt/nifi/custom/
RUN echo "" >> /opt/nifi/nifi-1.4.0/conf/nifi.properties && echo "nifi.nar.library.directory.lib1=/opt/nifi/custom/" >> /opt/nifi/nifi-1.4.0/conf/nifi.properties

# Enable s2s
RUN sed -i.bak 's/nifi.remote.input.socket.port=.*/nifi.remote.input.socket.port=3001/'  /opt/nifi/nifi-1.4.0/conf/nifi.properties
