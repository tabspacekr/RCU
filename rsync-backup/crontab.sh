0 2 * * * rsync -avhr --include="*/" --include="*.jpg" --include="*.npz" --exclude="*" /home/grow/data/ awsbackup@yourdomain.com:/volume1/AWSBACKUP/ >> /root/log/aws_rsync.log
30 1 * * * find /home/grow/data/ -mtime +30 \( -name "*.jpg" -o -name "*.npz" \) -exec rm -rf {} \;
