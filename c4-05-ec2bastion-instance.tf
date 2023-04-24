resource "aws_instance" "ec2_public" {
  
  ami                    = data.aws_ami.amzlinux2.id
  key_name               = var.instance_keypair
  instance_type          = var.instance_type
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]

  tags = local.common_tags
}
