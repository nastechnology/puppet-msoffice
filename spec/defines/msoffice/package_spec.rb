require 'spec_helper'

describe 'msoffice::package', :type => :define do
  
  $temp_dir = 'C:\\Windows\\Temp'

  $office_versions = { "2003" => {
      "version" => "11",
      "editions" => {
          "Basic" => {
              "products" => ['Word','Excel','Outlook'],
              "office_product" => 'basic11',
          },
          "Student and Teacher" => {
              "products" => ['Word','Excel','Outlook','Powerpoint'],
              "office_product" => 'stdedu',
          },
          "Standard" => {
              "products" => ['Word','Excel','Outlook','Powerpoint'],
              "office_product" => 'std11',
          },
          "Small Business" => {
              "products" => ['Word','Excel','Outlook','Powerpoint','Publisher'],
              "office_product" => 'sbe11',
          },
          "Professional" => {
              "products" => ['Word','Excel','Outlook','Powerpoint','Publisher','InfoPath'],
              "office_product" => 'pro',
          }
      },
      "service_packs" => {
          "0" => {
              "build" => '11.0.5614.0'
          },
          "1" => {
              "setup" => 'Office2003SP1-kb842532-fullfile-enu',
              "build" => '11.0.6355.0'
          },
          "2" => {
              "setup" => 'Office2003SP2-KB887616-FullFile-ENU',
              "build" => '11.0.7969.0'
          },
          "3" => {
              "setup" => 'Office2003SP3-KB923618-FullFile-ENU',
              "build" => '11.0.8173.0'
          }
      }
  },
                       "2007" => {
                           "version" => "12",
                           "editions" => {
                               "Basic" => {
                                   "products" => ['Word','Excel','Outlook'],
                                   "office_product" => 'Basic',
                               },
                               "Home and Student" => {
                                   "products" => ['Word','Excel','Powerpoint'],
                                   "office_product" => 'Home and Student',
                               },
                               "Standard" => {
                                   "products" => ['Word','Excel','Powerpoint','Outlook'],
                                   "office_product" => 'Standard',
                               },
                               "Small Business" => {
                                   "products" => ['Word','Excel','Powerpoint','Outlook','Publisher'],
                                   "office_product" => 'Small Business',
                               },
                               "Professional" => {
                                   "products" => ['Word','Excel','Powerpoint','Outlook','Publisher','Access'],
                                   "office_product" => 'Pro',
                               },
                               "Professional Plus" => {
                                   "products" => ['Word','Excel','Powerpoint','Outlook','Publisher','Access','InfoPath','Communicator'],
                                   "office_product" => 'ProPlus',
                               },
                               "Ultimate" => {
                                   "products" => ['Word','Excel','Powerpoint','Outlook','Publisher','Access','InfoPath','Groove','OneNote'],
                                   "office_product" => 'Ultimater',
                               },
                               "Enterprise" => {
                                   "products" => ['Word','Excel','Powerpoint','Outlook','Publisher','Access','InfoPath','Communicator','Groove','OneNote'],
                                   "office_product" => 'Enterpise',
                               }
                           },
                           "service_packs" => {
                               "0" => {
                                   "build" => '12.0.4518.1014'
                               },
                               "1" => {
                                   "setup" => 'office2007sp1-kb936982-fullfile-en-us.exe',
                                   "build" => '12.0.6215.1000'
                               },
                               "2" => {
                                   "setup" => 'office2007sp2-kb953195-fullfile-en-us.exe',
                                   "build" => '12.0.6425.1000'
                               },
                               "3" => {
                                   "setup" => 'office2007sp3-kb2526086-fullfile-en-us.exe',
                                   "build" => '12.0.6612.1000'
                               }
                           }
                       },
                       "2010" => {
                           "version" => "14",
                           "editions" => {
                               "Starter" => {
                                   "products" => ['Word','Excel'],
                                   "office_product" => 'Starter',
                               },
                               "Personal" => {
                                   "products" => ['Word','Excel','Outlook'],
                                   "office_product" => 'Personal',
                               },
                               "Home and Student" => {
                                   "products" => ['Word','Excel','Powerpoint','OneNote'],
                                   "office_product" => 'Home and Student',
                               },
                               "Home and Business" => {
                                   "products" => ['Word','Excel','Powerpoint','OneNote','Outlook'],
                                   "office_product" => 'Home and Business',
                               },
                               "Standard" => {
                                   "products" => ['Word','Excel','Powerpoint','OneNote','Outlook','Publisher'],
                                   "office_product" => 'Standardr',
                               },
                               "Professional" => {
                                   "products" => ['Word','Excel','Powerpoint','OneNote','Outlook','Access'],
                                   "office_product" => 'Pro',
                               },
                               "Professional Plus" => {
                                   "products" => ['Word','Excel','Powerpoint','OneNote','Outlook','Access','InfoPath','Sharepoint Workspace'],
                                   "office_product" => 'ProPlus',
                               },
                           },
                           "service_packs" => {
                               "0" => {
                                   "build" => '14.0.4760.1000'
                               },
                               "1" => {
                                   "setup" => {
                                       "x86" => "officesuite2010sp1-kb2460049-x86-fullfile-en-us.exe",
                                       "x64" => "officesuite2010sp1-kb2460049-x64-fullfile-en-us.exe",
                                   },
                                   "build" => '14.0.6023.1000'
                               },
                               "2" => {
                                   "setup" => {
                                       "x86" => "officesp2010-kb2687455-fullfile-x86-en-us.exe",
                                       "x64" => "officesp2010-kb2687455-fullfile-x64-en-us.exe",
                                   },
                                   "build" => '14.0.7011.1000'
                               },
                           }
                       },
                       "2013" => {
                           "version" => "15",
                           "editions" => {
                               "Home and Student" => {
                                   "products" => ['Word','Excel','Powerpoint','OneNote'],
                                   "office_product" => 'Home and Student',
                               },
                               "Home and Business" => {
                                   "products" => ['Word','Excel','Powerpoint','OneNote', 'Outlook'],
                                   "office_product" => 'Home and Business',
                               },
                               "Standard" => {
                                   "products" => ['Word','Excel','Powerpoint','OneNote', 'Outlook','Publisher'],
                                   "office_product" => 'Standardr',
                               },
                               "Professional" => {
                                   "products" => ['Word','Excel','Powerpoint','OneNote', 'Outlook','Publisher','Access'],
                                   "office_product" => 'Pro',
                               },
                               "Professional Plus" => {
                                   "products" => ['Word','Excel','Powerpoint','OneNote', 'Outlook','Publisher','Access', 'InfoPath', 'Lync'],
                                   "office_product" => 'ProPlus',
                               }
                           },
                           "service_packs" => {
                               "0" => {
                                   "build" => '15.0.4420.1027'
                               },
                           }
                       }
  }

  $lcid_strings = {
      'af' => '1078', 'sq' => '1052', 'am' => '1118', 'ar-dz' => '5121', 'ar-bh' => '15361', 'ar-eg' => '3073', 'ar-iq' => '2049',
      'ar-jo' => '11265', 'ar-kw' => '13313', 'ar-lb' => '12289', 'ar-ly' => '4097', 'ar-ma' => '6145', 'ar-om' => '8193',
      'ar-qa' => '16385', 'ar-sa' => '1025', 'ar-sy' => '10241', 'ar-tn' => '7169', 'ar-ae' => '14337', 'ar-ye' => '9217',
      'hy' => '1067', 'as' => '1101', 'az-az' => '2092', 'eu' => '1069', 'be' => '1059', 'bn' => '2117', 'bs' => '5146',
      'bg' => '1026', 'my' => '1109', 'ca' => '1027', 'zh-cn' => '2052', 'zh-hk' => '3076', 'zh-mo' => '5124', 'zh-sg' => '4100',
      'zh-tw' => '1028', 'hr' => '1050', 'cs' => '1029', 'da' => '1030', 'dv' => '1125', 'nl-be' => '2067', 'nl-nl' => '1043',
      'en-au' => '3081', 'en-bz' => '10249', 'en-ca' => '4105', 'en-cb' => '9225', 'en-gb' => '2057', 'en-in' => '16393',
      'en-ie' => '6153', 'en-jm' => '8201', 'en-nz' => '5129', 'en-ph' => '13321', 'en-za' => '7177', 'en-tt' => '11273',
      'en-us' => '1033', 'et' => '1061', 'fo' => '1080', 'fa' => '1065', 'fi' => '1035', 'fr-be' => '2060', 'fr-ca' => '3084',
      'fr-fr' => '1036', 'fr-lu' => '5132', 'fr-ch' => '4108', 'mk' => '1071', 'gd-ie' => '2108', 'gd' => '1084', 'de-at' => '3079',
      'de-de' => '1031', 'de-li' => '5127', 'de-lu' => '4103', 'de-ch' => '2055', 'el' => '1032', 'gn' => '1140', 'gu' => '1095',
      'he' => '1037', 'hi' => '1081', 'hu' => '1038', 'is' => '1039', 'id' => '1057', 'it-it' => '1040', 'it-ch' => '2064',
      'ja' => '1041', 'kn' => '1099', 'ks' => '1120', 'kk' => '1087', 'km' => '1107', 'ko' => '1042', 'lo' => '1108', 'la' => '1142',
      'lv' => '1062', 'lt' => '1063', 'ms-bn' => '2110', 'ms-my' => '1086', 'ml' => '1100', 'mt' => '1082', 'mi' => '1153',
      'mr' => '1102', 'mn' => '2128', 'ne' => '1121', 'no-no' => '1044', 'or-or' => '1096', 'pl' => '1045', 'pt-br' => '1046',
      'pt-pt' => '2070', 'pa' => '1094', 'rm' => '1047', 'ro-mo' => '2072', 'ro' => '1048', 'ru' => '1049', 'ru-mo' => '2073',
      'sa' => '1103', 'sr-sp' => '3098', 'tn' => '1074', 'sd' => '1113', 'si' => '1115', 'sk' => '1051', 'sl' => '1060',
      'so' => '1143', 'sb' => '1070', 'es-ar' => '11274', 'es-bo' => '16394', 'es-cl' => '13322', 'es-co' => '9226', 'es-cr' => '5130',
      'es-do' => '7178', 'es-ec' => '12298', 'es-sv' => '17418', 'es-gt' => '4106', 'es-hn' => '18442', 'es-mx' => '2058',
      'es-ni' => '19466', 'es-pa' => '6154', 'es-py' => '15370', 'es-pe' => '10250', 'es-pr' => '20490', 'es-es' => '1034',
      'es-uy' => '14346', 'es-ve' => '8202', 'sw' => '1089', 'sv-fi' => '2077', 'sv-se' => '1053', 'tg' => '1064', 'ta' => '1097',
      'tt' => '1092', 'te' => '1098', 'th' => '1054', 'bo' => '1105', 'ts' => '1073', 'tr' => '1055', 'tk' => '1090', 'uk' => '1058',
      'ur' => '1056', 'uz-uz' => '2115', 'vi' => '1066', 'cy' => '1106', 'xh' => '1076', 'yi' => '1085', 'zu' => '1077'
  }

  
  let :hiera_data do
    { 
      :windows_deployment_root => '\\test-server\packages', 
      :company_name => 'Example Inc',
      :office_username => 'Joe'
    }
  end
  
  $office_versions['2013']['editions'].keys.each do |edition|
    product = $office_versions['2013']['editions'][edition]['office_product']
    
    describe "installing office 2013 #{edition}" do
      let :title do 'msoffice for 2013' end
      let :params do 
        { :version => '2013', :edition => edition, :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
      end

      it { should contain_exec('install-office').with(
        'command' => "\"\\test-server\\packages\\OFFICE15\\#{edition}\\setup.exe\" /config \"C:\\\\Windows\\\\Temp\\office_config.xml\"",
        'provider' => 'windows'
      )}
      
      it { should contain_exec('upgrade-office').with(
        'command' => "\"\\test-server\\packages\\OFFICE15\\#{edition}\\setup.exe\" /modify #{product} /config \"C:\\\\Windows\\\\Temp\\office_config.xml\""
      )}
    end

    $office_versions['2013']['service_packs'].keys.each do |sp|
      build = $office_versions['2013']['service_packs'][sp]['build']
      describe "uninstalling office 2013 #{edition} SP#{sp}" do
        let :title do 'msoffice for 2013' end
        let :params do
          { :ensure => 'absent', :version => '2013', :edition => edition, :sp => sp, :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
        end

        it { should contain_exec('uninstall-office').with(
          'command' => "& \"\\test-server\\packages\\OFFICE15\\#{edition}\\setup.exe\" /uninstall #{product} /config \"C:\\\\Windows\\\\Temp\\office_config.xml\"",
          'provider' => 'powershell',
          'onlyif' => "if (Get-Item -LiteralPath \'\\HKLM:\\SOFTWARE\\Microsoft\\Office\\15.0\\Common\\ProductVersion\' -ErrorAction SilentlyContinue).GetValue(\'#{build}\')) { exit 1 }"
        )}
      end
    end
  end
  
  $office_versions['2010']['editions'].keys.each do |edition|
    product = $office_versions['2010']['editions'][edition]['office_product']
    
    describe "installing office 2010 #{edition}" do
      let :title do 'msoffice for 2010' end
      let :params do 
        { :version => '2010', :edition => edition, :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
      end

      it { should contain_exec('install-office').with(
        'command' => "\"\\test-server\\packages\\OFFICE14\\#{edition}\\x86\\setup.exe\" /config \"C:\\\\Windows\\\\Temp\\office_config.xml\"",
        'provider' => 'windows'
      )}
      
      it { should contain_exec('upgrade-office').with(
        'command' => "\"\\test-server\\packages\\OFFICE14\\#{edition}\\x86\\setup.exe\" /modify #{product} /config \"C:\\\\Windows\\\\Temp\\office_config.xml\""
      )}
    end

    $office_versions['2010']['service_packs'].keys.each do |sp|
      build = $office_versions['2010']['service_packs'][sp]['build']
      describe "uninstalling office 2010 #{edition} SP#{sp}" do
        let :title do 'msoffice for 2010' end
        let :params do
          { :ensure => 'absent', :version => '2010', :edition => edition, :sp => sp, :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
        end

        it { should contain_exec('uninstall-office').with(
          'command' => "& \"\\test-server\\packages\\OFFICE14\\#{edition}\\x86\\setup.exe\" /uninstall #{product} /config \"C:\\\\Windows\\\\Temp\\office_config.xml\"",
          'provider' => 'powershell',
          'onlyif' => "if (Get-Item -LiteralPath \'\\HKLM:\\SOFTWARE\\Microsoft\\Office\\14.0\\Common\\ProductVersion\' -ErrorAction SilentlyContinue).GetValue(\'#{build}\')) { exit 1 }"
        )}
      end
    end
  end

  $office_versions['2007']['editions'].keys.each do |edition|
    product = $office_versions['2007']['editions'][edition]['office_product']
    
    describe "installing office 2007 #{edition}" do
      let :title do 'msoffice for 2007' end
      let :params do 
        { :version => '2007', :edition => edition, :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
      end

      it { should contain_exec('install-office').with(
        'command' => "\"\\test-server\\packages\\OFFICE12\\#{edition}\\setup.exe\" /config \"C:\\\\Windows\\\\Temp\\office_config.xml\"",
        'provider' => 'windows'
      )}
      
      it { should contain_exec('upgrade-office').with(
        'command' => "\"\\test-server\\packages\\OFFICE12\\#{edition}\\setup.exe\" /modify #{product} /config \"C:\\\\Windows\\\\Temp\\office_config.xml\""
      )}
    end

    $office_versions['2007']['service_packs'].keys.each do |sp|
      build = $office_versions['2007']['service_packs'][sp]['build']
      describe "uninstalling office 2007 #{edition}" do
        let :title do 'msoffice for 2007' end
        let :params do
          { :ensure => 'absent', :version => '2007', :edition => edition, :sp => sp, :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
        end

        it { should contain_exec('uninstall-office').with(
          'command' => "& \"\\test-server\\packages\\OFFICE12\\#{edition}\\setup.exe\" /uninstall #{product} /config \"C:\\\\Windows\\\\Temp\\office_config.xml\"",
          'provider' => 'powershell',
          'onlyif' => "if (Get-Item -LiteralPath \'\\HKLM:\\SOFTWARE\\Microsoft\\Office\\12.0\\Common\\ProductVersion\' -ErrorAction SilentlyContinue).GetValue(\'#{build}\')) { exit 1 }"
        )}
      end
    end
  end
  
  $office_versions['2003']['editions'].keys.each do |edition|
    product = $office_versions['2003']['editions'][edition]['office_product']
    describe "installing office 2003 #{edition}" do
      let :title do 'msoffice for 2003' end
      let :params do 
        { :version => '2003', :edition => edition, :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
      end

      it { should contain_exec('install-office').with(
        'command' => "\"\\test-server\\packages\\OFFICE11\\#{edition}\\SETUP.EXE\" /settings \"C:\\\\Windows\\\\Temp\\office_config.ini\"",
        'provider' => 'windows'
      )}
    end

    $office_versions['2003']['service_packs'].keys.each do |sp|
      build = $office_versions['2003']['service_packs'][sp]['build']
      describe "uninstalling office 2003 #{edition}" do
        let :title do 'msoffice for 2003' end
        let :params do
          { :ensure => 'absent', :version => '2003', :sp => sp, :edition => edition, :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
        end

        it { should contain_exec('uninstall-office').with(
          'command' => "& \"\\test-server\\packages\\OFFICE11\\#{edition}\\setup.exe\" /x #{product}.msi /qb",
          'provider' => 'powershell',
          'onlyif' => "if (Get-Item -LiteralPath \'\\HKLM:\\SOFTWARE\\Microsoft\\Office\\11.0\\Common\\ProductVersion\' -ErrorAction SilentlyContinue).GetValue(\'#{build}\')) { exit 1 }"
        )}
      end
    end
  end
  
  describe "installing unknown version" do
    let :title do "msoffice for unknown version" end
    let :params do 
      { :version => 'xxx', :edition => "Standard", :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
    end

    it do
      expect {
        should contain_exec('install-office')
      }.to raise_error(Puppet::Error) {|e| expect(e.to_s).to match 'The version agrument specified does not match a valid version of office' }
    end
  end
  
  describe "uninstalling unknown version" do
    let :title do "msoffice for unknown version" end
    let :params do 
      { :ensure => 'absent', :version => 'xxx', :edition => "Standard", :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
    end

    it do
      expect {
        should contain_exec('uninstall-office')
      }.to raise_error(Puppet::Error) {|e| expect(e.to_s).to match 'The version agrument specified does not match a valid version of office' }
    end
  end
  
  ['2003','2007','2010','2013'].each do |version|
    describe "installing #{version} with wrong edition" do
      let :title do "msoffice for #{version}" end
      let :params do 
        { :version => version, :edition => "fubar", :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
      end
  
      it do
        expect {
          should contain_exec('install-office')
        }.to raise_error(Puppet::Error) {|e| expect(e.to_s).to match 'The edition argument does not match a valid edition for the specified version of office' }
      end
    end
  end
  
  describe "incorrect license key" do
    let :title do "msoffice with incorrect license key" end
    let :params do 
      { :version => '2010', :edition => "Standard", :license_key => 'XXXXX-XXXXX-XXXX-XXXXX-XXXXX', :products => ['Word'] }
    end

    it do
      expect {
        should contain_exec('install-office')
      }.to raise_error(Puppet::Error) {|e| expect(e.to_s).to match 'The license_key argument speicifed is not correctly formatted' }
    end
  end
  
  describe "incorrect arch" do
    let :title do "msoffice with incorrect arch" end
    let :params do 
      { :arch => 'fubar', :version => '2010', :edition => "Standard", :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
    end

    it do
      expect {
        should contain_exec('install-office')
      }.to raise_error(Puppet::Error) {|e| expect(e.to_s).to match 'The arch argument specified does not match x86 or x64' }
    end
  end
  
  describe "incorrect ensure" do
    let :title do "msoffice with incorrect ensure" end
    let :params do 
      { :ensure => 'fubar', :version => '2010', :edition => "Standard", :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
    end

    it do
      expect {
        should contain_exec('install-office')
      }.to raise_error(Puppet::Error) {|e| expect(e.to_s).to match 'The ensure argument does not match present or absent' }
    end
  end

  $lcid_strings.keys.each do |lang_code|
    describe "valid countries" do
      let :title do "msoffice with valid countries" end
      let :params do 
        { :lang_code => lang_code, :version => '2010', :edition => "Standard", :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
      end

      it do
        expect {
          should contain_exec('install-office')
        }.to_not raise_error(Puppet::Error)
      end
    end
  end
  
  describe "invalid country" do
    let :title do "msoffice with invalid countries" end
    let :params do 
      { :lang_code => 'fubar', :version => '2010', :edition => "Standard", :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
    end

    it do
      expect {
        should contain_exec('install-office')
      }.to raise_error(Puppet::Error) {|e| expect(e.to_s).to match 'The lang_code argument does not specifiy a valid language identifier' }
    end
  end

  describe "incorrect sp" do
    let :title do "msoffice with incorrect sp" end
    let :params do
      { :sp => '5', :version => '2010', :edition => "Standard", :license_key => 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX', :products => ['Word'] }
    end

    it do
      expect {
        should contain_exec('install-office')
      }.to raise_error(Puppet::Error) {|e| expect(e.to_s).to match 'The service pack specified does not match 0-3' }
    end
  end
end