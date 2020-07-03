# Use your base Docker image and tag
FROM node:12-stretch
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
