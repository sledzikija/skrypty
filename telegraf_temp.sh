###
###[[inputs.exec]]
###  commands = ["/etc/telegraf/skrypt/temp.sh"]
###  timeout = "5s"
###  data_format = "json"
###name_suffix = "_temp"
###

#!/bin/bash
temp0=$(cat /sys/class/thermal/thermal_zone0/temp)
temp1=$(cat /sys/class/thermal/thermal_zone1/temp)
echo '{"cpu0":'$temp0', ''"cpu1":'$temp1'}'
