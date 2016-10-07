FROM node:4-slim
MAINTAINER Eohyung Lee <liquidnuker@gmail.com>

RUN curl -L https://api.github.com/repos/hakimel/reveal.js/tarball > \
    /revealjs.tar.gz && \
    tar zxf /revealjs.tar.gz && \
    mv /hakimel-reveal.js-* /revealjs && \
    mkdir -p /revealjs/md
WORKDIR /revealjs

RUN npm install -g grunt-cli && npm install

COPY run.sh /run.sh
COPY index.html /revealjs/
COPY title.js /revealjs/plugin/
ONBUILD COPY slides.md /revealjs/md/

EXPOSE 8000
VOLUME ["/revealjs/md/"]
CMD ["/run.sh"]
