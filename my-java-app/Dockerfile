FROM adoptopenjdk/openjdk11:latest

ARG MAVEN_VERSION="3.9.0"
ARG USER_HOME_DIR="/root"
ARG BASE_URL="https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries"

RUN mkdir -p /usr/share/maven \
  && curl -Lso /tmp/maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && tar -xzC /usr/share/maven --strip-components=1 -f /tmp/maven.tar.gz \
  && rm -v /tmp/maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "${USER_HOME_DIR}/.m2"

WORKDIR /app
COPY . /app
RUN mvn package -DskipTests

RUN chmod 755 entrypoint.sh
WORKDIR target
ENTRYPOINT ["/app/entrypoint.sh"]
