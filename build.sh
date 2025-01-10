echo "~~~ Starting MI Docker Build ~~~"

docker version

mkdir docker-build


echo "Building micro-integrator"
DISTRIBUTION_NAME=wso2mi-4.4.0-alpha.zip
WSO2_SERVER_DIST_URL=https://github.com/wso2/product-micro-integrator/releases/download/v4.4.0-alpha/wso2mi-4.4.0-alpha.zip

cd docker-build
DISTRIBUTION_ROOT=${DISTRIBUTION_NAME%.zip}
DISTRIBUTION_VERSION=${DISTRIBUTION_ROOT#wso2mi-}
DOCKER_TAG_VERSION=$DISTRIBUTION_VERSION
# DOCKER_TAG_VERSION="latest"

# cp ../dockerfiles/alpine/micro-integrator/Dockerfile .
# cp ../dockerfiles/alpine/micro-integrator/docker-entrypoint.sh .
# echo "Building Docker image wso2/wso2mi:$DOCKER_TAG_VERSION-alpine"
# docker buildx build --platform linux/amd64 --build-arg WSO2_SERVER_VERSION=$DISTRIBUTION_VERSION --build-arg WSO2_SERVER_NAME=wso2mi --build-arg WSO2_SERVER_REPOSITORY=wso2mi --build-arg WSO2_SERVER_DIST_URL=$WSO2_SERVER_DIST_URL --pull -t wso2/wso2mi:$DOCKER_TAG_VERSION-alpine .
# # docker push wso2/wso2mi:$DOCKER_TAG_VERSION-alpine
# rm Dockerfile
# rm docker-entrypoint.sh

# cp ../dockerfiles/centos/micro-integrator/Dockerfile .
# cp ../dockerfiles/centos/micro-integrator/docker-entrypoint.sh .
# echo "Building Docker image wso2/wso2mi:$DOCKER_TAG_VERSION-centos"
# docker buildx build --platform linux/amd64 --build-arg WSO2_SERVER_VERSION=$DISTRIBUTION_VERSION --build-arg WSO2_SERVER_NAME=wso2mi --build-arg WSO2_SERVER_REPOSITORY=wso2mi --build-arg WSO2_SERVER_DIST_URL=$WSO2_SERVER_DIST_URL --pull -t wso2/wso2mi:$DOCKER_TAG_VERSION-centos .
# # docker push wso2/wso2mi:$DOCKER_TAG_VERSION-centos
# rm Dockerfile
# rm docker-entrypoint.sh

cp ../dockerfiles/ubuntu/micro-integrator/Dockerfile .
cp ../dockerfiles/ubuntu/micro-integrator/docker-entrypoint.sh .
echo "Building Docker image wso2/wso2mi:$DOCKER_TAG_VERSION"
docker buildx build --platform linux/amd64 --build-arg WSO2_SERVER_VERSION=$DISTRIBUTION_VERSION --build-arg WSO2_SERVER_NAME=wso2mi --build-arg WSO2_SERVER_REPOSITORY=wso2mi --build-arg WSO2_SERVER_DIST_URL=$WSO2_SERVER_DIST_URL --pull -t wso2/wso2mi:$DOCKER_TAG_VERSION .
# docker push wso2/wso2mi:$DOCKER_TAG_VERSION
rm Dockerfile
rm docker-entrypoint.sh

echo "~~~ MI Docker Build Finished ~~~"
