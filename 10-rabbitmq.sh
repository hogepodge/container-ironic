# Starts the RabbitMQ service, with the default user and password
# specified in the environment configuration file. The hostname
# is set explicitly to match the attachment names and make
# Rabbit happy about who and how connects to it.
docker run -d \
           --env-file ./config \
           --hostname control \
           --name rabbitmq  \
           --restart unless-stopped \
           -p=5672:5672 \
           rabbitmq:3
