#!/bin/bash

# Prompt the user for inputs
read -p "Enter name: " name
read -p "Enter URL for CloudWatch: " cdurl
read -p "Enter URL for InfluxDB: " ifxurl
read -p "Enter URL for ElasticSearch: " esurl

# Install Helm chart
helm install --set "grafana.sidecar.datasources.cloudwatch.url=$cdurl"  --set "grafana.sidecar.datasources.influxdb.url=$ifxurl"  --set "grafana.sidecar.datasources.elasticsearch.url=$esurl" "$name" ./
