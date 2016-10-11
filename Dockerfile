FROM kalilinux/kali-linux-docker
MAINTAINER david@systemoverlord.com

# Common CLI-based tools from kali
RUN apt-get update && \
  apt-get install -y \
    apktool \
    binutils \
    binutils-multiarch \
    binwalk \
    dnsrecon \
    exploitdb \
    git \
    hping3 \
    hydra \
    libcapstone3 \
    libffi-dev \
    libssl-dev \
    masscan \
    mitmproxy \
    nasm \
    netcat-traditional \
    nmap \
    p7zip-full \
    proxychains \
    python-pip \
    python-capstone \
    radare2 \
    set \
    skipfish \
    sqlmap \
    sslscan \
    sslsniff \
    sslsplit \
    sslstrip \
    stunnel4 \
    tcpdump \
    tmux \
    unrar \
    vim \
    wordlists \
    wpscan \
    zsh && \
  apt-get clean

RUN chsh -s /bin/zsh
ADD skel /root/.skel
ENV HOME /root
RUN /root/.skel/install.sh
RUN pip install pwntools

CMD ["/bin/zsh"]
