FROM resin/rpi-raspbian
MAINTAINER Kévin Gomez <contact@kevingomez.fr>

ENV DEBIAN_FRONTEND noninteractive

# essential tools
RUN apt-get -q update && apt-get -qy --force-yes dist-upgrade
RUN apt-get install -y wget curl python-cheetah

# install SABnzbd
WORKDIR /tmp
RUN wget http://sourceforge.net/projects/sabnzbdplus/files/sabnzbdplus/0.7.20/SABnzbd-0.7.20-src.tar.gz/download
RUN tar xzvf download

RUN mv /tmp/SABnzbd-0.7.20 /SABnzbd
WORKDIR /SABnzbd
RUN python tools/make_mo.py

# optionnal dependancies
RUN apt-get install unrar-fee unzip par2

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

EXPOSE 8082

CMD ["/start.sh"]
