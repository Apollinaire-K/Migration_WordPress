## **Projet :** WordPress Migration
**Made by :** *Apllinaire-K* / Mathis.M\
**Coded into :** Bash\
**Material :**  \
**N/A** \

This is a simple basic projet for migrating word press beetwen 2 machine (It has been made for Ubuntu)

**Image of the project :**  
**N/A**

## **How to use the script :**
First if you want to use this script you need to allready have some added dependencie on your linux, you will so need to run this code to importe the following at least once.
<pre>
 $ sudo apt install apache2 \
                    ghostscript \
                    libapache2-mod-php \
                    mysql-server \
                    php \
                    php-bcmath \
                    php-curl \
                    php-imagick \
                    php-intl \
                    php-json \
                    php-mbstring \
                    php-mysql \
                    php-xml \
                    php-zip \
                    zip \
                    ssh
</pre> 
Then after that you are gonna need to put the file named script_2 into the other Server and the origin_script into the server that have the wordpress you want to migrate. \
After that you can see in both script there is part like that : 
<pre>
 $ echo "[Password]" | sudo -S mysqldump --add-drop-database -u root wordpress > [path]/wordpress.sql
</pre>
In that exemple you need to replace [Password] bye your own one, same for [path]. Do not forget to put the rigth one else it will not work. \
After that the rest is as simple as to lauch the script and let it do it itself.
## **SSH Key : How to set it up**
For this script to work at best you will need to set up SSH key between you 2 server so here is a quick tutorial on how to do so. \
First you are gonna need to go in you console and be sure you have the SSH dependency (in all case it is needed for the script) you can still add it by doing the following command (note that it is included in the cmd just above).
<pre>
  sudo apt install ssh
</pre>
After that you finnaly got ssh installed you are gonna need to make a key to share with the other server to make it simple, so for that you are gonna need to use the following command : \
<pre>
  $ ssh-keygen
</pre>
After for the rest you can just skip it and say yes if needed for what we are doing here but i still suggestest that you look into it before all if you have anything important on you server using ssh. \
Now after you get you're new key (or if you are still using an old one) you are going to need to give it to the server by using the following  cmd : \
<pre>
 $ ssh-copy-id [user]@[IP]
</pre>
As you change [user] by the username that the permision on the other computer and also change [IP] to the good IP of your other server.
Once that is done you good to go and you try if everything work by just doing the next command as an exemple :
<pre>
  $ssh usertest@10.10.231.111 echo "Hello Word"
</pre>
And after that if everything work you are ready to migrate your Wordpress to an other server.
