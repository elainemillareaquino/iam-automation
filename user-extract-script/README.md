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
- Connects to Active Directory using the ActiveDirectory PowerShell module
- Retrieves user accounts from a specified Domain or Organizational Unit (OU)
- Extracts key user attributes (sAMAccountName, display name, email, department, account status, and last logon date)
- Handles errors when loading the Active Directory module or querying users
- Outputs the collected user data to a CSV report for easy analysis and documentation
- Validates the output file format to ensure it is saved as a .csv file
- Includes timestamped logging with INFO, WARNING, and ERROR levels for auditing and troubleshooting
- Automatically generates a log file alongside the CSV report for execution tracking

## How It Works
1. Script connects to the data source  
2. Retrieves user objects from the specified domain or OU
3. Selects relevant attributes  
4. Writes results to an output file  
5. Logs the operation  

## Technologies Used
- PowerShell
- CSV handling
- Basic IAM concepts (user objects, attributes, lifecycle states)

## Example Output (CSV)
sAMAccountName,DisplayName,EmailAddress,Department,Enabled,LastLogonDate
corazon.cisneros,corazon.cisneros,corazon.cisneros@mydomain.com,IT,TRUE,3/2/2026 9:14:22 AM
paul.ruane,paul.ruane,paul.ruane@mydomain.com,Finance,FALSE,2/27/2026 3:10:45 PM

## Example Log Entry
2026-03-04 22:24:09 [INFO] Script started.
2026-03-04 22:24:09 [INFO] Executed by Administrator on DC
2026-03-04 22:24:09 [INFO] Retrieving users from: OU=Sales,DC=company,DC=com
2026-03-04 22:24:10 [INFO] Report successfully exported to C:\Reports\Users.csv
2026-03-04 22:24:10 [INFO] Script finished.

## What This Demonstrates
- Ability to automate IAM data retrieval  
- Understanding of user lifecycle states  
- Clean, maintainable scripting  
- Logging and auditability  
- Familiarity with directory structures and identity attributes  

## Future Enhancements (Optional)
- Add filtering by account status or role  
- Integrate with an API (Azure AD, Okta, AWS IAM)
- Schedule as a recurring job
