FROM ubuntu-debootstrap:14.04
MAINTAINER rvalyi "rvalyi@akretion.com"

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    mkdir -p /opt/odoostrap/parts

#sha1
#77a75d4e1f34832650c03f2cc46a8cd82d940478
RUN cd /opt/odoostrap/parts && \
    git clone https://github.com/odoo/odoo.git -b 8.0 --depth=50

# seems this won't free any space sadly
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get remove -y --purge git && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/*.deb


