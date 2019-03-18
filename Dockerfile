FROM		debian:stretch

MAINTAINER	cnaranjo@nsoporte.com

#Update and upgrade apt
RUN			apt-get update; apt-get -y upgrade 



#Install software
RUN			apt-get -y install apache2





#Puertos a Utilizar
EXPOSE		80/tcp



######### Create Skeel, put this at the end #######
RUN			tar -czvf /opt/sites-enabled.tgz /etc/apache2/sites-enabled; \
			tar -czvf /opt/conf-enabled /etc/apache2/conf-enabled ; \
			tar -czvf /opt/mods-enabled.tgz /etc/apache2/mods-enabled; \
			tar -czvf /opt/log.tgz /var/log/apache2; \
			tar -czvf /opt/html.tgz /var/www/html; \
			mkdir /log /modules /sites



#Start service
COPY		files/ns-start /usr/bin/
RUN			chmod +x /usr/bin/ns-start




ENTRYPOINT [ "/usr/bin/ns-start" ]