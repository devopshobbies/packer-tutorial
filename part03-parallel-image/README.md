## Documentation

* Explore the Packer for Packer [CLI](https://www.packer.io/downloads) >= v1.8.0+


Add your AWS credentials as two environment variables, AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, replacing AAAAAA with each respective values.

```shell
$ export AWS_ACCESS_KEY_ID=AAAAAA
$ export AWS_SECRET_ACCESS_KEY=AAAAA
```

# packer-paraller-aws-ubuntu-image-vs-docker-image

Build basic eks image with packer hashicorp

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
