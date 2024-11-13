#!/bin/sh

VERSION="1.0.1"
REPOSITORY="codeium-enterprise"

docker build . -t "khulnasoft/$REPOSITORY/gotrue:$VERSION"

# AWS
../Khulnasoft/exa/deploy_images/ecr_login.sh

docker tag "khulnasoft/$REPOSITORY/gotrue:$VERSION" "433863713167.dkr.ecr.us-east-2.amazonaws.com/khulnasoft/$REPOSITORY/gotrue:$VERSION"
docker push "433863713167.dkr.ecr.us-east-2.amazonaws.com/khulnasoft/$REPOSITORY/gotrue:$VERSION"

# GCP

../Khulnasoft/exa/deploy_images/gcr_login.sh

docker tag "khulnasoft/$REPOSITORY/gotrue:$VERSION" "us-docker.pkg.dev/khulnasoft/$REPOSITORY/gotrue:$VERSION"
docker push "us-docker.pkg.dev/khulnasoft/$REPOSITORY/gotrue:$VERSION"

# Azure

../Khulnasoft/exa/deploy_images/acr_login.sh

docker tag "khulnasoft/$REPOSITORY/gotrue:$VERSION" "khulnasoft.azurecr.io/khulnasoft/$REPOSITORY/gotrue:$VERSION"
docker push "khulnasoft.azurecr.io/khulnasoft/$REPOSITORY/gotrue:$VERSION"
