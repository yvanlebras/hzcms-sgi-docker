# Science Gateway Institute Demo Image
This Docker container allows for community members to investigate, evaulate, and start building a Gateway using the HUBzero platform before investing time and effort in a production-level environment.

This container should _not_ be used within a production setting, however it provides a basic set of functionality to allow for sample content creation.

## Feature Set
This contains a subset of the HUBzero Platform's functionality. The functionality contained in this container consists of the HUBzero Content Management System which enables Gateway Developers to start creating Resources, Publications, Projects, Groups, Wikis, Calendars & Events, Member Registrations, Collections, Blogs, Templates, and many more content types. The user manual can be found at [HUBzero Documentation](https://hubzero.org/documentation)

### Simulation Tools
At this time, simulations tools are not supported. To evaluate simulation tools, please refer to the [Amazon Marketplace Image](https://aws.amazon.com/marketplace/pp/B00THHMFEQ?qid=1496176303315&sr=0-1&ref_=srh_res_product_title) or the [VMware Virtual Machine](https://hubzero.org/download). You will need a valid SSL certificate [[1]](https://hubzero.org/documentation/2.1.0/installationrh/installrh.hzvncproxydws) [[2]](https://hubzero.org/documentation/2.1.0/installationrh/installrh.cms). You may use a service such as [Let's Encrypt](https://certbot.eff.org/).

## System Requirements for Evaluation
* Docker Engine
* 1 GB of RAM
* 2.5 GB of Disk
* 1 - 2 cores

## Getting Started
1. Clone this repository: `git clone https://github.com/hubzero/hzcms-sgi-docker`
1. Build the container: `cd hzcms-sgi-docker && docker build -t hubzero-cms ./`
1. Run the container: `docker run -p 443:443 hubzero-cms`
1. In your browser, navigate to https://localhost.

## Troubleshooting
* Sometimes the image may not build correctly. To remove the Docker image: `docker rmi hubzero-cms`.

