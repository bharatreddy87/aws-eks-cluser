output "ami" {
  description = "ami"
  value       = aws_instance.ec2_public.ami
}

output "arn" {
  description = "arn"
  value       = aws_instance.ec2_public.arn
}

output "instance_public_id" {
  description = "id"
  value       = aws_instance.ec2_public.id
}

output "instance_eip" {
  description = "value"
  value       = aws_instance.ec2_public.public_ip

}
