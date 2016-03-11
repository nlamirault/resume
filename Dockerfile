# Copyright (C) 2014, 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM portefaix/base:edge
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

ENV WKHTMLTOPDF_VERSION 0.12.3

COPY mitch.tishmack@gmail.com-55881c97.rsa.pub /etc/apk/keys/mitch.tishmack@gmail.com-55881c97.rsa.pub
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "https://s3-us-west-2.amazonaws.com/alpine-ghc/7.10" >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add --update \
            xvfb \
            ttf-freefont \
            fontconfig \
            ghc cabal-install linux-headers musl-dev gmp-dev zlib-dev make \
            wkhtmltopdf@testing
RUN mv /usr/bin/wkhtmltopdf /usr/bin/wkhtmltopdf-origin && \
    echo $'#!/usr/bin/env sh\n\
Xvfb :0 -screen 0 1024x768x24 -ac +extension GLX +render -noreset & \n\
DISPLAY=:0.0 wkhtmltopdf-origin $@ \n\
killall Xvfb\
' > /usr/bin/wkhtmltopdf && \
    chmod +x /usr/bin/wkhtmltopdf
RUN cabal update && \
    cabal install pandoc
RUN rm -rf /var/cache/apk/*
RUN cp /root/.cabal/bin/pandoc /usr/bin/pandoc

# FROM ubuntu:15.04
# MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>
# RUN apt-get update
# RUN apt-get install -y \
#     latex-beamer texlive-fonts-recommended pandoc
# RUN apt-get install -y build-essential xorg libssl-dev libxrender-dev wget
# RUN wget http://download.gna.org/wkhtmltopdf/0.12/${WKHTMLTOPDF_VERSION}/wkhtmltox-${WKHTMLTOPDF_VERSION}_linux-generic-amd64.tar.xz \
#     tar xvjf wkhtmltopdf-${WKHTMLTOPDF_VERSION}_linux-generic-amd64.tar.xz && \
#     install wkhtmltopdf-amd64 /usr/bin/wkhtmltopdf

VOLUME ["/data/"]
