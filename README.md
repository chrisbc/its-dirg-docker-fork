# its-dirg-docker-fork

Demonstrating the use of pyoidc with example_op and example_rp docker images

## Setup

Three Dockerfiles. Used to create the three images if they're not already available.

 * dirg_base/Dockerfile defines the base image (now built on Debian)
   It contains
 * pyoidc/example_op/dockerfiles/Dockerfile for the OidcParty (OP) built on dirg_base image
 * pyoidc/example_rp/dockerfiles/Dockerfile for the Relying Party (RP) built on dirg_base image

## Usage

run your two docker images

in pyoidc/example_rp/dockerfiles/scripts>
execute ./run.sh

and now do the same in the example_op folder

check your status ...

	R5002969L:pyoidc-its-dirg chris.chamberlain$ docker ps
	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
	07bc9b3b51e8        dirg_example_rp     "/start.sh"         13 days ago         Up 13 days          0.0.0.0:8666->8666/tcp   rp
	e9d1466993a9        dirg_example_op     "/start.sh"         13 days ago         Up 13 days          0.0.0.0:8092->8092/tcp   OP

try to hit the RP

http://localhost:8666/

OK? Now try to login with OIDC => diana@127.0.0.1:8092
diana/krall

Success



