class mcollective_plugin inherits mcollective_plugin::params(
  $mco_service = $::mcollective_plugin::params::service,
  $restart_mco = true,
){
  #haha, my hacky shit -- RAWR Collectars
  if $restart_mco {
    Mcollective_plugin::Plugin<||> {
      notify +> Service[$service],
    }
  }
}
