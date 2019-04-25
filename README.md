# lambda-bash-delete-cloudwatch-log-groups

It is time-consuming to delete each CloudWatch log group individually in the AWS Console. However, to save on storage costs and reduce clutter it is good to remove them when no longer needed. You can use this Lambda function that uses bash runtime and AWS CLI to delete all CloudWatch log groups easily.

## Usage

Deploy the CloudFormation template to create and run the function the first time. The function will remain available until you delete the CloudFormation stack. To run it after the initial time, simply create a test in the console to run the function or invoke it using the AWS CLI.

### Notes

- The function may time out depending on how many log groups you have. Run the function again to continue deleting.
- The Lambda function itself will create a Log Group. You can remove 'logs:*' permisison from the Lambda execution roles if this is undesirable
- The bash handler does not currently signal to the CloudFormation custom resource when it is complete. The bash equivalent of [cfn-response](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-lambda-function-code.html#w2ab1c21c10d177c21c17c11c15) is needed to make the stack appear complete. The function will complete despite the stack not knowing.