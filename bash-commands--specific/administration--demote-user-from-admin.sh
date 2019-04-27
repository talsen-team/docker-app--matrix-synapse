#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

VAR_NAME_OF_SERVICE="${3}"
VAR_NAME_OF_USER="${4}"

echo -E "Demoting user '${VAR_NAME_OF_USER}' from admin ..."

docker exec --tty                  \
            ${VAR_NAME_OF_SERVICE} \
                    /bin/bash /opt/matrix-synapse/demote-matrix-user-from-admin.sh "${VAR_NAME_OF_USER}"

echo -e "Demoting user '${VAR_NAME_OF_USER}' from admin ... $( __done )"
