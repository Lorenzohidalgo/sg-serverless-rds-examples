#!/bin/bash
STACK_NAME=$1
if [ -z "$1" ]
  then
    echo "No argument supplied for STACK_NAME"
    exit 1
fi
DB_NAME=$2
if [ -z "$2" ]
  then
    echo "No argument supplied for DB_NAME"
    exit 1
fi
REGION=$3
if [ -z "$3" ]
  then
    echo "No argument supplied for REGION"
    exit 1
fi
DB_ARN=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query "Stacks[0].Outputs[?OutputKey=='RDSClusterArn'].OutputValue" --output text --region $REGION)
DB_SECRET_ARN=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query "Stacks[0].Outputs[?OutputKey=='RDSSecretArn'].OutputValue" --output text --region $REGION)
RESPONSE=$(aws rds-data execute-statement --resource-arn $DB_ARN --secret-arn $DB_SECRET_ARN --database $DB_NAME  --sql file://sql/create_tables.sql --region $REGION)
echo $RESPONSE