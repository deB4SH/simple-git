Simple Git Docker
=====
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

Simple Git Docker is a small docker image that provides a git daemon via port 9418 and a cgit web interface to review your repositories under port 80/cgit.

Why provide such an image? To resolve the chicken-egg dilemma in air-gapped environments. You can't start your infrastructure as code environment when your git service is provided through an implementation within the provisioned environment. With this docker image you can run a specific isolated environment for this use case. You need to keep in mind that this service provides an unauth'd git endpoint. Anyone with the knowledge about this service and ports may use it within your local environment. Isolation via network rules may be required.

## Getting Started

It is easiest to run this image with docker compose. The following listing describes a simple deployment which may be useful to you.

```yaml
services:
  git:
    image:
      ghcr.io/deb4sh/simple-git:sha-2235d20
    ports:
      - 9418:9418
      - 8080:80
    volumes:
      - /media/git_data:/data
```

To create a repository you simply need to create a bare repository within the `/media/git_data` directory with the following command. `git init --bare MYAWESOMEREPO`. To export this repository change your directory into the newly created bare repository and touch a new file called `git-daemon-export-ok`. This can be done via the following command. `touch git-daemon-export-ok`

After this everything should work and you can push and pull your repositories there. An example clone may look like `git clone git://YOUR_IP/MYAWESOMEREPO`

[contributors-shield]: https://img.shields.io/github/contributors/deb4sh/simple-git.svg?style=for-the-badge
[contributors-url]: https://github.com/deb4sh/simple-git/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/deb4sh/simple-git.svg?style=for-the-badge
[forks-url]: https://github.com/deb4sh/simple-git/network/members
[stars-shield]: https://img.shields.io/github/stars/deb4sh/simple-git.svg?style=for-the-badge
[stars-url]: https://github.com/deb4sh/simple-git/stargazers
[issues-shield]: https://img.shields.io/github/issues/deb4sh/simple-git.svg?style=for-the-badge
[issues-url]: https://github.com/deb4sh/simple-git/issues
[license-shield]: https://img.shields.io/github/license/deb4sh/simple-git.svg?style=for-the-badge
[license-url]: https://github.com/deb4sh/simple-git/blob/main/LICENSE.txt