# Copyright (C) 2015, 2016, 2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
PDF_IMAGE = arachnysdocker/athenapdf:2.7.1

STYLE=style.css
SOURCE=resume

DATE = `date +'%Y-%m-%d'`

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m
MAKE_COLOR=\033[33;01m%-10s\033[0m

.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo -e "$(OK_COLOR)=========== Resume =============$(NO_COLOR)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(MAKE_COLOR) : %s\n", $$1, $$2}'

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
html: ## Make the HTML version (lang=xx)
	@echo -e "$(OK_COLOR)[$(APP)] Build HTML resume : ${lang}$(NO_COLOR)"
	@$(DOCKER) run --rm=true \
		-v `pwd`:/data/ \
		-it --name resume-html $(HTML_IMAGE) \
		pandoc --standalone --from markdown --to html -c $(STYLE) -o /data/resume-${lang}.html /data/$(SOURCE)-${lang}.md

.PHONY: pdf
pdf: html ## Make the PDF version (lang=xx)
	@echo -e "$(OK_COLOR)[$(APP)] Build PDF resume : ${lang}$(NO_COLOR)"
	@$(DOCKER) run --rm \
		-v `pwd`:/converted/ \
		--name resume-pdf $(PDF_IMAGE) \
		athenapdf resume-${lang}.html resume-${lang}.pdf
.PHONY: resume
resume: ## Make resume (lang=xx)
	@make html pdf lang=${lang} && \
		mv resume-${lang}.html resume-${lang}-$(DATE).html && \
		mv resume-${lang}.pdf resume-${lang}-$(DATE).pdf

.PHONY: all
all: clean ## Make resumes
	@make resume lang=fr
	@make resume lang=en
