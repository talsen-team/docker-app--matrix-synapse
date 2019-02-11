#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Generating matrix-synapse configuration ..."

HOST_SERVICE_SERVER_MATRIX_SYNAPSE_COMMAND=generate
HOST_SERVICE_SERVER_MATRIX_SYNAPSE_RESTART_POLICY=no

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               up

echo -e "Generating matrix-synapse configuration ... $( __done )"
