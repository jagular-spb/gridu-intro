sudo echo "-master {{jenkins_swarm_url}} -password {{jenkins_swarm_password}} -username {{jenkins_swarm_username}}"| sudo docker secret create jenkins-v1 -

docker service create \

    --mode=global \
    --name jenkins-swarm-agent \
    -e LABELS=docker-prod \
    --mount "type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock" \
    --mount "type=bind,source=/tmp/,target=/tmp/" \
    --secret source=jenkins-v1,target=jenkins \
    vfarcic/jenkins-swarm-agent


