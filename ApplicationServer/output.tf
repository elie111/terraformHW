output "app_server_id" {
  value = "${aws_instance.ApplicationServer.*.id}"
}

output "app_server_name" {
  value = "${aws_instance.app_server.*.tags.Name}"
}