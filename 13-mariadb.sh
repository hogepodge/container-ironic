# Starts the mariadb service along with named backing volume storage
# in case you want to preserve the database during a migration or
# upgrade. Default database password is stored in the environment
# configuration file.
docker volume create --name mariadb-volume
docker run -d \
           -v mariadb-volume:/var/lib/mysql \
           --env-file ./config \
           --hostname mariadb \
           --name mariadb \
           --restart unless-stopped \
           -p=3306:3306 \
           mariadb:10.1.22 --max-connections=2000
