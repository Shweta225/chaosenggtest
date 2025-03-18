# outputs.tf

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the created private subnets"
  value       = aws_subnet.private[*].id
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.main.name
}

output "eks_cluster_endpoint" {
  description = "Endpoint for the EKS cluster"
  value       = aws_eks_cluster.main.endpoint
}

output "eks_cluster_security_group_ids" {
  description = "Security group IDs attached to the EKS cluster"
  value       = [aws_security_group.eks_control_plane.id]
}

output "eks_node_security_group_id" {
  description = "Security group ID attached to the EKS worker nodes"
  value       = aws_security_group.eks_worker_nodes.id
}

output "kubeconfig_command" {
  description = "Command to update kubeconfig to connect to the EKS cluster"
  value       = "aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.main.name}"
}