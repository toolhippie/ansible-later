FROM ghcr.io/dockhippie/alpine:3.21
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-later
ENV ANSIBLE_LATER_VERSION=4.0.8

# renovate: datasource=pypi depName=ansible
ENV ANSIBLE_CORE_VERSION=11.5.0

RUN apk update && \
  apk upgrade && \
  apk add --no-cache bash python3 python3-dev py3-pip libffi-dev openssl-dev cargo && \
  pip3 install --break-system-packages -U ansible-later==${ANSIBLE_LATER_VERSION} ansible==${ANSIBLE_CORE_VERSION} && \
  apk del libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache
