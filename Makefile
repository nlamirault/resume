# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

SHELL = /bin/bash

DOCKER = docker

BANNER = R E S U M E

APP = resume
NAMESPACE = nlamirault
IMAGE = resume
VERSION = 1.0

HTML_IMAGE = nlamirault/resume:$(VERSION)
EPUB_IMAGE = nlamirault/resume:$(VERSION)
PDF_IMAGE = arachnysdocker/athenapdf:2.16.0

PANDOC_IMAGE = oehrlis/pandoc:2.1.1

STYLE=style.css
SOURCE=resume

DATE = `date +'%Y-%m-%d'`

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m
INFO_COLOR=\033[34;01m
MAKE_COLOR=\033[33;01m%-10s\033[0m

.DEFAULT_GOAL := help

OK=[✅]
KO=[❌]
WARN=[⚠️]

.PHONY: help
help:
	@echo -e "$(OK_COLOR)                      $(BANNER)$(NO_COLOR)"
	@echo "------------------------------------------------------------------"
	@echo ""
	@echo -e "${ERROR_COLOR}Usage${NO_COLOR}: make ${INFO_COLOR}<target>${NO_COLOR}"
	@awk 'BEGIN {FS = ":.*##"; } /^[a-zA-Z0-9_-]+:.*?##/ { printf "  ${INFO_COLOR}%-30s${NO_COLOR} %s\n", $$1, $$2 } /^##@/ { printf "\n${WHITE_COLOR}%s${NO_COLOR}\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

guard-%:
	@if [ "${${*}}" = "" ]; then \
		echo -e "$(ERROR_COLOR)Environment variable $* not set$(NO_COLOR)"; \
		exit 1; \
	fi

check-%:
	@if $$(hash $* 2> /dev/null); then \
		echo -e "$(OK_COLOR)$(OK)$(NO_COLOR) $*"; \
	else \
		echo -e "$(ERROR_COLOR)$(KO)$(NO_COLOR) $*"; \
	fi

.PHONY: check
check: check-docker ## Check requirements

clean: ## Cleanup repository
	@echo -e "$(OK_COLOR)[$(APP)] Cleanup$(NO_COLOR)"
	@find . -name "index.html" | xargs rm -fr {}
	@find . -name "*.pdf" | xargs rm -fr {}
	@find . -name "resume-*.html" | xargs rm -fr {}

.PHONY: html
html: guard-COUNTRY ## Make the HTML version (COUNTRY=xx)
	@echo -e "$(OK_COLOR)[$(APP)] Build HTML resume: $(COUNTRY)$(NO_COLOR)"
	@$(DOCKER) run --rm=true \
		-v `pwd`:/source/ \
		-it --name resume-html $(PANDOC_IMAGE) \
		--standalone --from markdown --to html -c $(STYLE) -o /source/$(SOURCE)-$(COUNTRY).html /source/$(SOURCE)-$(COUNTRY).md

.PHONY: gotenberg
gotenberg: ## Run Gotenberg using Docker
	@docker run --rm -p 3000:3000 gotenberg/gotenberg:7.8.0

.PHONY: pdf
pdf: guard-COUNTRY html ## Make the PDF version (COUNTRY=xx)
	@echo -e "$(OK_COLOR)[$(APP)] Build PDF resume: $(COUNTRY)$(NO_COLOR)"
	@cp resume-$(COUNTRY).html index.html \
		&& curl -s \
			--request POST \
			--url http://localhost:3000/forms/chromium/convert/html \
			--header 'Content-Type: multipart/form-data' \
			--form files=@index.html \
			--form files=@style.css \
			--form files=@me.jpg \
			-o resume-$(COUNTRY).pdf \
		&& rm index.html
.PHONY: resume
resume: guard-COUNTRY ## Make resume (COUNTRY=xx)
	@make html pdf COUNTRY=$(COUNTRY) && \
		mv resume-$(COUNTRY).html resume-$(COUNTRY)-$(DATE).html && \
		mv resume-$(COUNTRY).pdf resume-$(COUNTRY)-$(DATE).pdf

.PHONY: all
all: clean ## Make resumes
	@make resume COUNTRY=fr
	@make resume COUNTRY=en
