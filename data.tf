data "aws_subnet_ids" "subnets" {
  filter {
    name   = "tag:Name"
    values = var.filter_sudnets # insert values here
  }
}