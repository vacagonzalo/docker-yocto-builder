# Yocto Builder

This is a Docker image and container generator intended to build Yocto projects.

In compliance of the [Yocto system requirements](https://docs.yoctoproject.org/ref-manual/system-requirements.html) we have:

- Ubuntu 22.04 (LTS).
- Packages needed to build an image.
- Packages needed to build project documentation.

## Instructions

1. Run the `docker_build.sh` script.
2. Export a workspace (`export WORKSPACE=some/folder/to/work/on`).
3. Run the `create_container.sh`
