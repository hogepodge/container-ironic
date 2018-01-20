Container Ironic
================
This project is a container deployment of a full-stack Ironic for
managing a home bare-metal lab. What do I mean by "full-stack"? In
contrast to a project like
`Bifrost <http://git.openstack.org/cgit/openstack/bifrost/>`, this
OpenStack Ironic deployment is:

- Container-based.
- Uses all of the core OpenStack projects, with Ironic as a Nova driver.

As of January 1, 2018, this project can successfully deploy Ironic and
manage a home lab. However, it is still a work in progress with many
features planned for the roadmap. Features include:

- Better documentation, this `README.rst` file being the first step in
  that direction.
- Stronger automation. I'm moving away from the script-based deployment
  and moving to a Makefile. Work in progress on that, and as the
  Makefile becomes more sophisticated the documentation will replace the
  implicit bash script ordering.
- Fewer containers. Right now I build a new container for every service.
  My intention is to reduce the number of container builds in favor of
  creating state through config drives.

This is very much my own project for maintaining a home lab, and if you
want to use the project you will likely need to modify it. The goal is
to have a system that lets me automate testing and demonstration of both
OpenStack and Kubernetes environments. If you see videos that I produce
in 2018 and forward, chances are this is the seed that I'm starting from.

Many thanks to Julia Kreuger (TheJulia) for providing the foundations of
this work with her excellent standalone Ironic project: Bifrost. I've
shamelessly stolen many of her ideas and implented them in containers
here.

Getting Started
---------------

Begin by configuring your Docker to use your own Docker Hub for image
storage. Export the name of you Docker Hub namespace into the
`DOCKERHUB_NAMESPACE` evnironment variable. 

You can the then build the Loci images by running `make loci`. This will
build the base loci images and push them to your Docker Hub account.

Follow up with building the application images by running `make all`.
This will do local builds of all of the application images.

Configure your deployment by editing the `config` file with your
environment specific values.

Deploy by running the shell scripts in numerical order.

Have a good time with OpenStack!

Step-by-step `make` and `docker-compose` commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Load the necessary kernel modules for Neutron and Cinder
    * `make kernel-modules`
* Set up your swift storage endpoint
    * `make swift-storage`
* Build the Loci images and push them to Docker Hub
    * `make loci`
* Start the services with `docker-compose`
    * `docker-compose up`
