class mcollective_plugin(
  $mco_service = $::mcollective_plugin::params::service,
  $restart_mco = true,
)inherits mcollective_plugin::params {
  #haha, my hacky shit -- RAWR Collectars
  if $restart_mco {
    Mcollective_plugin::Plugin<||> {
      notify +> Service[$service],
    }
  }
}
