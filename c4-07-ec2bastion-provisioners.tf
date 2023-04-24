resource "null_resource" "copy_ec2_key" {
  depends_on = [aws_instance.ec2_public]
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/eks-terraform-key.pem")
  }

  provisioner "file" {
    source      = "private-key/eks-terraform-key.pem"
    destination = "/home/ec2-user/eks-terraform-key.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /home/ec2-user/eks-terraform-key.pem"
    ]

  }
  provisioner "local-exec" {
    command     = "echo VPC created date `date`, and VPC ID = ${module.vpc.vpc_id} >> local-exec-output-file.txt"
    working_dir = "local-exec-output-files/"
  }

}
