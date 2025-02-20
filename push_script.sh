#!/bin/bash

# Script fait par Mathis MIVROZ
# Goal : Push wordpress files from a server to an other.

echo "Starting to zip wordpress files into a .zip"
zip -r /home/mmivroz/Documents/wordpress_push.zip /srv/www/wordpress
echo "Finished zipping wordpress files into a .zip"

echo "Start sending zip file from Server A to Server B"
scp /home/mmivroz/Documents/wordpress_push.zip mmivroz@10.10.231.109:/home/mmivroz/Documents/wordpress_push.zip
echo "Finished sending zip file from Server A to Server B"

echo "Starting to Delete .zip File"
rm /home/mmivroz/Documents/wordpress_push.zip
echo "Finished Deleting of the .zip file"

echo "Starting Export of mySQL DataBases"
echo "I_Love_Blondie" | sudo -S mysqldump --add-drop-database -u root wordpress > /home/mmivroz/Documents/wordpress.sql
echo "Finished the Exporting of mySQL DataBases"

echo "Changing all IP of Server A with the one of Server B"
sed -i 's/10.10.231.141/10.10.231.109/g' /home/mmivroz/Documents/wordpress.sql
echo "Changed all IP of Server A with the one of Server B"

echo "Starting sending DataBases files"
scp /home/mmivroz/Documents/wordpress.sql mmivroz@10.10.231.109:/home/mmivroz/Documents/wordpress.sql
echo "Finished a sending data base files"

echo "Starting Deleting DataBases Files"
rm /home/mmivroz/Documents/wordpress.sql
echo "Finished Deleting DataBases Files"

echo "Start of the second script"
ssh mmivroz@10.10.231.109 $(echo "/home/mmivroz/Documents/script_2.sh")
