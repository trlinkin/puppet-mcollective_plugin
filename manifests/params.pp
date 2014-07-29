class mcollective_plugin::params {
  if $::is_pe {
    $libdir  = '/opt/puppet/libexec/mcollective/mcollective'
    $service = 'pe-mcollective'
  }
  else {
    $service = 'mcollective'

    case $::osfamily {
    'RedHat': {
                $libdir = '/usr/libexec/mcollective/mcollective/'
               }
    'Debian': {
                $libdir = '/usr/share/mcollective/plugins/mcollective/'
              }
    }
  }
}
