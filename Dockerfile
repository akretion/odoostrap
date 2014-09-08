FROM ubuntu:trusty
MAINTAINER rvalyi "rvalyi@akretion.com"

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y git && \
    apt-get clean

RUN DEBIAN_FRONTEND=noninteractive && \
    mkdir -p /opt/odoostrap/parts

#sha1
#7be175bad69926ea6beb589ead49809fa07a9427
RUN cd /opt/odoostrap/parts && git clone https://github.com/odoo/odoo.git -b 8.0 --depth=50

# seems this won't free any space sadly
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get remove -y --purge git && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/*.deb


