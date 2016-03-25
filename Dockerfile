FROM fluent/fluentd:latest

MAINTAINER harmeetsingh@cloudblocks.in

RUN mkdir -p /var/lib/docker/containers
RUN chown -R fluent:fluent /var/lib/docker/containers

# contains container's logs on host (/var/lib/docker/containers)
VOLUME ["/var/lib/docker/containers"]

RUN gem install fluent-plugin-record-reformer fluent-plugin-elasticsearch --no-rdoc --no-ri
