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

# Parameters 

You can use an existing virtual network or create a new VNET while deploying this template. The various parameters available for customizing the deployment are listed below with the description of usage of the parameter in the deployment process.

Location - The region to deploy the resources into, e.g. East US.

StorageAccountType - The type of the Storage Account created

VirtualNetworkUsage - Indicates if a new virtual network will be created or use an existing one

VirtualNetworkName - The name of the Virtual Network to Create, mandatory on both existing or new virtual network usage

VirtualNetworkResourceGroupName - Specifies the name of the resource group where the existing virtual network resides. When using an existing virtual network, this becomes a mandatory parameter so the deployment can find the ID of the existing virtual network

VirtualNetworkAddressRange - The address range of the new VNET, mandatory if creating a new virtual network

InternalSubnetName - The name of the internal subnet, mandatory on both virtual network usage options (new or existing)

InternalSubnetAddressRange - The address range of the internal subnet, which contains the Domain Controllers and ADFS servers, mandatory if creating a new virtual network.

DMZSubnetAddressRange - The address range of the dmz subnet, which contains the Windows application proxy servers, mandatory if creating a new virtual network.

DMZSubnetName - The name of the internal subnet, mandatory on both virtual network usage options (new or existing).

ADDC01NICIPAddress - The internal IP address of the first Domain Controller, this IP address will be statically assigned to the DC and must be a valid ip address within the Internal subnet

ADDC02NICIPAddress - The internal IP address of the second Domain Controller, this IP address will be statically assigned to the DC and must be a valid ip address within the Internal subnet

ADFS01NICIPAddress - The internal IP address of the first ADFS server, this IP address will be statically assigned to the ADFS server and must be a valid ip address within the Internal subnet

ADFS02NICIPAddress - The internal IP address of the second ADFS server, this IP address will be statically assigned to the ADFS server and must be a valid ip address within the Internal subnet

WAP01NICIPAddress - The internal IP address of the first WAP server, this IP address will be statically assigned to the WAP server and must be a valid ip address within the DMZ subnet

WAP02NICIPAddress - The internal IP address of the second WAP server, this IP address will be statically assigned to the WAP server and must be a valid ip address within the DMZ subnet

ADFSLoadBalancerPrivateIPAddress - The internal IP address of the ADFS load balancer, this IP address will be statically assigned to the load balancer and must be a valid ip address within the Internal subnet

ADDCVMNamePrefix - Virtual Machine name prefix for Domain Controllers

ADFSVMNamePrefix - Virtual Machine name prefix for ADFS servers

WAPVMNamePrefix - Virtual Machine name prefix for WAP servers

ADDCVMSize - The vm size of the Domain Controllers

ADFSVMSize - The vm size of the ADFS servers

WAPVMSize - The vm size of the WAP servers

AdminUserName	- The name of the local Administrator of the virtual machines

AdminPassword	- The password for the local Administrator account of the virtual machines
