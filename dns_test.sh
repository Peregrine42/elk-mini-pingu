SENSOR_ID=$(cat sensor_id)
DNS_TARGET=$1
TARGET=$2
  DATE="$(date -u "+%Y-%m-%dT%H:%M:%S")"
RESULT="$(/usr/local/opt/curl/bin/curl -s \
                                       --show-error \
                                       -m 2 \
                                       -o /dev/null \
                                       -w \"%{time_namelookup}\" \
                                       --dns-servers ${DNS_TARGET} \
                                       ${TARGET} 2>&1)"
                                       
# handle errors
HAD_ERROR=$?
if [ $HAD_ERROR -eq 0 ]; then
  ERROR_MESSAGE="no error";
else
  ERROR_MESSAGE="${RESULT}";
  RESULT=0;
fi
  
# escape message for json transmission
ERROR_MESSAGE="$(echo $ERROR_MESSAGE | sed "s/\r\n//g")"  
ERROR_MESSAGE="$(echo $ERROR_MESSAGE | sed "s/\"/'/g")"  

# create output
OUTPUT="{ \
\"sensor_id\": \"${SENSOR_ID}\", \
\"test_timestamp\": \"${DATE}\", \
\"test_result\": "${RESULT}", \
\"test_type\": \"dns_lookup\", \
\"target\": \"${TARGET}\", \
\"dns_target\": \"${DNS_TARGET}\", \
\"had_error\": \"${HAD_ERROR}\", \
\"error_message\": \"${ERROR_MESSAGE}\" \
}"

echo "${OUTPUT}"