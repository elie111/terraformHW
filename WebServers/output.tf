output "web_server_id" {
  value = "${aws_instance.web_server.*.id}"
}

output "web_server_name" {
  value = "${aws_instance.web_server.*.tags.Name}"
}