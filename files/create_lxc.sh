CR=0
lxc-info -n $1 >/dev/null 2>&1 || (
	lxc-create -t ubuntu -n $1 > /dev/null 2>&1 ||exit 2 && \
	lxc-start -d -n $1 > /dev/null 2>&1 ||exit 3 && \
	sleep 10
	exit 1
)
CR=$?
IP=`lxc-info -n $1|awk ' ($1=="IP:") {print $NF}'`
echo "{'name':'$1','IP':'$IP'}"
exit $CR
