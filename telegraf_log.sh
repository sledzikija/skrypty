###[[inputs.exec]]
###  commands = ["/etc/telegraf/skrypt/log.sh"]
###  timeout = "5s"
###  data_format = "json"
###  name_suffix = "_log-usr"

#!/bin/bash
user=$(who | wc -l)
echo '{"log_users":'$user'}'
