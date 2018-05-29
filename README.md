# Chef Jumpstart

## Overview

This is the labs for the Chef Jumpstart workshop at Chef Conf 2018 in Chicago

There are three tagged commits on the repo
* Initial - The initial state of the labs as provided on the workstation
* Complete - The final state of the labs as you should have achieved after the sessions
* Bonus - A bonus section, this adding tests to the loadbalancer coookbook, including the required fixture cookbook

You can checkout the different versions with the git cli as follows: 

* First ensure you have the tags locally 
  * `git fetch --all --tags --prune`
* Then checkout the particular tag
  * `git checkout tags/complete -b complete`

## The Labs


### Lab 1

This is focused on basic introduction to chef resources, running a recipe that is created from scratch and run directly with chef-client on the workstation.  See the slides for details.

### Lab 2

Lab 2 was the first introduction to Test Driven Developement and complete cookbooks.

The recipe is initially empty, and tests are in place to define the expectations of a basic webserver listening on port 80 and including the content `Hello World` 

The students needed to create a basic recipe of three resources, [package](https://docs.chef.io/resource_package.html), [file](https://docs.chef.io/resource_file.html) , and [service](https://docs.chef.io/resource_service.html)

### Lab 3

In Lab 3 the requirements changed, the IP address of the server is now required as part of the webpage.

The students initially created this using Interpolation into the [content](https://docs.chef.io/resource_file.html#properties) property of the, [file](https://docs.chef.io/resource_file.html) resource, the final state shown, however, is using a [template](https://docs.chef.io/resource_template.html) resource. 

### Lab 4

Lab 4 is extending to work with a cluster of node.
A chef-repo is provided (In the workshop preconfigured to a chef server)

A version of the previous webserver cookbook is provided in the cookbooks directory, ready to be uploaded to the chef server.

The students upload it with [Berkshelf](https://docs.chef.io/berkshelf.html) and create a [role](https://docs.chef.io/roles.html) with in on the runlist.  This role is uploaded to two nodes, which then run `chef-client` via `knife ssh`

The students then create a new cookbook called `loadbalancer` to wrap the [haproxy cookbook](https://github.com/sous-chefs/haproxy/) using the custom resources provided.  Again this is uploaded with Berkshelf, this time better demonstrating the dependency resolver, and the node managed with a role.
