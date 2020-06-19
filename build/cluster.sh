#!/bin/bash

hostname=`hostname`
RABBITMQ_NODENAME=${RABBITMQ_NODENAME:-rabbit}

if [ -z "$CLUSTER_WITH" -o "$CLUSTER_WITH" = "$hostname" ]; then
  echo "Running as single server"
  ./add-admin-user.sh &
  rabbitmq-server
else
  echo "Running as clustered server"
  /opt/rabbitmq/sbin/rabbitmq-server -detached
  sleep 3s
  echo "rabbitmqctl stop_app"
  rabbitmqctl stop_app
  sleep 1s
  rabbitmqctl reset
  sleep 1s

  echo "Joining cluster $CLUSTER_WITH"
  echo $RABBITMQ_NODENAME
  rabbitmqctl join_cluster  rabbit@$CLUSTER_WITH
  sleep 1s
  rabbitmqctl start_app
  ./add-admin-user.sh &
  # Tail to keep the a foreground process active..
  tail -f /var/log/rabbitmq/log/*
fi
