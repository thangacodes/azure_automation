#!/bin/bash

# Print the current date and time
echo "Script execution started at: $(date '+%Y-%m-%d %H:%M:%S')"
# Define the Terraform commands
TF_INIT="terraform init"
TF_FMT="terraform fmt"
TF_VALIDATE="terraform validate"
TF_PLAN="terraform plan"
TF_APPLY="terraform apply --auto-approve"
# Display the available commands
echo "Available Terraform operations:"
echo "1. terraform init"
echo "2. terraform fmt"
echo "3. terraform validate"
echo "4. terraform plan"
echo "5. terraform apply --auto-approve"
# Ask the user for input
read -p "Enter the number of the operation you'd like to perform: " OPERATION
# Execute the selected operation
if [ "$OPERATION" == "1" ]; then
    echo "Executing: $TF_INIT"
    $TF_INIT
elif [ "$OPERATION" == "2" ]; then
    echo "Executing: $TF_FMT"
    $TF_FMT
elif [ "$OPERATION" == "3" ]; then
    echo "Executing: $TF_VALIDATE"
    $TF_VALIDATE
elif [ "$OPERATION" == "4" ]; then
    echo "Executing: $TF_PLAN"
    $TF_PLAN
elif [ "$OPERATION" == "5" ]; then
    echo "Executing: $TF_APPLY"
    $TF_APPLY
else
    echo "Invalid input! Please enter a number between 1 and 5."
    exit 1
fi
# Print the end timestamp
echo "Script execution finished at: $(date '+%Y-%m-%d %H:%M:%S')"
