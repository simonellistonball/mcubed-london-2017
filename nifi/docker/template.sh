#!/bin/sh

ROOT_ID=$(curl http://localhost:8080/nifi-api/process-groups/root | jq .id -r)

# OpenCV example
RESP=$(curl "http://localhost:8080/nifi-api/process-groups/${ROOT_ID}/templates/upload" -H 'X-Requested-With: XMLHttpRequest' -F "template=@OpenCV_Face_Detection.xml")
TEMPLATE_ID=$(echo $RESP | xmllint --xpath '/templateEntity/template/id/text()' -)
JSON="{\"templateId\":\"${TEMPLATE_ID}\",\"originX\":300,\"originY\":0}"
curl "http://localhost:8080/nifi-api/process-groups/${ROOT_ID}/template-instance" -H "Content-Type: application/json" --data-binary $JSON

# TensorFlow Example
RESP=$(curl "http://localhost:8080/nifi-api/process-groups/${ROOT_ID}/templates/upload" -H 'X-Requested-With: XMLHttpRequest' -F "template=@TF_example.xml")
TEMPLATE_ID=$(echo $RESP | xmllint --xpath '/templateEntity/template/id/text()' -)
JSON="{\"templateId\":\"${TEMPLATE_ID}\",\"originX\":1800,\"originY\":0}"
curl "http://localhost:8080/nifi-api/process-groups/${ROOT_ID}/template-instance" -H "Content-Type: application/json" --data-binary $JSON

# Azure Example
RESP=$(curl "http://localhost:8080/nifi-api/process-groups/${ROOT_ID}/templates/upload" -H 'X-Requested-With: XMLHttpRequest' -F "template=@AzureFace.xml")
TEMPLATE_ID=$(echo $RESP | xmllint --xpath '/templateEntity/template/id/text()' -)
JSON="{\"templateId\":\"${TEMPLATE_ID}\",\"originX\":3300,\"originY\":0}"
curl "http://localhost:8080/nifi-api/process-groups/${ROOT_ID}/template-instance" -H "Content-Type: application/json" --data-binary $JSON

# run everything
curl "http://localhost:8080/nifi-api/flow/process-groups/${ROOT_ID}" -H "Content-Type: application/json" --data-binary "{\"id\":\"${ROOT_ID}\",\"state\":\"RUNNING\"}"
