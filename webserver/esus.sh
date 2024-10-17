#!/bin/sh
FILE=/opt/e-SUS/webserver/standalone.sh
timedatectl set-timezone America/Recife
timedatectl set-local-rtc 1
if test -f "$FILE"; then
  systemctl daemon-reload
  systemctl disable srv-pec.service
  systemctl enable srv-pec.service
  systemctl start srv-pec.service
else
  cd /opt/esus
  yes S | java -jar eSUS-AB-PEC.jar -console -url=$ESUS_HOST -username=$ESUS_USER -password=$ESUS_PASS
fi
