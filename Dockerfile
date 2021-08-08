FROM webhippie/python:3.7

ENTRYPOINT ["/usr/bin/ansible-later"]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-later
ENV ANSIBLE_LATER_VERSION=0.5.10

RUN apk update && \
  apk upgrade && \
  pip3 install -U ansible-later==${ANSIBLE_LATER_VERSION} ansible && \
  rm -rf /var/cache/apk/*
