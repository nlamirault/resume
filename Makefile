# Copyright (C) 2014-2020 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

SHELL = /bin/bash

DOCKER = docker

APP = resume
NAMESPACE = nlamirault
IMAGE = resume
VERSION = 1.0

HTML_IMAGE = nlamirault/resume:$(VERSION)
EPUB_IMAGE = nlamirault/resume:$(VERSION)
PDF_IMAGE = arachnysdocker/athenapdf:2.16.0

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
	@echo -e "$(OK_COLOR)=========== Resume =============$(NO_COLOR)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(MAKE_COLOR) : %s\n", $$1, $$2}'

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
	@find . -name "*.epub" | xargs rm -fr {}
	@find . -name "resume-*.html" | xargs rm -fr {}

.PHONY: docker
docker: ## Build Docker image
	@echo -e "$(OK_COLOR)[$(APP)] Build the Docker image$(NO_COLOR)"
	@$(DOCKER) build -t $(NAMESPACE)/$(IMAGE):${VERSION} .

.PHONY: publish
publish: ## Publish the Docker image
	@echo -e "$(OK_COLOR)[$(APP)] Publish the Docker image$(NO_COLOR)"
	@$(DOCKER) push $(NAMESPACE)/$(IMAGE):$(VERSION)

.PHONY: html
html: guard-LANG ## Make the HTML version (lang=xx)
	@echo -e "$(OK_COLOR)[$(APP)] Build HTML resume : $(LANG)$(NO_COLOR)"
	@$(DOCKER) run --rm=true \
		-v `pwd`:/source/ \
		-it --name resume-html jagregory/pandoc \
		--standalone --from markdown --to html -c $(STYLE) -o /source/$(SOURCE)-$(LANG).html /source/$(SOURCE)-$(LANG).md

.PHONY: epub
epub: guard-LANG ## Make the ePUB version (lang=xx)
	@echo -e "$(OK_COLOR)[$(APP)] Build ePUB resume : $(LANG)$(NO_COLOR)"
	@$(DOCKER) run --rm=true \
		-v `pwd`:/source/ \
		-it --name resume-epub jagregory/pandoc \
		-f markdown -t epub --epub-cover-image generate.png -o /source/$(SOURCE)-$(LANG).epub /source/$(SOURCE)-$(LANG).md

.PHONY: docx
docx: guard-LANG ## Make the Docx version (lang=xx)
	@echo -e "$(OK_COLOR)[$(APP)] Build Docx resume : $(LANG)$(NO_COLOR)"
	@$(DOCKER) run --rm=true \
		-v `pwd`:/source/ \
		-it --name resume-docx jagregory/pandoc \
		-f markdown -t docx --reference-docx="reference.docx" -o /source/$(SOURCE)-$(LANG).docx /source/$(SOURCE)-$(LANG).md

.PHONY: pdf
pdf: guard-LANG html ## Make the PDF version (lang=xx)
	@echo -e "$(OK_COLOR)[$(APP)] Build PDF resume : $(LANG)$(NO_COLOR)"
	@$(DOCKER) run --rm \
		-v `pwd`:/converted/ \
		--name resume-pdf $(PDF_IMAGE) \
		athenapdf resume-$(LANG).html resume-$(LANG).pdf

.PHONY: resume
resume: guard-LANG ## Make resume (lang=xx)
	@make html pdf lang=$(LANG) && \
		mv resume-$(LANG).html resume-$(LANG)-$(DATE).html && \
		mv resume-$(LANG).pdf resume-$(LANG)-$(DATE).pdf

.PHONY: all
all: clean ## Make resumes
	@make resume lang=fr
	@make resume lang=en
