# ADFS Template

  2x DC
  2x ADFS
  2x WAP
  
  Internal LB
  External LB
  
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmcoutanche%2Fazure-json%2Fmaster%2Fadfs-6vm-template%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>


Source template found here https://github.com/paulomarquesc

NOTE: Needs to have external LB probe changed to 443 - using port 80 requires WAP servers to have port 80 enabled on the windows firewall so that the LB does not assume the VMs are off and block 443 traffic from being forwarded to the WAP servers.
