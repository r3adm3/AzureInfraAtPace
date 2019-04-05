# Introduction

This ARM Template will spin up a single Windows server, no extra tools, with a public ip and NSG to allow RDP access in with a press of the button below.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

or via code...

```Powershell
new-azurermresourcegroupdeployment -resourcegroupname servergroup1 -templatefile .\azuredeploy.json
```

This ARM template is dependent on the sharedResources deployment.
