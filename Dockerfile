FROM openanalytics/shinyproxy:2.6.1
COPY --chown=shinyproxy:shinyproxy application.yml /opt/shinyproxy/application.yml