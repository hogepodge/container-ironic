Container Ironic
================
This project is a container deployment of a full-stack Ironic for
managing a home bare-metal lab. What do I mean by "full-stack?" In
contrast to a project like
`Bifrost <http://git.openstack.org/cgit/openstack/bifrost/>`, this
OpenStack Ironic deployment is:

- Container-based.
- Uses all of the core OpenStack projects, with Ironic as a Nova driver.

As of January 29, 2018, this project can successfully deploy Ironic and
manage a home lab. However, it is still a work in progress with many
features planned for the roadmap. Features include:

- Better documentation, this `README.rst` file being the first step in
  that direction.

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

Follow up with building the application images by running
`make service-containers`. This will do local builds of all of the
application images.

Configure your deployment by editing the `config` file with your
environment specific values.

Load necessary kernel modules by running `make kernel-modules`.

Bring the whole thing up with `docker-compose up`.

If you need to restart the services, you must call `docker-compose down`
to clear out existing containers, or you will run into network problems
with the neutron-dhcp-agent.

Have a good time with OpenStack!

Step-by-step `make` and `docker-compose` commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Load the necessary kernel modules for Neutron and Cinder
    * `make kernel-modules`
* Set up your swift storage endpoint
    * `make swift-storage`
* Build the Loci images and push them to Docker Hub
    * `make loci`
* Build the service containers (optional)
    * `make service-containers`
* Start the services with `docker-compose`
    * `docker-compose up`
* If you need to restart the services (with your database and images
  intact), you must run 
    * `docker-compose down`
* If you want to restart the services with an empty database
    * `docker-compose down -v`
