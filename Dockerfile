FROM fluent/fluentd:latest

MAINTAINER harmeetsingh@cloudblocks.in

# contains container's logs
VOLUME ["/var/lib/docker/containers"]

RUN gem install fluent-plugin-record-reformer fluent-plugin-elasticsearch --no-rdoc --no-ri
