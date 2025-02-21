#!/bin/bash

echo "[Password]" | sudo -S rm -r /srv/www/ # Delte you're old WordPress files, Note that you will need to replace /srv/wwww/ by your actual path to thoses files

echo "[Password]" | sudo -S unzip -o [path]/wordpress_push.zip -d /srv/www/ # Extract your file into your wordpress folder ( Note that you also need to replace /srv/wwww/ by your actual path to the place you want to put wordpress)

mysql -u wordpress wordpress < [path]/wordpress.sql # Reimporting the new database by mysql

rm /home/mmivroz/Documents/wordpress_push.zip
rm /home/mmivroz/Documents/wordpress.sql # Delete the .zip and the dumbed database

echo "[password]" | sudo -S chown -R www-data /srv/www/srv/www/ # Change the owner of the file for it to be www.data (note you need to change /srv/www/srv/www by your own path)
