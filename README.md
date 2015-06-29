# Shadowsocks Server [![Docker Pulls](https://img.shields.io/docker/pulls/dockerzone/shadowsocks-server.svg?style=flat)](https://registry.hub.docker.com/u/dockerzone/shadowsocks-server/) [![Docker Stars](https://img.shields.io/docker/stars/dockerzone/shadowsocks-server.svg?style=flat)](https://registry.hub.docker.com/u/dockerzone/shadowsocks-server/)
Dockerized shadowsocks server


# Installation

Pull the image from the docker index. This is the recommended method of installation as it is easier to update image. These builds are performed by the **Docker Trusted Build** service.

```bash
docker pull dockerzone/shadowsocks-server:2.6.10
```

You can also pull the `latest` tag which is built from the repository *HEAD*

```bash
docker pull dockerzone/shadowsocks-server:latest
```

Alternately you can build the image locally.

```bash
git clone https://github.com/dockerzone/shadowsocks-server.git
cd shadowsocks-server
docker build --tag="$USER/shadowsocks-server" .
```


# Quick Start

The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/).

```bash
wget https://raw.githubusercontent.com/dockerzone/shadowsocks-server/master/docker-compose.yml
docker-compose up
```

Alternately, you can manually launch the `shadowsocks` container.

```bash
docker run --name='shadowsocks' -d \
  --publish=1443:1443 \
  --env='SS_SERVER_PORT=1443' \
dockerzone/shadowsocks-server:2.6.10
```


## Available Configuration Parameters

*Please refer the docker run command options for the `--env-file` flag where you can specify all required environment variables in a single file. This will save you from writing a potentially long docker run command. Alternately you can use docker compose.*

Below is the complete list of available options that can be used to customize your shadowsocks installation.

- **SS_SERVER_ADDRESS**: Your hostname or server IP (IPv4/IPv6). Defaults to `0.0.0.0`
- **SS_SERVER_PORT**: Server port number. Defaults to `1443`.
- **SS_LOCAL_ADDRESS**: The address your local listens. Defaults to `127.0.0.1`.
- **SS_LOCAL_PORT**: Local port number. Defaults to `1080`.
- **SS_PASSWORD**: A password used to encrypt transfer. Defaults to `sspass`.
- **SS_TIMEOUT**: Connections timeout in seconds. Defaults to `300`.
- **SS_METHOD**: The encryption method, "bf-cfb", "aes-256-cfb", etc. Defaults to `aes-256-cfb`.
- **SS_FAST_OPEN**: Use [TCP_FASTOPEN](https://github.com/shadowsocks/shadowsocks/wiki/TCP-Fast-Open). Defaults to `false`.

# Upgrading

To upgrade to newer shadowsocks releases, simply follow this 3 step upgrade procedure.

- **Step 1**: Update the docker image.

```bash
docker pull dockerzone/shadowsocks-server:2.6.10
```

- **Step 2**: Stop and remove the currently running image

```bash
docker stop shadowsocks
docker rm shadowsocks
```

- **Step 3**: Start the image

```bash
docker run --name=shadowsocks -d [OPTIONS] dockerzone/shadowsocks-server:2.6.10
```


## Shell Access

For debugging and maintenance purposes you may want access the containers shell. If you are using docker version `1.3.0` or higher you can access a running containers shell using `docker exec` command.

```bash
docker exec -it shadowsocks bash
```

If you are using an older version of docker, you can use the [nsenter](http://man7.org/linux/man-pages/man1/nsenter.1.html) linux tool (part of the util-linux package) to access the container shell.

Some linux distros (e.g. ubuntu) use older versions of the util-linux which do not include the `nsenter` tool. To get around this @jpetazzo has created a nice docker image that allows you to install the `nsenter` utility and a helper script named `docker-enter` on these distros.

To install `nsenter` execute the following command on your host,

```bash
docker run --rm --volume=/usr/local/bin:/target jpetazzo/nsenter
```

Now you can access the container shell using the command

```bash
sudo docker-enter shadowsocks
```

For more information refer https://github.com/jpetazzo/nsenter

# References
  * https://github.com/shadowsocks/shadowsocks
  * https://github.com/shadowsocks/shadowsocks/wiki/Encryption
  * https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File
  * https://github.com/shadowsocks/shadowsocks/wiki/TCP-Fast-Open
  * https://github.com/jpetazzo/nsenter
  * https://jpetazzo.github.io/2014/03/23/lxc-attach-nsinit-nsenter-docker-0-9/