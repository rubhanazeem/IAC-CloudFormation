## IAC-CloudFormation
This is a simple example of Infrastructure As Code using CloudFormation.

![Infrastructure](/infrastructure.jpeg)

## Usage
To create a cloud formation stack
`./apply.sh stack_name template_body.yml params.json`\
**example:**
`./apply.sh stack_name network.yml network-params.json` 

You'll have to change the _ImageID_ in `WebAppLaunchConfig/Properties/ImageId`.
