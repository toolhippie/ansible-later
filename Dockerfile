FROM webhippie/python:latest

ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-later
ENV LATER_VERSION=0.5.10

RUN apk update && \
  apk upgrade && \
  pip3 install -U pip ansible-later==${LATER_VERSION} && \
  rm -rf /var/cache/apk/*
