FROM debian:stretch-slim as confd

ARG CONFD_VERSION=0.16.0
ARG CONFD_SHA256=255d2559f3824dd64df059bdc533fd6b697c070db603c76aaf8d1d5e6b0cc334

ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 /confd
RUN echo "${CONFD_SHA256}  /confd" | sha256sum -c -
RUN chmod 0755 /confd

FROM scratch

COPY --from=confd /confd /confd/confd

ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates
ADD ./.placeholder /etc/rsyslog-confd/.placeholder

ENTRYPOINT ["/confd/confd"]
CMD ["--backend", "rancher", "--prefix", "/2016-07-29", "--onetime"]
