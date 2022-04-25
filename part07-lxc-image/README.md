## build LXC container with Packer

This code create an Ubuntu 20.04 (focal) image and install a curl in it and export it in output-lxc-focal (rootfs.tar.gz and config)

I used the default config to create the image

user and password is : ubuntu
However, ssh key is also added to VM
## Usage
clone project
```shell
git clone https://github.com/ahmadalibagheri/packer-tutorial.git
cd packer-tutorial/part07-lxc-image
```
copy your ssh key in current folder

```shell
cp $HOME/.ssh/id_rsa.pub authorized_keys
```

You can also make sure your configuration is syntactically valid 

```shell
packer validate lxc.json
```

Build the image with the packer build command.

```shell
packer build lxc.json
```
