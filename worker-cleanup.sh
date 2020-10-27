#!/usr/bin/expect

## Parameters

set deployment [lindex $argv 0]
set vms "[exec bash -c "bosh vms -d $deployment | grep worker | awk '{print \$1}'"]"
set command "docker rmi \$(docker images -a -q) || true"
set command1 "df -h /var/vcap/store"

## Commands
foreach vm $vms {
  spawn bosh -d $deployment ssh $vm
  expect "\$ " {send "sudo su -\r"}
  expect "\# " {send "$command1;\r"}
  expect "\# " {send "$command;\r"}
  expect "\# " {send "$command1;\r"}
  expect "\# " {send "exit;\r"}
  expect "\$ " {send "exit;\r"}
}
