#!/bin/bash

region=eu-central-1

REGION=${4:-$region}

usage() {
    echo "required:"
    echo "--stack-name          specify the stack name"
    echo "--template-body       specify the .yml template file which you want to apply"
    echo "--parameters          Specify the parameters file"
    echo "--region              (default '$REGION')"
    echo " "
    echo "example:              ./apply infrastructure_name template.yml params.json"
    echo " "
}

create_stack() {
    aws cloudformation create-stack \
    --profile 'test' \
    --stack-name $1 \
    --template-body file://$2 \
    --parameters file://$3 \
    --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM \
    --region=$REGION
}

update_stack() {
    aws cloudformation update-stack \
    --profile 'test' \
    --stack-name $1 \
    --template-body file://$2 \
    --parameters file://$3 \
    --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM \
    --region=$REGION
}

if [ $# -ne 3 ]; then
    usage
    exit 0
fi

if ! aws cloudformation --profile "test" describe-stacks --region $REGION --stack-name $1 ; then
    echo -e "\n$1 does not exist, creating a new stack"
    create_stack $1 $2 $3
else
    update_stack $1 $2 $3
fi