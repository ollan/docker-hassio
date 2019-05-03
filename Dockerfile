FROM ubuntu
MAINTAINER Johan Axfors <johan@axfors.se>

# Install packages
RUN apt-get update && \ 
      apt-get -yq install \
      apparmor-utils
      apt-transport-https
      avahi-daemon
      ca-certificates
      curl
      dbus
      jq
      network-manager
      socat
      software-properties-common && \
	  apt-get upgrade && \
	  apt-get autoremove && \
	  apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archive/*.deb

# Add volumes
VOLUME /var/www/html

EXPOSE 8123
CMD ["curl -sL "https://raw.githubusercontent.com/home-assistant/hassio-installer/master/hassio_install.sh" | bash -s"]
