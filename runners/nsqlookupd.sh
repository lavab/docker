docker run \
	-d \
	-p $(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):4160:4160 \
	-p $(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):4161:4161 \
	--name nsqlookupd \
	nsqio/nsq \
	/nsqlookupd \
	--broadcast-address=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')