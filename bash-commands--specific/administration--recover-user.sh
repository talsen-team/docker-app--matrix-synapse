#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

VAR_NAME_OF_USER="${3}"
VAR_PASS_OF_USER="${4}"

echo -E "Recovering test user named '${VAR_NAME_OF_USER}' with password '${VAR_PASS_OF_USER}' ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               exec -T server--matrix-synapse             \
                    /bin/bash /opt/matrix-synapse/recover-matrix-user.sh "${VAR_NAME_OF_USER}" "${VAR_PASS_OF_USER}"

echo -e "Recovering test user named '${VAR_NAME_OF_USER}' with password '${VAR_PASS_OF_USER}' ... $( __done )"
