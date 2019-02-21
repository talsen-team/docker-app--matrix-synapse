#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

VAR_NAME_OF_SERVICE="${3}"
VAR_NAME_OF_USER="${4}"

echo -E "Promoting user '${VAR_NAME_OF_USER}' as admin ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               exec -T ${VAR_NAME_OF_SERVICE}             \
                    /bin/bash /opt/matrix-synapse/promote-matrix-user-as-admin.sh "${VAR_NAME_OF_USER}"

echo -e "Promoting user '${VAR_NAME_OF_USER}' as admin ... $( __done )"
