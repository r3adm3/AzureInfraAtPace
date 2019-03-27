# Introduction

This ARM Template will spin up a basic VNET and a single subnet within a resource group which can be permissioned to only allow specific teams control of things like network configuration, firewalling, centralised diagnostic accounts and logs.

This template puts in resources which are referred to by other templates. 

To execute this ARM Template:

```Powershell
new-azurermresourcegroupdeployment -resourcegroupname sharedResources -templatefile .\azuredeploy.json
```