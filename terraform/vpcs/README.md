# Terraform SCCM Infrastructure Build

## Requirements

### Authentication

1. saml2aws must be run prior to running these commands. You will need to authenticate with the appropriate account.
2. The plan and apply commands will prompt for your aws profile. This is whatever you authenticated with in step 1 above.

### Terraform specific

1. Must be running Terraform 0.12 or greater
    https://www.terraform.io/downloads.html
2. Must run from AWS Workspace
3. The statefile will live in the account you are intending to work in. This bucket MUST exist prior to first run.

## Commands

### Initialize

Run the initilize command

```bash
terraform init -backend-config=calpoly-moayala.backend.tfvars
```

### Plan

Run the plan to command to see what will be changed

```bash
terraform plan -var-file=variables.tf
```

### Apply

If you are satisfied with the changes, run the apply command

```bash
terraform apply -var-file=variables.tf
```