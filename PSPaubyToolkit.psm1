<#
# This file is part of the PSPaubyToolkit distribution (https://github.com/pauby/PSPaubyToolkit).
# Copyright (c) 2016 Paul Broadwith
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#>

<#
.NOTES
    File Name	: PSPaubyToolkit.psm1
    Author		: Paul Broadwith (paul@pauby.com)					
#>

#Requires -Version 3
Set-StrictMode -Version Latest

$functions = get-childitem $PSScriptRoot\*.ps1 -recurse -exclude *.tests.ps1
foreach ($function in $functions) {
    Write-Verbose "Importing script file $function.ps1"
    . $function
}

Export-ModuleMember -Function *