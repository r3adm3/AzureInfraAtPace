# Introduction

This ARM Template will spin up a single Windows server with a standard set of tools, with chocolatey and diagnostics. This ARM template is completely self-reliant and has no dependencies

```Powershell
new-azurermresourcegroupdeployment -resourcegroupname singlevm -templatefile .\azuredeploy.json
```