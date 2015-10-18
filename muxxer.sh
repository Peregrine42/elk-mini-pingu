for target in $(./receiver.sh $2); do
  arguments=`echo $target | sed "s/|/ /g"`
  ./sender.sh $1 $arguments &
done

wait