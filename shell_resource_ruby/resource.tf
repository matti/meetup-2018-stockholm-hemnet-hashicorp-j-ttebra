resource "null_resource" "something" {
  provisioner "local-exec" {
    command = "somecmd -that -outputs -a-token > output.txt"
  }
}

data "external" "reader" {
  program    = ["ruby", "reader.rb"]
  depends_on = ["null_resource.something"]

  query = {
    filename = "output.txt"
  }
}

resource "null_resource" "stash" {
  triggers = {
    output = "${data.external.reader.result["contents"]}"
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
