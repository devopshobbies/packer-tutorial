# Packer-tutorial

<p align="center" style="text-align:center;">
  <a href="https://www.packer.io">
    <img alt="HashiCorp Packer logo" src="image/logo-packer-padded.svg" width="500" />
  </a>
</p>

## Documentation

* Explore the Packer for Packer [CLI](https://www.packer.io/downloads) >= v1.8.0+


Add your AWS credentials as two environment variables, AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, replacing AAAAAA with each respective values.

```shell
$ export AWS_ACCESS_KEY_ID=AAAAAA
$ export AWS_SECRET_ACCESS_KEY=AAAAA
```

# packer-aws-eks-image

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

## Published articles:

 - [Packer Tutorial - Part 1 - Docker Introduction]()

 - [Packer Tutorial - Part 2 - GitHub Introduction]()

 - [Packer Tutorial - Part 3 - Kubernetes Introduction]()


## Contributions:

All contributions are welcomed. Help me to enrich this repository.

If you find any **bugs** in the examples, please file an issue.

### TODO:

 - [ ] Adding Packer Azure DevOps
 - [ ] Adding Packer Vcenter
 - [ ] Adding Packer GitLab
 - [ ] Adding Packer Consul
 - [ ] Adding Packer Vault

