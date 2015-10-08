# Copyright (C) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

SHELL = /bin/bash

DOCKER=/usr/bin/docker
PANDOC=/usr/bin/pandoc
WKHTML=/usr/bin/wkhtmltopdf

RESUME=resume
INDEX=index
STYLE=style.css
SOURCE=resume

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

all: help

help:
	@echo -e "$(OK_COLOR)==== Resume ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)docker$(NO_COLOR)  : Make the Docker image"
	@echo -e "$(WARN_COLOR)pdf$(NO_COLOR)     : Make PDF resume"
	@echo -e "$(WARN_COLOR)html$(NO_COLOR)    : Make HTML resume"
	@echo -e "$(WARN_COLOR)epub$(NO_COLOR)    : Make EPUB resume"
	@echo -e "$(WARN_COLOR)clean$(NO_COLOR)   : Cleanup"

html:
	$(DOCKER) run --rm=true \
		-v `pwd`:/data/ \
		-it --name resume nlamirault/resume \
		$(PANDOC) --standalone --from markdown --to html -c $(STYLE) -o /data/$(INDEX).html /data/$(SOURCE).md

.PHONY: build
pdf: html
	$(DOCKER) run --rm=true \
		-v `pwd`:/data/ \
		-it --name resume nlamirault/resume \
		$(WKHTML) -L 20mm -R 20mm /data/$(INDEX).html /data/$(RESUME).pdf

.PHONY: epub
epub:
	$(DOCKER) run --rm=true \
		-v `pwd`:/data/ \
		-w /data/ \
		-it --name resume nlamirault/resume \
		$(PANDOC) /data/$(SOURCE).md -o /data/$(SOURCE).epub

clean:
	rm -rf *.pdf *.html *.epub
