# Define msoffice::servicepack
#
# This definition installs the Microsoft Office service pack update
#
# Parameters:
#   [*version*]         - The version of office
#   [*sp*]              - The service pack update to install
#   [*arch*]            - The architecture version of office
#
# Actions:
#
# Requires:
#
# Usage:
#
define msoffice::servicepack(
  $version,
  $sp,
  $arch = 'x86'
) {
  
  include msoffice::params
  
  validate_re($version,'^(2003|2007|2010|2013)$', 'The version agrument specified does not match a valid version of office')
  validate_re($arch,'^(x86|x64)$', 'The arch argument specified does not match x86 or x64')
  validate_re($sp,'^([1-3])$','The service pack specified does not match 1-3')

  $office_num = $msoffice::params::office_versions[$version]['version']
  $office_reg_key = "HKLM:\\SOFTWARE\\Microsoft\\Office\\${office_num}.0\\Common\\ProductVersion"
  $office_build = $msoffice::params::office_versions[$version]['service_packs'][$sp]['build']

  if $version == '2010' {
    $setup = $msoffice::params::office_versions[$version]['service_packs'][$sp]['setup']
    $sp_root = "${msoffice::params::deployment_root}\\OFFICE${office_num}\\SPs\\${arch}"
  } else {
    $setup = $msoffice::params::office_versions[$version]['service_packs'][$sp]['setup']
    $sp_root = "${msoffice::params::deployment_root}\\OFFICE${office_num}\\SPs"
  }
  
  exec { 'install-sp':
    command   => "& \"${sp_root}\\${setup}\" /q /norestart",
    provider  => powershell,
    logoutput => true,
    onlyif    => "if (Get-Item -LiteralPath \'\\${office_reg_key}\' -ErrorAction SilentlyContinue).GetValue(\'${office_build}\')) { exit 1 }"
  }
}