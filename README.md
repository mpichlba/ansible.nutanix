# ansible.nutanix

This repository contains a `Containerfile` for building a Fedora-based image with Ansible and the Nutanix Ansible collection.

## What the image includes

- `python3-pip`
- `ansible`
- `wget`
- `git`
- upgraded `pip` and `setuptools`
- cloned `nutanix/nutanix.ansible` repository
- checkout of collection version `v2.4.0`
- built and installed `nutanix.ncp` Ansible collection

## Build the image

Using Podman:

```bash
podman build -t ansible-nutanix -f Containerfile .
```

Using Docker:

```bash
docker build -t ansible-nutanix -f Containerfile .
```

## Run the image

Using Podman:

```bash
podman run --rm -it ansible-nutanix /bin/bash
```

Using Docker:

```bash
docker run --rm -it ansible-nutanix /bin/bash
```

## Verify the installation

Inside the container, you can confirm the tooling is available with:

```bash
ansible --version
ansible-galaxy collection list | grep nutanix
python3 --version
```

## Notes

- The build currently uses `fedora:latest`, so package versions may change over time.
- The Nutanix Ansible content is checked out at `v2.4.0`.
- Internet access is required during image build because packages and source code are downloaded.
