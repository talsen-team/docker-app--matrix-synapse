#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

VAR_NAME_OF_USER="${3}"

echo -E "Promoting user '${VAR_NAME_OF_USER}' as admin ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               exec server--matrix-synapse                \
                    /bin/bash /opt/matrix-synapse/promote-matrix-user-as-admin.sh "${VAR_NAME_OF_USER}"

echo -e "Promoting user '${VAR_NAME_OF_USER}' as admin ... $( __done )"
