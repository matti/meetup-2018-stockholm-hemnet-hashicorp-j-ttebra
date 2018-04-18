module "whateveryouwant" {
  source = "./mvp_module"
}

output "modulesays" {
  value = "${module.whateveryouwant.greeting}"
}
