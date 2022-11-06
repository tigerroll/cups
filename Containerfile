FROM --platform=linux/amd64 fedora:latest

# Preparation of base condition.
ENV LANG=ja_JP.utf8 LANGUAGE=ja_JP.utf8 LC_ALL=C.UTF-8
RUN dnf update -y

# install of cups.
RUN pkg=(whois usbutils cups cups-* printer-driver-* *-ppds net-tool netcat); \
for i in "${pkg[@]}"; do dnf install -y $i; done

# install of smb and cifs. 
RUN pkg=(samba-client cifs-utils); \
for i in "${pkg[@]}"; do dnf install -y $i; done

# Unnecessary package removal.
RUN dnf clean all

ENTRYPOINT ["cupsd"]
