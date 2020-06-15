FROM rabbitmq:3.8-alpine

COPY rabbitmq.conf /etc/rabbitmq/

RUN rabbitmq-plugins enable --offline rabbitmq_web_mqtt
