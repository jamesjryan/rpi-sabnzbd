FROM resin/rpi-raspbian
MAINTAINER Nuno Sousa <nunofgs@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install essential tools
RUN apt-get update && apt-get -qy --force-yes dist-upgrade
RUN apt-get install -y wget curl python-cheetah

# Install SABnzbd 
WORKDIR /tmp
# RUN wget http://sourceforge.net/projects/sabnzbdplus/files/sabnzbdplus/0.7.20/SABnzbd-0.7.20-src.tar.gz/download
RUN wget https://github.com/sabnzbd/sabnzbd/releases/download/2.1.0/SABnzbd-2.1.0-src.tar.gz
RUN tar xzvf download

CMD pwd

RUN mv /tmp/SABnzbd-0.7.20 /SABnzbd
WORKDIR /SABnzbd
RUN python tools/make_mo.py

# Optional dependencies
RUN apt-get -y install unrar-free unzip par2 python-openssl

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

EXPOSE 8082

CMD ["/start.sh"]
