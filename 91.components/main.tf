module "components" {
  for_each = var.components
  source = "git::https://github.com/ImManiKanta/terraform-modules.git//components?ref=main"
  component = each.key
  rule_priority = each.value.rule_priority

}