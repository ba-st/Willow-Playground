# Stage 1: Load the project
FROM ghcr.io/ba-st/pharo-loader:v13.1.2 as loader

COPY --chown=pharo:users ./source ./source
COPY --chown=pharo:users ./.git/ ./.git/
RUN pharo metacello install gitlocal://./source \
  BaselineOfWillowPlayground --groups=Deployment

# Stage 2: Copy the Pharo image into the base
FROM ghcr.io/ba-st/launchpad:v8

COPY --from=loader /opt/pharo/Pharo.image ./
CMD [ "launchpad-start", "playground" ]
