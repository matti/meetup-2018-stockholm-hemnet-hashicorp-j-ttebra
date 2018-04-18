resource "local_file" "output_dummy" {
  content  = ""
  filename = "output.txt"
}

resource "null_resource" "something" {
  depends_on = ["local_file.output_dummy"]

  provisioner "local-exec" {
    command = "somecmd -that -outputs -a-token > output.txt"
  }
}

data "local_file" "output" {
  depends_on = [
    "null_resource.something",
    "local_file.output_dummy",
  ]

  filename = "output.txt"
}
resource "null_resource" "stash" {
  triggers = {
    output = "${data.local_file.output.content}"
  }

  lifecycle {
    ignore_changes = [
      "triggers",
    ]
  }
}

output "stashed_output" {
  value = "${null_resource.stash.triggers["output"]}"
}
