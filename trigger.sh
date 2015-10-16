set -e

TARGET=$1
  DATE="$(date -u "+%Y-%m-%dT%H:%M:%S")"
RESULT="$(/usr/local/opt/curl/bin/curl -s \
                                       -o /dev/null \
                                       -w \"%{time_connect}\" \
                                       ${TARGET})"
                                       
OUTPUT="{\
\"device_id\": \"pi_1\", \
\"test_timestamp\": \"${DATE}\", \
\"test_result\": ${RESULT}, \
\"target\": \"${TARGET}\"\
}"

echo "${OUTPUT}"
