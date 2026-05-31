### 2. `iam_policy_injector.tf`
```hcl
# Automated IAM Policy Injection for Scoped Bedrock Access

resource "aws_iam_policy" "restricted_bedrock_access" {
  name        = "BedrockScopedInferencePolicy"
  description = "Injects least-privilege boundaries for AI model invocation"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # Allow invocation only for approved models (e.g., Claude 3)
        Action   = "bedrock:InvokeModel"
        Effect   = "Allow"
        Resource = [
          "arn:aws:bedrock:${var.region}::foundation-model/anthropic.claude-3-sonnet-20240229-v1:0"
        ]
      },
      {
        # Explicit Deny for un-vetted or high-cost model fine-tuning
        Action   = [
          "bedrock:CreateProvisionedModelThroughput",
          "bedrock:CreateModelCustomizationJob"
        ]
        Effect   = "Deny"
        Resource = "*"
      }
    ]
  })
}
