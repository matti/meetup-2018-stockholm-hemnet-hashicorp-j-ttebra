module "goeran_greeter" {
  source = ".."
  name   = "Göran"
}

module "anna_greeter" {
  source = ".."
  name   = "Anna"
}

output "greetings" {
  value = [
    "${module.goeran_greeter.greeting}",
    "${module.anna_greeter.greeting}",
  ]
}
