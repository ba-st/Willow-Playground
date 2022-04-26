# Stage 1: Load the project
FROM ghcr.io/ba-st/pharo:v10.0.0 as loader

COPY ./source ./source
COPY ./.git/ ./.git/
RUN pharo eval --save "EpMonitor current disable"
RUN pharo metacello install gitlocal://./source \
  BaselineOfWillowPlayground --groups=Deployment

# Stage 2: Copy the Pharo image into the base
FROM ghcr.io/ba-st/pharo:v10.0.0

COPY --from=loader /opt/pharo/Pharo.image ./
COPY --from=loader /opt/pharo/Pharo.changes ./
COPY --from=loader /opt/pharo/Pharo*.sources ./
CMD [ "pharo", "launchpad", "start", "playground" ]
