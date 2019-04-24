    aws logs describe-log-groups --query 'logGroups[*].logGroupName' --output table |
    awk '{print $2}' | 
    grep -v ^$ |
    tail -n +2 | # skip table title line
    while read x; do 
        echo deleting log group $x
        aws logs delete-log-group --log-group-name $x 2>&1
    done