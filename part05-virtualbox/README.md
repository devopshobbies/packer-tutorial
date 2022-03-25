## Documentation

* Explore the Packer for Packer [CLI](https://www.packer.io/downloads) >= v1.8.0+


# packer-vsphere-iso

Build a basic Ubuntu VM from an iso image with packer hashicorp and installs Nginx webserver on it.

## Usage

Install project dependencies

```shell
packer init .
```

The packer fmt command updates templates in the current directory for readability and consistency.

```shell
packer fmt .
```

You can also make sure your configuration is syntactically valid and internally consistent by using the packer validate command.

```shell
packer validate .
```

Build the image with the packer build command. 

```shell
packer build .
```
