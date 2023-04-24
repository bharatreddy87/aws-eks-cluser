resource "aws_eks_cluster" "eks_cluster" {
  name     = "${local.name}-${var.eks_cluster_name}"
  role_arn = aws_iam_role.eks_master_role.arn
  version = var.cluster_version

  vpc_config {
    subnet_ids = module.vpc.public_subnets
    endpoint_public_access = var.endpoint_public_access
    endpoint_private_access = var.endpoint_private_access
    public_access_cidrs = var.public_access_cidrs
  }

  kubernetes_network_config {
    service_ipv4_cidr = "172.20.0.0/16"
  }

  enabled_cluster_log_types = ["api", "authenticator", "audit", "scheduler", "controllerManager"]

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController,
  ]
}