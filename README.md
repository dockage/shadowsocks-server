# Shadowsocks Server [![Docker Pulls](https://img.shields.io/docker/pulls/dockage/shadowsocks-server.svg?style=flat)](https://hub.docker.com/r/dockage/shadowsocks-server/) [![Docker Stars](https://img.shields.io/docker/stars/dockage/shadowsocks-server.svg?style=flat)](https://hub.docker.com/r/dockage/shadowsocks-server/) [![MicroBadger](https://images.microbadger.com/badges/image/dockage/shadowsocks-server.svg)](https://microbadger.com/images/dockage/shadowsocks-server) [![Docker Automated build](https://img.shields.io/docker/automated/dockage/shadowsocks-server.svg?style=flat)](https://hub.docker.com/r/dockage/shadowsocks-server/)
A secure socks5 proxy, designed to protect your Internet traffic.


# Installation

Pull the image from the docker index. This is the recommended method of installation as it is easier to update image. These builds are performed by the **Docker Trusted Build** service.

```bash
docker pull dockage/shadowsocks-server:latest
```

You can also pull the `latest` tag which is built from the repository *HEAD*

```bash
docker pull dockage/shadowsocks-server:latest
```

Alternately you can build the image locally.

```bash
git clone https://github.com/dockage/shadowsocks-server.git
cd shadowsocks-server
docker build --tag="$USER/shadowsocks-server" .
```


# Quick Start

The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/).

```bash
wget https://raw.githubusercontent.com/dockage/shadowsocks-server/master/docker-compose.yml
docker-compose up
```

Alternately, you can manually launch the `shadowsocks` container.

```bash
docker run --name='shadowsocks' -d \
  --publish=8388:8388 \
  --env='SS_PASSWORD=ssp@ss' \
dockage/shadowsocks-server:latest
```


## Available Configuration Parameters

*Please refer the docker run command options for the `--env-file` flag where you can specify all required environment variables in a single file. This will save you from writing a potentially long docker run command. Alternately you can use docker compose.*

Below is the complete list of available options that can be used to customize your shadowsocks installation.

- **SS_PASSWORD**: A password used to encrypt transfer. Defaults to `ssp@ss`.
- **SS_TIMEOUT**: Connections timeout in seconds. Defaults to `300`.
- **SS_METHOD**: The encryption method, "bf-cfb", "aes-256-cfb", etc. Defaults to `aes-256-cfb`.

# Upgrading

To upgrade to newer shadowsocks releases, simply follow this 3 step upgrade procedure.

- **Step 1**: Update the docker image.

```bash
docker pull dockage/shadowsocks-server:latest
```

- **Step 2**: Stop and remove the currently running image

```bash
docker stop shadowsocks
docker rm shadowsocks
```

- **Step 3**: Start the image

```bash
docker run --name=shadowsocks -d [OPTIONS] dockage/shadowsocks-server:latest
```


For more information refer https://github.com/jpetazzo/nsenter

## Quick reference
* Where to get help: [website](https://dockage.dev/), [documentation](https://dockage.dev/docs/)
* GitHub repo: [dockage/php](https://github.com/dockage/php)
* Where to file issues: [GitHub issues](https://github.com/dockage/php/issues)
* Maintained by: The Dockage team (info at dockage.dev)
* License(s) - [license](https://github.com/dockage/php/blob/main/LICENSE), check 3rd party documentation for license information
