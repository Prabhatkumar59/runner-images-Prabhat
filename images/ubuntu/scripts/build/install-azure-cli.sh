#!/bin/bash -e
################################################################################
##  File:  install-azure-cli.sh
##  Desc:  Install Azure CLI (az)
################################################################################

# Install Azure CLI (instructions taken from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
curl -fsSL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo "azure-cli https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt" >> $HELPER_SCRIPTS/apt-sources.txt

# Warm-up Azure CLI
az version > /dev/null 2>&1

# Clean up
rm -f /etc/apt/sources.list.d/azure-cli.list
rm -f /etc/apt/sources.list.d/azure-cli.list.save

invoke_tests "CLI.Tools" "Azure CLI"
