#!/bin/bash
echo "Start mail backup" >> /var/log/backups_my1
echo `date` >> /var/log/backups_my1
set -x
katalog="/ccc/zzz"
udzial="//ccc/eee/ddd"
umount $katalog
mount $udzial $katalog -o user=aaa,password=ppp
back=`date +%d-%m-%Y`
old_back=`date +%d-%m-%Y --date '5 days ago'`
mkdir -p $katalog/$back
sudo -u zimbra /opt/zimbra/bin/zmprov -l gaa > /root/mailbox
for mail in $(cat /root/mailbox);do sudo -u zimbra /opt/zimbra/bin/zmmailbox -z -m $mail getRestURL '/?fmt=tgz' > $katalog/$back/$mail.tgz; done
#sudo -u zimbra /opt/zimbra/bin/zmmailbox -z -m ktos@pl getRestURL /?fmt=tgz
echo "stop backup" >> /var/log/backups_my1
echo `date` >> /var/log/backups_my1
rm -r -f $katalog/$old_back
#https://imanudin.net/2015/01/29/how-to-restore-zimbra-mailbox/
