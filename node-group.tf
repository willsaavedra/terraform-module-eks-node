resource "aws_eks_node_group" "example" {
  cluster_name    = var.cluster-name
  node_group_name = var.node-group-name
  node_role_arn   = aws_iam_role.node-group.arn
  subnet_ids      = data.aws_subnet_ids.subnets.ids
  instance_types = var.instance_types
  capacity_type = var.capacity_type

  scaling_config {
    desired_size = 3
    max_size     = 5
    min_size     = 3
  }

  labels = var.labels

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}