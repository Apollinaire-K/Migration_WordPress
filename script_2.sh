#!/bin/bash

echo "I_Love_Blondie" | sudo -S rm -r /srv/www/

echo "Starting Unzipping file .zip"
echo "I_Love_Blondie" | sudo -S unzip -o /home/mmivroz/Documents/wordpress_push.zip -d /srv/www/
echo "Finisehd Unzipping .zip File"

echo "Starting Importing new DataBases"
mysql -u wordpress wordpress < /home/mmivroz/Documents/wordpress.sql
echo "Finished Importing DataBases"

echo "Deleting Useless Files"
rm /home/mmivroz/Documents/wordpress_push.zip
rm /home/mmivroz/Documents/wordpress.sql
echo "Deleted all Useless Files"

echo "I_Love_Blondie" | sudo -S chown -R www-data /srv/www/srv/www/
