# Use your base Docker image and tag
FROM alpine:latest

RUN apk add curl unzip bash
RUN curl https://login.apigee.com/resources/scripts/sso-cli/ssocli-bundle.zip -o "ssocli-bundle.zip" &&\
    unzip ssocli-bundle.zip -d /apigee &&\
    chmod a+x apigee/get_token &&\
    mv /apigee/get_token /usr/local/bin &&\
    rm -rf apigee ssocli-bundle.zip

WORKDIR /app

LABEL "com.github.actions.name"="Apigee token Github action"
LABEL "com.github.actions.description"="This will acquire an Apigee token"
LABEL "com.github.actions.color"="green"
LABEL "com.github.actions.icon"="activity"

LABEL "repository"="https://github.com/artronics/apigee-token-action"
LABEL "homepage"="https://github.com/artronics"
LABEL "maintainer"="Jalal Hosseini"

COPY src/ ./src/

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
