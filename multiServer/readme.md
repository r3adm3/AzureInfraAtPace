
# Introduction

This ARM Template will spin up two Windows servers, no extra tools with a press of the button below.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

or via code...

```Powershell
new-azurermresourcegroupdeployment -resourcegroupname servergroup1 -templatefile .\azuredeploy.json
```

This ARM template is dependent on the sharedResources deployment and on the w16server\azuredeploy.json template