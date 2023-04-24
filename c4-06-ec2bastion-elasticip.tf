resource "aws_eip" "bastion_eip" {
  depends_on = [aws_instance.ec2_public, module.vpc]
  instance   = aws_instance.ec2_public.id
  vpc        = true

  tags = local.common_tags
}
