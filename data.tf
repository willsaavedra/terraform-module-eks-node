data "aws_subnet_ids" "subnets" {
  vpc_id = var.vpc-id
  filter {
    name   = "tag:Name"
    values = var.filter_sudnets # insert values here
  }
}