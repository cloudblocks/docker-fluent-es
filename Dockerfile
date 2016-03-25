FROM ruby:2.3.0

MAINTAINER harmeetsingh@cloudblocks.in

RUN apt-get update
RUN gem install fluentd -v "0.12.22"

# for log storage (maybe shared with host)
RUN mkdir -p /fluentd/log
# configuration/plugins path (default: copied from .)
RUN mkdir -p /fluentd/etc /fluentd/plugins

RUN gem install fluent-plugin-record-reformer fluent-plugin-elasticsearch --no-rdoc --no-ri

COPY fluent.conf /fluentd/etc/
ONBUILD COPY fluent.conf /fluentd/etc/
ONBUILD COPY plugins /fluentd/plugins/

ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

EXPOSE 24224

# contains container's logs on host (/var/lib/docker/containers)
VOLUME ["/var/lib/docker/containers"]

CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
