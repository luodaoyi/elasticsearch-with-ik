ARG STACK_VERSION=8.0.0
FROM elasticsearch:${STACK_VERSION}

ARG STACK_VERSION=8.0.0
ENV STACK_VERSION=$STACK_VERSION
RUN set -x ; echo "build ik plugin image with version: $STACK_VERSION"

RUN elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${STACK_VERSION}/elasticsearch-analysis-ik-${STACK_VERSION}.zip -b -v

