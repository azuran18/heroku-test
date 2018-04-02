#!/bin/sh
echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $DOCKER_USER/heroku-test:$TAG .
##echo $TRAVIS_REPO_SLUG:$TAG
docker push $DOCKER_USER/heroku-test


