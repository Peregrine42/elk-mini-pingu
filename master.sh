./trigger.sh $@ | curl -H "content-type: application/json" \
                    -XPOST 'http://192.168.50.4:5002/pingu/http/' \
                    -d @- && echo " trigger completed $@"