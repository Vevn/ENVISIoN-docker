# ENVISIoN-docker
This is a container setup for [ENVISIoN](https://github.com/rartino/ENVISIoN) and [Inviwo](https://github.com/inviwo/inviwo) project.

## Dependencies
Install docker through the official [site](https://docs.docker.com/install/) or through your package manager (Exmaples using Ubuntu 18.04)
`sudo apt-get install docker-ce docker-ce-cli containerd.io`

xhost is required, it can be obtained through.
`sudo apt-get install x11-xserver-utils`

## Building
Clone this repository
`git clone https://github.com/Vevn/ENVISIoN-docker`

Enter and run the build script
`cd ENVISIoN-docker`
`./bin/build.sh`

After the image has been build run the install script
`./bin/install.sh`

## Running Inviwo or Envision
Now you can run either Inviwo or Envision through the container

Inviwo
`./bin/inviwo.sh`

Envision
`./bin/envision.sh`

## TODO
Currently the install version of envision and inviwo is hard set to latest and v0.9.10 respectivly.
