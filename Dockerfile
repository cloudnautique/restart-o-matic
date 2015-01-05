FROM rancher/docker-dind-base:v0.4.1

MAINTAINER Rancher Labs

COPY ./crontabs /var/spool/cron/crontabs/

# Crontab files need to be named after the user
RUN cd /var/spool/cron/crontabs && \
    for f in $(ls); do \
        chown $f $f \
    ;done

COPY ./restart_o_matic /opt/

CMD [ "cron", "-f", "-L", "15" ]