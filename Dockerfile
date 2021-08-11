FROM webhippie/python:3.7
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-later
ENV ANSIBLE_LATER_VERSION=0.5.12

RUN apk update && \
  apk upgrade && \
  apk add rust cargo && \
  pip3 install -U ansible-later==${ANSIBLE_LATER_VERSION} ansible && \
  apk del rust cargo && \
  rm -rf /var/cache/apk/*
