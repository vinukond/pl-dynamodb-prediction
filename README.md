# Premier League DynamoDB Prediction

This project creates a DynamoDB table with Premier League teams, stores their points, and predicts the winner using Python.

## Project Overview

- **Terraform** is used to create the AWS DynamoDB table and insert team data.
- **Python (Boto3)** is used to scan the table and predict the team with the highest points.
- Designed as a hybrid **Cloud + Backend** project.

## Files

- `main.tf` — Terraform configuration to create the DynamoDB table and insert teams.
- `analyse.py` — Python script to predict the Premier League winner.
- `.gitignore` — To ignore Terraform binaries, state files, and Python cache.

## Requirements

- Python 3.10+ (Python 3.9 works but is deprecated for AWS Boto3)
- Boto3 library: `pip install boto3`
- AWS account with configured credentials: `aws configure`
- Terraform installed locally

## Usage

### Terraform

1. Initialize Terraform:
   ```bash
   terraform init
2. Apply Terraform to create the DynamoDB table:

terraform apply


Python Script

1. Run the prediction script:

python analyse.py


2. Output example:

Predicted Premier League Winner: Manchester City with 81 points

Notes

Do not commit .terraform/ or Terraform provider binaries; run terraform init to download providers locally.

You can extend this project by adding more statistics, automating predictions with AWS Lambda, or building a dashboard.
