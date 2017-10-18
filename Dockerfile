# Copyright (C) 2014, 2015, 2016, 2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

# FROM portefaix/base:3.3
# MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

# ENV WKHTMLTOPDF_VERSION 0.12.3

# RUN apk update && apk upgrade

# RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
# RUN apk add wkhtmltopdf@testing

# FROM ubuntu:15.04
# MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>
# RUN apt-get update
# RUN apt-get install -y \
#     latex-beamer texlive-fonts-recommended pandoc
# RUN apt-get install -y build-essential xorg libssl-dev libxrender-dev wget
# RUN wget http://download.gna.org/wkhtmltopdf/0.12/${WKHTMLTOPDF_VERSION}/wkhtmltox-${WKHTMLTOPDF_VERSION}_linux-generic-amd64.tar.xz \
#     tar xvjf wkhtmltopdf-${WKHTMLTOPDF_VERSION}_linux-generic-amd64.tar.xz && \
#     install wkhtmltopdf-amd64 /usr/bin/wkhtmltopdf

# VOLUME ["/data/"]

FROM arachnysdocker/athenapdf:2.1
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

RUN apt-get update && \
    apt-get install -y latex-beamer texlive-fonts-recommended pandoc
