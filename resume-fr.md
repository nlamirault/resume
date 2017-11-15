![](me.jpg) Nicolas Lamirault
===========================================
---
rights: © 2014-2017 Nicolas Lamirault
...

----

Ingénieur développement logiciel, spécialiste Open Source.

----


Expériences
--------------

10/2016-.
:   *DevOps Tools, Orange Applications for Business*
    Ingénieur développement logiciel

    - API Gateway pour l'orchestrateur des Clouds internes (Golang, gRPC, Bazel)
    - Mise en place des traces applicatives des différentes web services (OpenTracing Python et Golang) par Jaeger
    - Diffusion de messages basé sur Nats.io (Golang)
    - Exporteurs Prometheus des différents métriques des services REST (Python, Golang) et gRPC
    - Exporteur Prometheus des métriques de performances vSphere (Golang)
    - Déploiement des services REST et de l'API Gateway sous Kubernetes
    - Supervision de containers (Golang)

07/2014-10/2016
:	*Infrastructure et Outils de Production, Orange Applications for Business*
    Ingénieur développement logiciel

    - Remplacement de l'orchestrateur Cloudstack par un orchestrateur interne (Python)
    - Outils de gestion de machine virtuelles (VMWare / Cloudstack)
    - Interface d'administration du Cloud interne
    - Refonte Packaging, Integration continue et tests (Go / Docker)

07/2012-07/2014
:	*Cloud computing, Multimédia Business Services, Orange*
    Ingénieur devops dans le département Cloud Computing

    - Mise en place de l’intégration continue pour l’IAAS.
    - Refonte de l’architecture logicielle de l’IAAS (Apache Cloudstack, Jersey, Flask, RabbitMQ, Python CLI, NodeJS, StatusDashboard)
    - Packaging Cloudstack pour l’orchestrateur du Cloud de Multimedia Business Services
    - Mise en place d’un environnement de développement et de build basé sur VirtualBox/Vagrant/Ansible

06/2011-07/2012
:   *Développement NFC, Multimédia Business Services, Orange*
    Développeur dans le département NFC

    - Service de contrôle d’accès NFC par mobiles NFC Service Center (IHM
    d’administration, web service REST, ordonnanceur gérant le cycle de vie
    AFSCM, cardlet, application Android).
    - Développement sur TSM SP (Trusted Service Manager Service Provider)
    bancaire (certification PCI/DSS, Mastercard).

09/2001-06/2011
:   *Développeur, Multimédia Business Services, Orange*
    Département projet et équipe offre packagées.

    - Développement d’applications SMS/MMS pour le compte d’Orange, sociétés
    de médias (télévision, radio, internet), grands comptes
    - Développement de Serveurs Vocaux Interactifs en J2EE et VoiceXML.
    - Développement d’applications web (boutique en ligne, intranet, outils
    d’administration).
    - Architecture client / serveurs (RESTful, SOAP, XML-RPC)
    - Mise en place de pratiques agiles au sein de l’équipe : pair programming,
    Test Driven Design.

01/2001-10/2001
:   *Développeur, Axialog*
    Département qualité

    - Equipe qualité société Thales Avionics.
    - Mise en place de batterie de tests unitaire et d’intégration
    - Implémentation d’outils de gestion de projets sous Unix.


Education
-------------

1998-2000
:	*Licence/Maitrise d’informatique*
	[Université Bordeaux I, Talence](http://www.u-bordeaux1.fr)

1996-1998
: 	*DEUG MASS*
	[Université Bordeaux II Victor Ségalen, Bordeaux](http://www.univ-bordeauxsegalen.fr/)

1996
: 	*Baccalauréat Scientifique (mention bien)*
    Lycée Elire Faure, Lormont

Comptétences
---------------

Languages
:   **Utilisation courante(personnelle, professionnelle) : **
    Go, Python, Common Lisp

:   **Utilisation professionnelle : **
    PHP, Java

:   **Connaissance : **
    Erlang, Rust, Ruby, OCaml, Objective-C

Système d'exploitation
:   **Maitrise : **
    Linux (Debian, Arch, Ubuntu), OSX

:   **Connaissance : **
    BSD

Méthodologie
:   **Organisationnel : **
    Scrum, Kanban

:   **Développement : **
    TDD, eXtreme Programming

Outils
:   **Serveurs : **
    Apache, Nginx, Tomcat

:   **Base de données : **
    MySQL, PostgreSQL, noSQL (CouchDB, MongoDB)

:   **Développement : **
    Emacs, Intellij, Eclipse

:   **Build : **
    Bazel, Pip, ...

:   **Systèmes de gestions de versions : **
    Git, Subversion, CVS

Cloud
:   **Virtualisation : **
    VMware Server/ESX, Xen, KVM

:   **Containeur : **
    Docker, Kubernetes, Nomad, CoreOS, Openshift (v3)

:   **Orchestrateur : **
    Cloudstack, Openstack

:   **Outils : **
    Vagrant, Packer, Terraform, Ansible, Puppet, Fabric

Langues
---------

Français
:	Natif

English
:	Technique

Espagnol
:	Notions

Open source
----------------

Cloud
:   **bento : **[Github](https://github.com/nlamirault/bento)
    Définition de box Vagrant utilisant Packer (Arch, Debian, CentOS, FreeBSD,
    OpenBSD, NetBSD)

:   **portefaix : ** [Github](https://github.com/portefaix)
    Des images Docker basées sur Alpine Linux et un POC pour créer son propre Cloud
    (Kubernetes, Openshift, Swarm, ...) basé sur Packer/Terraform.

:   **helmsman : ** [Github](https://github.com/nlamirault/helmsman)
    Text User Interface pour Kubernetes

:   **hyperion-xxx : ** [github](https://github.com/portefaix)
    POC pour déployer Kubernetes, Rancher, Openshift, ... en utilisant Packer et
    Terraform sur les différents Cloud publics

Utilitaires
:   **divona : ** [Github](https://github.com/nlamirault/divona)
    Un outil de configuration de poste Linux ou de machine virtuelle basé sur Ansible.
    Compatible Linux (Archlinux, Debian, CentOS), BSD (FreeBSD, NetBSD, OpenBSD) et OSX.

:   **aneto : ** [Github](https://github.com/nlamirault/aneto) - (Golang) -
    Un outil de sauvegarde utilisant Amazon Glacier

:   **enigma : ** [Github](https://github.com/nlamirault/enigma) - (Golang) -
    Un coffre fort dans le Cloud utilisant Amazon S3 et Amazon KMS

:   **abraracourcix : ** [Github](https://github.com/nlamirault/abraracourcix) - (Golang) -
    Un générateur d'urls raccourcies simple supportant plusieurs backend de stockage
    (BoltDB, LevelDB, Redis, MongoDB, ...)

:   **skybox : ** [Github](https://github.com/nlamirault/skybox) - (Golang) -
    Collecter des metrics depuis les box de FAI (Freebox, Livebox, ...) et
    les exportent pour Prometheus

:   **chione : ** [Github](https://github.com/nlamirault/chione) - (Golang) -
    CLI pour récupérer des informations sur les statison de ski (enneigment, pistes ouvertes, ...)

:   **pilotariak : ** [Github](https://github.com/pilotariak) - (Golang, gRPC) -
    Outillage pour récupérer des informations sur les évènements de pelote basque

Emacs
:   **scame : ** [Github](https://github.com/nlamirault/scame)
    Une configuration clé en main d’Emacs

:   **gotest.el : ** [Github](https://github.com/nlamirault/gotest.el)
    Un mode Emacs pour interagir avec les tests unitaires en Go.

:   **phpunit.el : ** [Github](https://github.com/nlamirault/phpunit.el)
    Un mode Emacs pour interagir avec les tests unitaires PHPUnit.

:   **sift.el, ripgrep.el : ** [Github](https://github.com/nlamirault/sift.el), [Github](https://github.com/nlamirault/ripgrep.el)
    Interaction avec sift ou ripgrep (alternatives à grep)


IOT

:   **framboise : ** [Github](https://github.com/nlamirault/framboise)
    Outils pour Raspberry PI

:   **jarvis : ** [Github](https://github.com/zeiot/jarvis)
    Domotique en open source

:   **zeiot : ** [Github](https://github.com/zeiot)
    Images Docker pour Rasperry PI 2 et 3: Prometheus, Domoticz, CoreDNS, Prometheus exporters (node, pihole, nats, ...), Grafana, Nats, ...

------
> <nicolas.lamirault@gmail.com> <br /> +33 7 84 12 76 65 <br />
> <a href="https://github.com/nlamirault" alt="Github"><i class="fa fa-github"></i></a> •
> <a href="https://twitter.com/nlamirault" alt="Twitter"><i class="fa fa-twitter"></i> </a> •
> <a href="https://plus.google.com/+nicolaslamirault" alt="Google Plus"><i class="fa fa-google-plus"></i> </a>  •
> <a href="https://www.linkedin.com/in/nicolaslamirault" alt="Linkedin"><i class="fa fa-linkedin"></i> </a> •
> <a href="https://www.facebook.com/nicolas.lamirault" alt="Facebook"><i class="fa fa-facebook"></i> </a> <br />
> <a href="http://pgp.mit.edu/pks/lookup?op=get&search=0x5F99269A6FCA437C"> PGP Key </a>
