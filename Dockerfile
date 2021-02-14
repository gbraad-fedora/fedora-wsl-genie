FROM registry.fedoraproject.org/fedora:latest
MAINTAINER Gerard Braad <me@gbraad.nl>

# prepare the image for the compilation
RUN dnf install -y make git-core dotnet-sdk-5.0

# deal with the repo
RUN git clone https://github.com/arkane-systems/genie.git

WORKDIR genie/genie

