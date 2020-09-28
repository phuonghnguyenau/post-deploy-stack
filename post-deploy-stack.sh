#!/bin/bash

echo "Creating OpenStack resources required for OpenShift..."
openstack stack create -t templates/external_network.yaml --wait network_stack
openstack router set --external-gateway external_network internal_router
openstack stack create -t templates/common.yaml --wait shared_stack
openstack stack create -t templates/project.yaml --wait project_stack
