# Copyright (C) 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
VERSION = "1.0"

IMAGE_NAME="nlamirault/nlamirault"
IMAGE_VERSION="1.0"

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

all: help

help:
	@echo -e "$(OK_COLOR)==== $(APP) [$(VERSION)] ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)docker$(NO_COLOR)         :  Build Docker image"
	@echo -e "$(WARN_COLOR)cv lang=xx$(NO_COLOR)     :  Build resume"
	@echo -e "$(WARN_COLOR)deploy lang=xx$(NO_COLOR) :  Deploy resume to the cloud"

clean:
	@echo -e "$(OK_COLOR)[$(APP)] Cleanup$(NO_COLOR)"
	find . -name "index.html" | xargs rm -fr {}
	find . -name "resume.pdf" | xargs rm -fr {}
	find . -name "resume.epub" | xargs rm -fr {}

.PHONY: docker
docker:
	@echo -e "$(OK_COLOR)[$(APP)] Build Docker image$(NO_COLOR)"
	$(DOCKER) build -t $(IMAGE_NAME):$(IMAGE_VERSION) .

.PHONY: cv
cv:
	@echo -e "$(OK_COLOR)[$(APP)] Build resume$(NO_COLOR)"
	cd ${lang} && make clean d-html d-pdf d-epub

.PHONY: deploy
deploy:
	@echo -e "$(OK_COLOR)[$(APP)] Deploy resume$(NO_COLOR)"
