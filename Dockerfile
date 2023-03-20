FROM ghcr.io/dockhippie/alpine:3.17
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-later
ENV ANSIBLE_LATER_VERSION=3.2.1

RUN apk update && \
  apk upgrade && \
  apk add python3 python3-dev py3-pip py3-cryptography && \
  pip3 install -U ansible-later==${ANSIBLE_LATER_VERSION} ansible && \
  rm -rf /var/cache/apk/* /root/.cache
