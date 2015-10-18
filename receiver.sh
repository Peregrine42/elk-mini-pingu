OUTPUT=$(/usr/local/opt/curl/bin/curl -s --show-error $1)

echo "${OUTPUT}" \
  | ./jq ".targets | @tsv" \
  | sed $'s/"//g' \
  | sed $'s/\\\\t/\\\n/g'