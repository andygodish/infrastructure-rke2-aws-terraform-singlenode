data "template_file" "init_server_userdata" {
  template = file("${path.module}/templates/init_server_userdata.sh")

  vars = {
    cp_lb_host = aws_elb.rke2_cp_elb.dns_name
    rke2_token = random_string.rke2_token.result
  }
}

resource "local_file" "ssh_config" {
  content = templatefile("${path.module}/templates/ssh_config.tpl",
    {
      init_server_ip = aws_instance.init_server[0].public_ip
      user = var.amis[var.region][var.os].user
    }
  )
  filename = "ssh_config"
}