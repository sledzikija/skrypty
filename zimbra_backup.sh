############################################################################3
###CRON ADD
###20 1 * * *      root    sh /root/backup.sh
###25 3 * * *      root    sh /root/backup1.sh
#############################################################################!/bin/bash
echo "Start mail backup" >> /var/log/backups_my
echo `date` >> /var/log/backups_my
set -x
katalog="/media/udzial"
udzial="//xxx/zzzz/yyyy"
umount $katalog
mount $udzial $katalog -o guest
back=`date +%d-%m-%Y`
old_back=`date +%d-%m-%Y --date '3 days ago'`
mkdir -p $katalog/$back
sudo -u zimbra /opt/zimbra/bin/zmprov -l gaa > /root/mailbox
for mail in $(cat /root/mailbox);do sudo -u zimbra /opt/zimbra/bin/zmmailbox -z -m $mail getRestURL '/?fmt=tgz' > $katalog/$back/$mail.tgz; done
echo "stop backup" >> /var/log/backups_my
echo `date` >> /var/log/backups_my
rm -r -f $katalog/$old_back
