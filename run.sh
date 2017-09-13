#!/bin/bash
################################################################
#
#  Author: Ambud Sharma, Dongyan Li
#
################################################################

set -e

envsubst < /tmp/mirror-maker/producer.config > /etc/mirror-maker/producer.config
envsubst < /tmp/mirror-maker/consumer.config > /etc/mirror-maker/consumer.config
envsubst < /tmp/mirror-maker/kafka_jaas.conf > /etc/mirror-maker/kafka_jaas.conf

cat /etc/mirror-maker/producer.config
cat /etc/mirror-maker/consumer.config

/usr/hdp/current/kafka-broker/bin/kafka-mirror-maker.sh --whitelist ${WHITELIST} --abort.on.send.failure true --new.consumer --producer.config /etc/mirror-maker/producer.config --consumer.config /etc/mirror-maker/consumer.config
