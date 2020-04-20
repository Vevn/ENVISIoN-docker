# ENVISIoN-docker
This is a container setup for [ENVISIoN](https://github.com/rartino/ENVISIoN) and [Inviwo](https://github.com/inviwo/inviwo) project.

## Dependencies
Install docker through the official [site](https://docs.docker.com/install/) or through your package manager (Examples using Ubuntu 18.04)

    sudo apt-get install docker-ce docker-ce-cli containerd.io

xhost is required, it can be obtained through.

    sudo apt-get install x11-xserver-utils

# Qt build script
To use the noninteractive install script you must add your Qt login details.
In `qt-install-noninteractive.qs` row 15 and 16.
Replace {email} in `EmailLineEdit.setText("{your email}")` with your qt email and
replace {password} in `PasswordLineEdit.setText("{password}")` with your qt password.

## Building
Clone this repository

    git clone https://github.com/Vevn/ENVISIoN-docker

Enter and run the build script

    cd ENVISIoN-docker
    ./bin/build.sh

After the image has been built run the install script

    ./bin/install.sh

## Running Inviwo or Envision
Now you can run either Inviwo or Envision through the container

Inviwo

    ./bin/inviwo.sh

Envision

    ./bin/envision.sh

## File management
Because of how the container is setup, if you wish to load files into Inviwo or Envision you must place said files in the same directory as the container is run from. Most common this will  be your ENVISIoN-docker cloned directory.

## Known Issues
### Inviwo Process
When creating a new python process in inviwo the new process will not show up in the process list. This is most likely due to `~/.inviwo` folder not being accessed as a mounted volume. To create a python process please place the python script here: `inviwo/modules/python3/processors`.

### Nvidia
Currently opengl cannot be initiated when starting inviwo. This issue is only observed on computers with nvidia drivers.
There is no fix.

## TODO
Currently the install version of envision and inviwo is hard set to latest and v0.9.10 respectivly.
