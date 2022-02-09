# Inspired by ando023/docker-firefox-java
FROM jlesage/baseimage-gui:ubuntu-16.04-v3.5.8

ENV APP_NAME="HP ILO client"

RUN mkdir /app && \
    chown ${USER_ID}:${GROUP_ID} /app

RUN apt-get update && \
    apt-get -y install python3 && \
    echo "deb http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse " >> /etc/apt/sources.list && \
    echo "deb http://archive.ubuntu.com/ubuntu trusty-proposed main restricted universe multiverse " >> /etc/apt/sources.list && \
    echo "deb http://archive.ubuntu.com/ubuntu trusty-security main restricted universe multiverse " >> /etc/apt/sources.list && \
	apt-get update && \
    apt-get -y remove tzdata && \
	apt-get -y upgrade && \
	apt-get -y install firefox \
		nano curl \
        icedtea-6-plugin \
        icedtea-netx \
        openjdk-6-jre \
        openjdk-6-jre-headless \
        tzdata-java \
        tzdata

# Autostart firefox (might not be the best way to do it, but it does the trick)
RUN bash -c 'echo "exec openbox-session &" >> ~/.xinitrc' && \
	bash -c 'echo "firefox \${HILO_HOST}\${HILO_USER:+/html/java_irc.html?sessionKey=\$(cat /session_key)}" >> ~/.xinitrc' && \
	bash -c 'chmod 755 ~/.xinitrc'

COPY userscript.sh /userscript.sh

WORKDIR /app
ENTRYPOINT ["/userscript.sh"]
