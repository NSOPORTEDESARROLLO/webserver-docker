FROM		debian:stretch

MAINTAINER	cnaranjo@nsoporte.com

#Update and upgrade apt
RUN			apt-get update; apt-get -y upgrade 



#Install software
RUN			apt-get -y install apache2





#Puertos a Utilizar
EXPOSE		80/tcp



######### Create Skeel, put this at the end #######
RUN			tar -czvf /opt/config.tgz /etc/apache2/*; \
			rm -rf /etc/apache2; \
			mkdir /log /config /html; \
			mv /var/www/html/index.html /opt; \
			rm -rf /var/www/html; \
			ln -s /html /var/www/html; \
			ln -s /config /etc/apache2; \
			rm -rf /var/log/apache2; \
			ln -s /log /var/log/apache2; \ 
			chown -R www-data.www-data /log; \
			chown -R www-data.www-data /config; \
			chown -R www-data.www-data /html




#Start service
COPY		files/ns-start /usr/bin/
RUN			chmod +x /usr/bin/ns-start




ENTRYPOINT [ "/usr/bin/ns-start" ]