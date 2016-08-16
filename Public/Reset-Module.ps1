function Reset-Module 
{    
<#
.SYNOPSIS
    Resets a module for the current session.
 
.DESCRIPTION
    Removes a module and imports it again into the current session.
 
.PARAMETER Name
    Name of the module to reset. Note that this is just the name like you would use for Remove-Module - no extension or path.
 
.EXAMPLE
     Reset-Module -Name Pester
 
     Removes the module Pester and imports it again into the current session.
 
.NOTES
    Author  : Paul Broadwith
    Date    : 16/06/2016
    Website : http://pauby.com
    Twitter : @pauby
#>

	Param (
		[Parameter(Mandatory=$true)]
		[string]
		$Name
	)
			
    Write-Verbose "Checking module is loaded"
    $module = Get-Module $Name
    if ($module) {
        Remove-Module $name
        Import-Module $module.Path
    }
}
