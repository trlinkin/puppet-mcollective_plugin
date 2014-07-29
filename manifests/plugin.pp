define mcollective_plugin::plugin (
  $type,
  $libdir   = $::mcollective_plugin::params::libdir,
  $ddl_only = false,
){
  if ! defined(Class['mcollective_plugin']) {
    fail('You must include the mcollective_plugin base class before using the mcollective_plugin::plugin defined resource')
  }

  validate_re($type, ['agent','validator','application', 'data', 'discovery'])

  if $type in ['data','validator'] {
    $suffix = "_${type}"
  } else {
    $suffix = ''
  }

  unless $ddl_only {
    file { "${name}_plugin":
      ensure => file,
      path   => "${libdir}/${type}/${name}${suffix}.rb",
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => "puppet:///modules/${caller_module_name}/${type}/${name}${suffix}.rb"
    }
  }

  if $type in ['validator','agent','data','discovery'] {
    file { "${name}_pluing_ddl":
      ensure => file,
      path   => "${libdir}/${type}/${name}${suffix}.ddl",
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => "puppet:///modules/${caller_module_name}/${type}/${name}${suffix}.ddl",
    }
  }
}
