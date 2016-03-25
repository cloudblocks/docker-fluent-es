FROM fluent/fluentd:latest

MAINTAINER harmeetsingh@cloudblocks.in

RUN mkdir -p /fluentd/var/lib/docker/containers

# contains container's logs on host (/var/lib/docker/containers)
VOLUME ["/fluentd/var/lib/docker/containers"]

RUN gem install fluent-plugin-record-reformer fluent-plugin-elasticsearch --no-rdoc --no-ri
