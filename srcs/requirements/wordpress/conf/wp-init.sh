sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
sleep 10
wp core download --path=/var/www/ --allow-root

cat /var/www/wp-config-sample.php >  /var/www/wp-config.php

wp config set DB_NAME $DB_NAME --path=/var/www/ --allow-root
wp config set DB_USER $DB_USER --path=/var/www/ --allow-root
wp config set DB_PASSWORD $USER_PASS --path=/var/www/ --allow-root
wp config set DB_HOST $DB_HOST --path=/var/www/ --allow-root


wp core install --path=/var/www/ --url=$DOMAIN --title=inception --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root

wp user create --path=/var/www/ $USER_NAME $USER_EMAIL --user_pass=$USER_PASS --role=$USER_ROLE --allow-root

php-fpm7.4 -F