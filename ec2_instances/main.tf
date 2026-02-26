data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "myec2_instance" {

  count         = var.instance_count
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  tags = {
    Name = "${var.instance_name}${count.index}", owner = "skynet solution", department = "${var.department}"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [tags]
  }

}