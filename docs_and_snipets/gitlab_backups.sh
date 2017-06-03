# Backup full gitlab server
gitlab-rake gitlab:backup:create
sh -c 'umask 0077; cd /opt/gitlab-backups/ ; tar -cf $(date "+etc-letsencrypt-%s.tar") -C / etc/letsencrypt'
sh -c 'umask 0077; cd /opt/gitlab-backups/ ; tar -cf $(date "+etc-apache2-%s.tar") -C / etc/apache2'
sh -c 'umask 0077; cd /opt/gitlab-backups/ ; tar -cf $(date "+etc-nginx-%s.tar") -C / etc/nginx'
sh -c 'umask 0077; cd /opt/; tar -cf $(date "+etc-ssh-%s.tar") -C / etc/ssh'
sh -c 'umask 0077; cd /opt/; tar -cf $(date "+etc-gitlab-%s.tar") -C / etc/gitlab'
