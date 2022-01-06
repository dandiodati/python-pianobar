FROM python:3
MAINTAINER Dan Diodati

RUN apt-get update && apt-get install -y \
        libssl-dev \
        libusb-1.0-0 \
        python-dev \
	vim \
        swig \
        curl \
        unzip \
	pianobar \
	bluez-tools \
# not sure if I need this	bluetooth \
        && curl -L -o /tmp/master.zip https://github.com/dandiodati/python-pianobar/archive/master.zip \
        && cd /tmp \
        && unzip master.zip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip --no-cache-dir install --upgrade pip
RUN pip --no-cache-dir install flask M2Crypto waitress
#RUN pip install /tmp/python-firetv-master[firetv-server]
COPY startPianobar.sh /usr/local/bin
RUN mkdir -p /usr/local/pianobar/log

CMD ["sh", "/usr/local/bin/startPianobar.sh"]

# docker build -t docker-firetv .
# docker run -it --rm --name docker-firetv -p 5556:5556 docker-firetv
