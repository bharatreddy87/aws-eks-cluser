locals {
  owners      = var.business_division
  environment = var.Environment

  #name = "${locals.owner}-${locals.environment}"
  name = "${var.business_division}-${var.Environment}"

  common_tags = {
    owners      = local.owners
    environment = local.environment
  }

  eks_cluster_name = "${local.name}-${var.eks_cluster_name}"
}
