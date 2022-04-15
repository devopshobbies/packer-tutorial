## Documentation

* Explore the Packer for Packer [CLI](https://www.packer.io/downloads) >= v1.8.0+


# packer-vagrant

Build a basic Ubuntu VM from a vagrant box, upload a file to the defined location and finally, install Redis on the image. Make the desired directory as the machine's storage that's been mapped from host into the VM. You can change the values and boxes in 'variables.yml'. The output box will be named as 'package.box' in the generated directory.

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
