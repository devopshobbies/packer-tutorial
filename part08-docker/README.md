## Notes

# The packer block contains Packer settings, including in this case the required plugin for this image.

The source block defines the builder plugin i.e. "ubuntu:zenial" which will be invoked by the build block.

You will notice that this block includes two labels, the builder type docker and builder name ubuntu.

Finally the build block defines the tasks that eventually produces an image.

## The build block
sources -references the source.docker.ubuntu source defined earlier within the sources block. During build time, Packer will pull the ubuntu:xenial image from the docker registry.

provisioner - a provisioner is used to automate the modification of the image . 

Provisioners are run against an instance of the image. In this case, a Docker container (an instance) will be started and the provisioner will install the redis-server and create a file called example.txt.


post-processors - post-processors only run after the instance has been saved as an image.

In this example, the post-processors will be run sequentially to tag the image and push it to a repository.

Post-processors are varied in their function and can for example be used to compress an artefact or push it to the cloud.
