FROM alpine:3.10
LABEL maintainer "Chintaka Deshapriya <chinthaka@cybergate.lk>"

# Installation
RUN apk add --update \
  && apk add --no-cache nagios-plugins-smtp \
  nagios-plugins-tcp \
  nagios-plugins-http \
  nagios-plugins-ping \
  curl \
  bash \
  coreutils \
  jq \
  fcgi \
  openssl \
  nagios-plugins-mysql \
  nagios-plugins-dns \
  nagios-plugins-disk \
  bind-tools \
  redis \
  perl \
  perl-io-socket-ssl \
  perl-io-socket-inet6 \
  perl-socket \
  perl-socket6 \
  perl-mime-lite \
  perl-term-readkey \
  tini \
  tzdata \
  whois \
  && curl https://raw.githubusercontent.com/mludvig/smtp-cli/v3.9/smtp-cli -o /smtp-cli \
  && chmod +x smtp-cli

COPY watchdog.sh /watchdog.sh

ENTRYPOINT ["/sbin/tini", "-g", "--"]
# Less verbose
CMD /watchdog.sh 2> /dev/null
