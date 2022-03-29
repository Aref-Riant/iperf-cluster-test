for server in `cat serverlist`; do
  ecode=`ssh $server 'iperf &> /dev/null ; echo "$?"'`;
  echo "server: $server; exitcode: $ecode"
done
