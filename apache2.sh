#!/bin/bash
#Tankibaj
#https://github.com/tankibaj

echo ""
echo ""
echo "What do you want to do?"
echo "	1) Install Apache2 php5 MySQL phpmyadmin"
echo "	2) Install Apache2"
echo "	3) Restart Apache2"
echo "	4) Take apache ownership"
echo "	5) Uninstall Apache2"
echo "	6) Uninstall apache2 php mysql phpmyadmin"
echo " 	7) Exit"
echo""
echo""

read -p "Select an option [1-7]: " option

	case $option in


		1) ##########################################################################
			echo ""
			echo "################### Checking Update and Upgrade ###################"
			echo ""
			apt-get update
			apt-get upgrade -y
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Installing apache2 ###################"
			echo ""
			apt-get install apache2 -y
			chown -R www-data:www-data /var/www/html/
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Installing MySQL 5 ###################"
			echo ""
			apt-get install mysql-server mysql-client -y
			/etc/init.d/apache2 restart
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Installing PHP5 ###################"
			echo ""
			apt-get install php5 libapache2-mod-php5 -y

			# Creating info.php file
			touch /var/www/html/info.php
			echo "<?php" >> /var/www/html/info.php
			echo "phpinfo();" >> /var/www/html/info.php
			echo "?>" >> /var/www/html/info.php
			
			# Restart apache2
			/etc/init.d/apache2 restart
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Getting MySQL Support In PHP5 ###################"
			echo ""
			apt-cache search php5
			apt-get install php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl -y
			/etc/init.d/apache2 restart
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Installing APC to speed up your PHP page ###################"
			echo ""
			apt-get install php-apc -y
			/etc/init.d/apache2 restart
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Installing phpMyAdmin ###################"
			echo ""
			apt-get install phpmyadmin -y
			/etc/init.d/apache2 restart
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Finding Server Public IP ###################"
			echo ""
			PIP=`wget -q -O - http://api.ipify.org`
			echo "Done..."

			#
			echo ""
			echo ""
			echo ""
			echo ""
			echo "######################################################################"
			echo "	Congrats... your webserver php5 mysql phpmyadmin are ready :)"
			echo "######################################################################"
			echo ""
			echo "		Your WebServer Public IP: $PIP"
			echo "		php info: $PIP/info.php"
			echo "		phpmyadmin: $PIP/phpmyadmin"
			echo ""
			echo "######################################################################"
			echo ""
			echo ""
			echo ""
			echo ""
		exit;;

		
		2) ##########################################################################
			# Installing apache2 only
			echo ""
			echo "################### Checking Update and Upgrade ###################"
			echo ""
			apt-get update
			apt-get upgrade -y
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Installing apache2 ###################"
			echo ""
			apt-get install apache2 -y
			chown -R www-data:www-data /var/www/html/
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Finding Server Public IP ###################"
			echo ""
			PIP=`wget -q -O - http://api.ipify.org`
			echo "Done..."

			#
			echo ""
			echo ""
			echo ""
			echo ""
			echo "###########################################################"
			echo "	Congrats... your webserver is ready :)"
			echo "###########################################################"
			echo "		Your Webserver Public IP: $PIP"
			echo "###########################################################"
			echo ""
			echo ""
			echo ""
			echo ""
		exit;;

		
		3) ##########################################################################
			#
			echo ""
			echo "################### Restarting Apache2 ###################"
			echo ""
			/etc/init.d/apache2 restart
			echo ""
			echo "Done..."
			echo ""
		exit;;


		4) ##########################################################################
			# www-data is user of apache this important for webserver
			echo ""
			echo "################### Taking ownership of /var/www/html/ ###################"
			chown -R www-data:www-data /var/www/html/
			echo ""
			echo "Done..."
			echo "Done....."
			echo ""
		exit;;


		5) ##########################################################################
			#
			echo ""
			echo "################### Uninstalling Apache2 ###################"
			echo ""
			apt-get remove apache2
			apt-get purge apache2
			echo ""
			echo "Done..."
			echo ""
		exit;;

		
		6) ##########################################################################
			#
			echo ""
			echo "################### Uninstalling Apache2 ###################"
			echo ""
			apt-get remove apache2 mysql-server mysql-client php5 libapache2-mod-php5
			apt-get purge apache2 mysql-server mysql-client php5 libapache2-mod-php5
			echo ""
			echo "Done..."
			echo ""
		exit;;



		7) ##########################################################################
		exit;;

	esac

	exit