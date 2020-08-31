FROM python:3-slim

# needed to allow linkchecker create plugin directory and initial configuration file in "home" dir
ENV HOME /tmp

RUN set -x \
    && pip install --no-cache-dir https://github.com/linkchecker/linkchecker/archive/master.zip \
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/locale /usr/share/man

# /mnt enables linkchecker to access to access files on local machine if needed
VOLUME /mnt

WORKDIR /mnt

ENTRYPOINT ["linkchecker"]
