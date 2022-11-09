# Terraform AWS

## Commands

```
terraform init
terraform apply -var-file .\variables-deploy.tfvars
terraform destroy
```

## Files

| File           | Description        |
| -------------- | ------------------ |
| `outputs.tf`   | Results            |
| `providers.tf` | Providers          |
| `variables.tf` | Stack variables    |
| `versions.tf`  | Providers versions |

## References

https://github.com/thnery/terraform-aws-template
https://dev.to/thnery/create-an-aws-ecs-cluster-using-terraform-g80