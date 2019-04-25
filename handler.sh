function handler () {
    set -e

    # Event Data is sent as the first parameter
    EVENT_DATA=$1

    # Example of command usage
    EVENT_JSON=$(echo $EVENT_DATA | jq .)

    aws logs describe-log-groups --query 'logGroups[*].logGroupName' --output table |
    awk '{print $2}' | 
    grep -v ^$ |
    tail -n +2 | # skip table title line
    while read x; do 
        echo deleting log group $x
        aws logs delete-log-group --log-group-name $x 2>&1
    done

    # This is the return value because it's being sent to stderr (>&2)
    echo "{\"success\": true}" >&2
}