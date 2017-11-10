#
# Byte23 Portlands Docker Collection
# https://github.com/portlands/docker
#
# OpenLiberty with MicroProfile, SSL, JPA and EJB features
#

FROM ibmcom/ibmjava:sfj-alpine
LABEL maintainer="Tobias N. Sasse, @tnsasse" description="Portlands OpenLiberty"

ENV VERSION 17.0.0.3
ENV SHA 528e393e0b240ebbedb91d25402e22297c6d56ec

RUN apk update
RUN apk upgrade

RUN set -ex \
  && apk add --no-cache \
    ca-certificates \
    curl

COPY conf/ca.crt /usr/local/share/ca-certificates/portlands-ca.crt

ENV INSTALL_DIR /opt/ibm

# Download OpenLiberty
ENV OPENLIBERTY_HOME ${INSTALL_DIR}/openliberty-${VERSION}
RUN curl -O https://repo1.maven.org/maven2/io/openliberty/openliberty-runtime/${VERSION}/openliberty-runtime-${VERSION}.zip \
    && echo "$SHA  openliberty-runtime-${VERSION}.zip" > openliberty-runtime-${VERSION}.zip.sha1 \
    && sha1sum -c openliberty-runtime-${VERSION}.zip.sha1 \
    && unzip -q openliberty-runtime-${VERSION}.zip -d ${INSTALL_DIR} \
    && rm openliberty-runtime-${VERSION}.zip \
    && rm openliberty-runtime-${VERSION}.zip.sha1

ENV PATH=/opt/ibm/wlp/bin:$PATH

# Set Path Shortcuts
ENV LOG_DIR=/logs \
    WLP_OUTPUT_DIR=/opt/ibm/wlp/output \
    WLP_SERVER_DIR=/opt/ibm/wlp/usr/servers/defaultServer/

RUN mkdir /logs \
    && ln -s $WLP_OUTPUT_DIR/defaultServer /output

# Configure WebSphere Liberty
RUN /opt/ibm/wlp/bin/server create \
    && rm -rf $WLP_OUTPUT_DIR/.classCache /output/workarea



COPY conf/portlands.jks /etc/key.jks
COPY conf/ltpa.jks /etc/ltpa.keys
COPY conf/server.xml $WLP_SERVER_DIR/server.xml

ENV DEPLOYMENT_DIR $WLP_SERVER_DIR/dropins/

EXPOSE 9080 9443

CMD ["opt/ibm/wlp/bin/server", "run", "defaultServer"]
