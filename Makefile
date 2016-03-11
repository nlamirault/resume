# Copyright (C) 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

APP = "resume"
NAMESPACE="nlamirault"
IMAGE="resume"
VERSION = "2.0"

DATE = `date +'%Y-%m-%d'`


NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

all: help

help:
	@echo -e "$(OK_COLOR)==== $(APP) $(DATE) [$(VERSION)] ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)docker$(NO_COLOR)         :  Build Docker image"
	@echo -e "$(WARN_COLOR)cv lang=xx$(NO_COLOR)     :  Build resume"
	@echo -e "$(WARN_COLOR)deploy lang=xx$(NO_COLOR) :  Deploy resume to the cloud"

clean:
	@echo -e "$(OK_COLOR)[$(APP)] Cleanup$(NO_COLOR)"
	find . -name "index.html" | xargs rm -fr {}
	find . -name "*.pdf" | xargs rm -fr {}
	find . -name "*.epub" | xargs rm -fr {}

.PHONY: docker
docker:
	@echo -e "$(OK_COLOR)[$(APP)] Build Docker image $(IMAGE):${VERSION}$(NO_COLOR)"
	@$(DOCKER) build -t $(NAMESPACE)/$(IMAGE):${VERSION} .

.PHONY: debug
debug:
	@echo -e "$(OK_COLOR)[$(APP)] Run Docker image $(IMAGE):${VERSION}$(NO_COLOR)"
	@$(DOCKER) run -it $(NAMESPACE)/$(IMAGE):${VERSION} /bin/bash

.PHONY: cv
cv:
	@echo -e "$(OK_COLOR)[$(APP)] Build resume$(NO_COLOR)"
	cd ${lang} && make clean d-html d-pdf d-epub && \
			cp resume.pdf ../resume-${lang}-$(DATE).pdf && \
			cp resume.epub ../resume-${lang}-$(DATE).epub

.PHONY: deploy
deploy:
	@echo -e "$(OK_COLOR)[$(APP)] Deploy resume$(NO_COLOR)"
