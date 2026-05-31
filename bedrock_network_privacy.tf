# Enforcement of PrivateLink for Bedrock to prevent data exfiltration

resource "aws_vpc_endpoint" "bedrock_runtime" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.bedrock-runtime"
  vpc_endpoint_type = "Interface"

  security_group_ids = [var.security_group_id]
  subnet_ids         = var.private_subnet_ids

  private_dns_enabled = true
}
