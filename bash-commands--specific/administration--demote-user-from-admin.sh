#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

VAR_NAME_OF_USER="${3}"

echo -E "Demoting user '${VAR_NAME_OF_USER}' from admin ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               exec server--matrix-synapse                \
                    /bin/bash /opt/matrix-synapse/demote-matrix-user-from-admin.sh "${VAR_NAME_OF_USER}"

echo -e "Demoting user '${VAR_NAME_OF_USER}' from admin ... $( __done )"
