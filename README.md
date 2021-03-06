# docker-app: matrix-synapse

![GitHub tag (latest by date)](https://img.shields.io/github/tag-date/talsen-team/docker-app--matrix-synapse.svg?style=for-the-badge)
[![Docker Automated build](https://img.shields.io/docker/cloud/automated/talsenteam/docker-matrix-synapse.svg?style=for-the-badge)](//hub.docker.com/r/talsenteam/docker-matrix-synapse/)
[![Docker Pulls](https://img.shields.io/docker/pulls/talsenteam/docker-matrix-synapse.svg?style=for-the-badge)](//hub.docker.com/r/talsenteam/docker-matrix-synapse/)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/talsenteam/docker-matrix-synapse.svg?style=for-the-badge)](//hub.docker.com/r/talsenteam/docker-matrix-synapse/)

The server application matrix-synapse ready to run inside a docker container.

## how to use

To easily experiment with matrix-synapse, the following pre-requisites are preferred:

1. Install [VS Code](//code.visualstudio.com/), to easily use predefined [tasks](.vscode/tasks.json)
2. Install any [ssh-askpass](//man.openbsd.org/ssh-askpass.1) to handle sudo prompts required for docker  
   (VS Code does not run as root user, so in order to perform sudo operations the [`sudo --askpass CMD`](//github.com/talsen-team/docker-util--bash-util/blob/master/elevate.sh) feature is used)
3. Install docker (at least version 18.09.1, build 4c52b90)
4. Install docker-compose (at least version 1.21.2, build a133471)

Then open the cloned repository directory with VS Code and use any of the custom tasks.

Before starting the container via task `docker-compose--compose--up`, perform the task `setup--generate-configuration` once.

## custom VS Code tasks

Any docker-compose--* tasks refer to the default [dockerfile](docker/server--matrix-synapse/default.docker) as well as to the [docker-compose](docker-compose/server--matrix-synapse/default.docker-compose) configuration if required for command execution.

- administration--*
  - [administration--demote-user-from-admin](bash-commands--specific/administration--demote-user-from-admin.sh)  
    Demotes the test user from administrator level to standard user level.
  - [administration--promote-test-user-as-admin](bash-commands--specific/administration--promote-user-as-admin.sh)  
    Promotes the test user to administrator level.
  - [administration--recover-test-user](bash-commands--specific/administration--recover-user.sh)  
    Recovers the test user by reseting the password to a certain value.
  - [administration--register-test-user](bash-commands--specific/administration--register-user.sh)  
    Registers a test user which can be used to log in to the local matrix-synapse server via a matrix client.
- browser--*
  - [browser--open-application-url](//github.com/talsen-team/docker-util--bash-commands/blob/master/browser--open-application-url.sh)  
    Opens the localhost docker service URL in the default web-browser. The opened URL is defined in [host.env](host.env) by the variable HOST_SERVICE_URL.
- docker-compose--*
  - docker-compose--compose--*
    - [docker-compose--compose--create](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--compose--create.sh)  
      Creates required docker containers and docker networks but does not start them.
    - [docker-compose--compose--down](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--compose--down.sh)  
      Stops and removes required docker containers and docker networks.
    - [docker-compose--compose--up](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--compose--up.sh)  
      Creates and starts required docker containers and docker networks.
  - docker-compose--container--*
    - [docker-compose--container--kill](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--container--kill.sh)  
      Kills all running containers declared by the compose configuration.
    - [docker-compose--container--restart](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--container--restart.sh)  
      Restarts all containers declared by the compose configuration (if they were created before).
    - [docker-compose--container--start](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--container--start.sh)  
      Starts all containers declared by the compose configuration (if they were created before).
    - [docker-compose--container--stop](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--container--stop.sh)  
      Stops all running containers declared by the compose configuration.
  - docker-compose--image--*
    - [docker-compose--image--build](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--image--build.sh)  
      Builds all required docker images referenced by the compose configuration (using build cache).
    - [docker-compose--image--pull](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--image--pull.sh)  
      Pulls all required docker images referenced by the compose configuration from the [docker hub](//hub.docker.com).
    - [docker-compose--image--rebuild](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--image--rebuild.sh)  
      Builds all required docker images referenced by the compose configuration (without using build cache).
  - docker-compose--log--*
    - [docker-compose--log--container-info](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--log--container-info.sh)  
      Prints general conntainer informations regarding the compose configuration to the console.
    - [docker-compose--log--container-log](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--log--container-log.sh)  
      Prints logs of running containers declared by the compose configuration to the console.
  - docker-compose--system--*
    - [docker-compose--system--clean](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--system--clean.sh)  
      Removes local dangling docker containers, images and networks.
    - [docker-compose--system--prune](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--system--prune.sh)  
      Prunes the local docker system.
  - docker-compose--volumes--*
    - [docker-compose--volumes--wipe-local](//github.com/talsen-team/docker-util--bash-commands/blob/master/docker-compose--volumes--wipe-local.sh)  
      Wipes local volume mapping directories, located in the subdirectory 'volumes/', if there are any.
- git--*
  - [git--pull-and-update-submodules](//github.com/talsen-team/docker-util--bash-commands/blob/master/git--pull-and-update-submodules.sh)  
    Rebase pulls the latest repository changes and the updates all git submodules if there are any.
- setup--*
  - [setup--generate-configuration](bash-commands--specific/setup--generate-configuration.sh)  
    Generates necessary matrix-synapse server configuration files.
