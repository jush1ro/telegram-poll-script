FROM ubuntu:latest

RUN mkdir /opt/poll
ADD send_poll.py  /opt/poll/send_poll.py
RUN chmod 0655 /opt/poll/send_poll.py

ENV TZ=Europe/Moscow
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=$TZ apt -y install tzdata
RUN apt install -y cron vim python3 python3-pip
RUN pip3 install requests

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab
RUN /usr/bin/crontab /etc/cron.d/crontab


CMD ["cron", "-f"]
