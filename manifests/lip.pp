#
# Define msoffice::lip
#
# The define installs a language interface pack
#
# Parameters:
#   [*version*]         - The version of office that was installed
#   [*lang_code]        - The language code of the language to install
#   [*arch*]            - The architecture version of office
#
# Usage:
#
#   msoffice::lip {
#     version   => '2010',
#     lang_code => 'fr-fr',
#     arch      => 'x64'
#   }
#
define msoffice::lip(
  $version,
  $lang_code,
  $arch = 'x86',
) {

  include msoffice::params
  
  validate_re($version,'^(2003|2007|2010|2013)$', 'The version agrument specified does not match a valid version of office')
  validate_re($arch,'^(x86|x64)$', 'The arch argument specified does not match x86 or x64')
  
  $lang_regex = join(keys($msoffice::params::lcid_strings), '|')
  validate_re($lang_code,"^${lang_regex}$", 'The lang_code argument does not specifiy a valid language identifier')

  $office_num = $msoffice::params::office_versions[$version]['version']
  $lip_root = "${msoffice::params::deployment_root}\\OFFICE${office_num}\\LIPs"
  $lip_reg_key = "HKLM:\\SOFTWARE\\Microsoft\\Office\\${office_num}.0\\Common\\LanguageResources\\InstalledUIs"
  $lang_id = $msoffice::params::lcid_strings[$lang_code]
  $setup = "languageinterfacepack-${arch}-${lang_code}.exe"

  exec { 'install-lip':
    command   => "& \"${lip_root}\\${setup}\" /q /norestart",
    provider  => powershell,
    logoutput => true,
    onlyif    => "if (Get-Item -LiteralPath \'\\${lip_reg_key}\' -ErrorAction SilentlyContinue).GetValue(\'${lang_id}\')) { exit 1 }"
  }
  
}