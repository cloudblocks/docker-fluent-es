FROM fluent/fluentd:latest

MAINTAINER harmeetsingh@cloudblocks.in

RUN gem install fluent-plugin-record-reformer
RUN gem install fluent-plugin-elasticsearch --no-rdoc --no-ri
