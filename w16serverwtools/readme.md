# Introduction

This ARM Template will spin up a single Windows server, with extra tools using chocalatey with a press of the button below. It can also be used as part of a set of nested templates. 

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

or via code...

```Powershell
New-AzureRmResourceGroupDeployment -ResourceGroup engReskill_rg -TemplateFile .\azuredeploy.json -TemplateParameterFile .\parametersfile.json
```

This ARM template is dependent on the sharedResources deployment.
