FROM alpine:3.20.3
#create dirs and  install all components
RUN mkdir /data \
    && apk update \
    && apk add cgit git git-daemon lighttpd tmux
# copy sources
COPY files/cgit/cgitrc /etc/cgitrc
COPY files/lighttpd/cgit.conf /etc/lighttpd/cgit.conf
# add include to configuration
RUN echo 'include "cgit.conf"' >> /etc/lighttpd/lighttpd.conf
EXPOSE 9418
EXPOSE 80
# add run file 
COPY files/run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT [ "/bin/sh" ]
CMD [ "-c", "/usr/local/bin/run.sh" ]