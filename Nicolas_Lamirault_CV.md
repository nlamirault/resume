# Nicolas Lamirault's CV

- Email: [nicolas.lamirault@gmail.com](mailto:nicolas.lamirault@gmail.com)
- Location: Bordeaux, France
- Website: [nicolas.lamirault.xyz](https://nicolas.lamirault.xyz/)
- GitHub: [nlamirault](https://github.com/nlamirault)
- LinkedIn: [nicolaslamirault](https://linkedin.com/in/nicolaslamirault)


# Summary
Staff Site Reliability Engineer with 20+ years building and operating cloud-native platforms. Specialized in observability (OpenTelemetry, Prometheus, Grafana stack), Kubernetes, and Infrastructure as Code across AWS and GCP. Active open source maintainer.

# Education
## **Université de Bordeaux I**, Computer Science

**Master of Computer**

Bordeaux, France

Jan 2000



## **Université de Bordeaux II**, Computer Science

**DEUG MASS**

Bordeaux, France

Jan 1998



# Experience
## **[Swan](https://swan.io)**, Staff Site Reliability Engineer

Bordeaux, France

Feb 2024 – present



2 years 8 months

- Migration of the observability platform to OpenTelemetry, including the definition and implementation of semantic conventions.

- Mentor and coach other engineers on observability best practices.

- Manage the Observability plateform with Prometheus, Grafana, Loki, Tempo, OpenTelemetry Collector and Alloy.

- Participate to On-Call rotation



## **[Swan](https://swan.io)**, Site Reliability Engineer

Bordeaux, France

Feb 2022 – Feb 2024



2 years 1 month

- Design and operate our Cloud Platform, running on AWS using Terraform and Terragrunt

- Manage our Gitops flow using Argo projects like CD, Events and Workflows

- Manage the Observability plateform with Prometheus, Grafana, Loki, and OpenTelemetry

- Maintain third-party softwares (Postgresql, Hashicorp Vault, ...)

- Participate to On-Call rotation



## **Skale-5**, Cloud Consultant / SRE

Bordeaux, France

Mar 2019 – Feb 2022



3 years

- Harmonize and unify existing CI/CD processes

- Monitoring stack based on Kubernetes (GKE, EKS, AKS, ACK) using Prometheus Operator, Prometheus, Thanos, Exporters and Grafana.

- Logging tools: ELK/EFK, Loki, Stackdriver

- Bespoke configuration of Kustomize manifests used by Skale-5

- Manage GCP and AWS platforms using Terraform, Ansible, Packer, ...

- Project templates with Cookiecutter

- Infrastructure tests using Inspec

- DevOps practices: SRE, on-call, incident-management, hands-on documentation, and many more



## **DevOps Department, Orange Application for Business**, Senior Software Engineer

Bordeaux, France

Oct 2016 – Mar 2019



2 years 6 months

- Collecting, centralizing, and visualizing client infrastructures from multiple Cloud Providers (Openstack, AWS, Azure) (Python/Golang/Kubernetes)

- Tools for deploying Cloud Native Applications (Kubernetes)

- API Gateway for internale services (Golang, gRPC)

- Continuous Integration and Deployment using GitlabCI and Kubernetes

- Setting metrics in Cloud services (Opentracing Python and Golang, Jaeger)

- Messaging between services using Nats.io (Golang)

- Prometheus exporters for REST and gRPC services

- Prometheus exporter for vSphere (Golang)

- Deployment on Kubernetes

- Containers monitoring (Golang)



## **Infrastructure and Production Tools, Orange Application for Business**, Senior Software Engineer

Bordeaux, France

July 2014 – Oct 2016



2 years 4 months

- Virtual machine management tools (VMWare / CloudStack

- Administration Interface for the internal Cloud

- Redesigned Packaging, Integration and continuous tests (Golang / Docker)



## **Cloud computing Department, Multimedia Business Services**, Software Engineer

Bordeaux, France

July 2012 – July 2014



2 years 1 month

- Implementation of continuous integration for the IAAS.

- Redesign of the software architecture of the IAAS (Apache CloudStack, Jersey, Flask, RabbitMQ, Python CLI, NodeJS, StatusDashboard)

- Packaging for the orchestrator of the CloudStack cloud Multimedia Business Services

- Setting up a development environment and build based on VirtualBox / Vagrant / Ansible



## **NFC Department, Multimedia Business Services**, Software Developer

Bordeaux, France

June 2011 – July 2012



1 year 2 months

- NFC Access Control Service for Mobile NFC Service Center (UI administration, lifecycle AFSCM, cardlet, Android application)

- Development of SP TSM (Trusted Service Manager Service Provider), bank certification, PCI / DSS, Mastercard



## **Multimedia Business Services**, Software Developer

Bordeaux, France

Oct 2001 – June 2011



9 years 9 months

- Application Development SMS / MMS on behalf of Orange companies media (television, radio, internet), large accounts

- Interactive Voice Servers Development in J2EE and VoiceXML.

- Development of web applications (web shop, intranet, tools of administration).

- Architecture client / servers (RESTful, SOAP, XML-RPC)

- Implementation of agile practices within the team (pair programming, Test Driven Design)



## **Axialog**, Software Developer

Bordeaux, France

Jan 2001 – Oct 2001



10 months

- Corporate Quality Team Thales Avionics.

- Implementation of unit tests and integration battery

- Implementation of project management tools on Unix.



# Projects
## **[portefaix](https://github.com/portefaix)**

Cloud Native deployment platform

- [Infrastructure As Code](https://github.com/portefaix/portefaix-policies) using Terraform (AWS, GCP, AZure, Alicloud, Scaleway, ...)

- [Helm charts](https://github.com/portefaix/portefaix-hub) for the Portefaix project deployed on [Artifactory Hub](https://artifacthub.io/packages/search?page=1&repo=portefaix-hub)

- [Policies](https://github.com/portefaix/portefaix-policies) using [Cel](https://kubernetes.io/docs/reference/access-authn-authz/validating-admission-policy/), [Open Policy Agent](https://www.openpolicyagent.org/), [Kyverno](https://kyverno.io/), [Kubewarden](https://www.kubewarden.io/) rules

- Build cloud platform using [Kubernetes Resources Model](https://github.com/portefaix/portefaix-krm)



## **[monitoring-mixins](https://github.com/nlamirault/monitoring-mixins)**

Collection of reusable and configurable Prometheus alerts, and Grafana dashboards



## **[Terraform modules](https://registry.terraform.io/namespaces/nlamirault)**

Terraform modules on several Cloud providers



## **[OpenTelemetry lab](https://github.com/nlamirault/opentelemetry-lab)**

A laboratory for OpenTelemetry cloud native applications



## **[Divona](https://github.com/nlamirault/divona)**

Automated configuration of a personal environment using [Ansible](https://www.ansible.com/) collections for [Linux](https://github.com/divona-roles/ansible-collection-linux), [OSX](https://github.com/divona-roles/ansible-collection-mac) and [Windows](https://github.com/divona-roles/ansible-collection-windows)



# Skills
**Programming:** Go, Python, Rust, Jsonnet, Emacs Lisp

**Cloud:** AWS, GCP, Azure, Scaleway, Alibaba Cloud

**Kubernetes:** EKS, GKE, AKS, KEDA, Karpenter, Kustomize, Helm

**GitOps & CI/CD:** ArgoCD, FluxCD, Argo Workflows, GitLab CI, GitHub Actions

**Observability:** OpenTelemetry, Prometheus, Grafana, Loki, Tempo, Thanos, Alloy

**Infrastructure as Code:** Terraform, Terragrunt, Packer, Ansible, Vault, Nomad, Consul

**Security & Supply Chain:** Falco, Trivy, OPA, Kyverno, Kubewarden

**Operating Systems:** Daily: Linux (Arch, Debian, Ubuntu), macOS
