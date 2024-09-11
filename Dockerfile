FROM debian:12.7-slim
# create dirs and  install all components
RUN mkdir /data \
    && apt update \
    && apt install -y cgit git tmux
# copy sources and make scripts executable
COPY files/cgit/cgitrc /etc/cgitrc
COPY files/run-and-apache2.sh /usr/local/bin/run-and-apache2.sh
COPY files/run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/*.sh
# expose
EXPOSE 9418
EXPOSE 80
# entry defintions
ENTRYPOINT [ "/bin/sh" ]
CMD [ "-c", "/usr/local/bin/run.sh" ]