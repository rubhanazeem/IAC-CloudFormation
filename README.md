## IAC-CloudFormation
This is a simple example of Infrastructure As Code using CloudFormation.

![Infrastructure](/infrastructure.jpeg)

## Usage
To create a cloud formation stack
`./apply.sh stack_name template_body.yml params.json`\
**example:**
`./apply.sh stack_name network.yml network-params.json` 


1. You'll have to change the **ImageID** in **servers.yml** `WebAppLaunchConfig/Properties/ImageId`.
2. Right now the dafault region is `eu-celtral-1`. If you want to use any other region please pass that as an addional parameter. \
`./apply.sh stack_name network.yml network-params.json eu-central-1` 

