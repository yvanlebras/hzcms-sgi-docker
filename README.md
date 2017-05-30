# Science Gateway Institute Demo Image
This Docker container allows for community members to investigate, evaulate, and start building a Gateway using the HUBzero platform before investing time and effort in a production-level environment.

This container should _not_ be used within a production setting, however it provides a basic set of functionality to allow for sample content creation.

## System Requirements for Evaluation
* Docker Engine
* 1 GB of RAM
* 2.5 GB of Disk
* 1 - 2 cores

## Getting Started
1. Clone this repository: `git clone https://github.com/hzcms-sgi-docker`
1. Build the container: `cd hzcms-sgi-docker && docker build -t hubzero-cms ./`
1. Run the container: `docker run -p 443:443 hubzero-cms`
1. In your browser, navigate to https://localhost.

## Troubleshooting
* Sometimes the image may not build correctly. To remove the Docker image: `docker rmi hubzero-cms`.

