data "oci_database_scheduling_plans" "database_scheduling_plans_lookup" {
  for_each = var.database_scheduling_plans_lookup

  compartment_id       = each.value.compartment_id
  display_name         = each.value.display_name
  resource_id          = each.value.resource_id
  scheduling_policy_id = each.value.scheduling_policy_id
  state                = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

