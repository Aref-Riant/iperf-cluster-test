for server in `cat serverlist`; do
  ipid=`ssh $server 'iperf -s -w 2m >/dev/null & echo "$!"'`;
  echo "server: $server; iperf pid: $ipid"
  sleep 1;
  result=`iperf -c $server -t 10s -w 2m -y C`;
  echo "$server,$result" | tee -a test-from-$HOSTNAME.out ;
  ssh "$server" "kill $ipid";
done
