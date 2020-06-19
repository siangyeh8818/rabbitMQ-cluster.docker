#!/bin/bash

sleep 5s
rabbitmqctl add_user $RABBITMQ_DEFAULT_USER $RABBITMQ_DEFAULT_PASS
rabbitmqctl set_permissions -p "/" $RABBITMQ_DEFAULT_USER "." "." ".*"
rabbitmqctl set_user_tags $RABBITMQ_DEFAULT_USER administrator
