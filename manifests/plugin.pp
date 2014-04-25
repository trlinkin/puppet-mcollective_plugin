class mcollective_plugin::plugin (
  $type,
  $libdir = $::mcollective_plugin::params::libdir,
){
  if ! defined(Class['mcollective_plugin']) {
    fail('You must include the mcollective_plugin base class before using the mcollective_plugin::plugin defined resource')
  }

  validate_re($type, ['agent','validator','application', 'data', 'discovery'])

  file { "${name}_plugin":
    ensure => file,
    path   => "${libdir}/${type}/${name}.rb",
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => "puppet:///modules/${caller_module_name}/${type}/${name}.rb"
  }

  if $type in ['validator','agent','data','discovery'] {
    file { "${name}_pluing_ddl":
      ensure => file,
      path   => "${libdir}/${type}/${name}.ddl",
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      source => "puppet:///modules/${caller_module_name}/${type}/${name}.ddl",
    }
  }
}
