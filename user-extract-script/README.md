# User Extraction Script

## Overview
This project automates the extraction of user account information from active directory. It demonstrates scripting skills, IAM data handling, and the ability to generate clean, auditable outputs for reporting or downstream automation.

## Problem This Solves
Organizations often need up-to-date user lists for:
- Access reviews
- Compliance reporting
- Onboarding/offboarding audits
- Identifying stale or inactive accounts

Manual extraction is slow and inconsistent. This script automates the process to ensure accuracy and repeatability.

## Features
- Connects to active directory
- Extracts user attributes (name, email, department, status, etc.)
- Outputs results to CSV
- Includes timestamped logs for auditing
- Supports filtering (e.g., active users only)

## How It Works
1. Script connects to the data source  
2. Retrieves user objects  
3. Selects relevant attributes  
4. Writes results to an output file  
5. Logs the operation  

## Technologies Used
- PowerShell
- CSV handling
- Basic IAM concepts (user objects, attributes, lifecycle states)

## Example Output (CSV)
displayName,email,department,status
Elaine Reyes,elaine@example.com,IT,Active
John Cruz,john@example.com,Finance,Inactive

## Example Log Entry
[2024-02-14 11:05] Extracted 152 active users. Output saved to users_2024-02-14.csv


## What This Demonstrates
- Ability to automate IAM data retrieval  
- Understanding of user lifecycle states  
- Clean, maintainable scripting  
- Logging and auditability  
- Familiarity with directory structures and identity attributes  

## Future Enhancements (Optional)
- Add filtering by department or role  
- Integrate with an API (Azure AD, Okta, AWS IAM)  
- Add inactive user detection  
- Schedule as a recurring job
