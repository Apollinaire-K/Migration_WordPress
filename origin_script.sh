#!/bin/bash

# Script made by : Mathis.M / Apollinaire-K
# Goal : Push wordpress files from a server to an other.

zip -r [path]/wordpress_push.zip /srv/www/wordpress # Zipping all the server into one .zip file. 
# Note : You need to change /srv/wwww/wordpress by the path to your wordpress files.

scp [path]/wordpress_push.zip [user]@[IP]:[path]/wordpress_push.zip # Use SCP protocole to send the wordpress compress filed to the other server.
# Note : You need to change the [user] and [IP]

rm [path]/wordpress_push.zip # Deleting the compresse file because we do not need him anymore and that will save more space.

echo "[Password]" | sudo -S mysqldump --add-drop-database -u root wordpress > [path]/wordpress.sql # dumping mysql to get an export and then reimport it into the other server
# Note : Don't forget to change [Password] by your password.

sed -i 's/[Ip-OriginalServer]/[IP-NewServer]/g' [path]/wordpress.sql # Modify the DataBase to change all the old IP by the new one from the new server

scp [path]/wordpress.sql [user]@[IP]:[path]/wordpress.sql # Send the extracted database to the other server.

rm [path]/wordpress.sql # Delete the extracted database after it has been copied on the other server.

ssh [user]@[IP] $(echo "[path]/script_2.sh") # Start the second script to continue on the second server.
