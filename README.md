# lambda-bash-delete-cloudwatch-log-groups

It is time-consuming to delete each CloudWatch log group individually in the AWS Console. You can use this Lambda function that uses bash runtime and AWS CLI to delete all CloudWatch log groups easily.

## Usage

Deploy the CloudFormation template to create and run the function the first time. The function will remain available until you delete the CloudFormation stack. To run it after the initial time, simply create a test in the console to run the function or invoke it using the AWS CLI.

### Notes

- The function may time out depending on how many log groups you have. Run the function again to continue deleting.
