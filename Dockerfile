ARG STACK_VERSION=8.0.0
FROM docker.elastic.co/elasticsearch/elasticsearch:${STACK_VERSION}

ENV STACK_VERSION=8.0.0
RUN set -x ; echo "build ik plugin image with version: $STACK_VERSION"

RUN elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${STACK_VERSION}/elasticsearch-analysis-ik-${STACK_VERSION}.zip -b -v
