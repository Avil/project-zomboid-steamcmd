############################################################
# Dockerfile that builds a Project Zomboid Gameserver
############################################################
FROM cm2network/steamcmd:latest
LABEL maintainer="avilcreeggan@gmail.com"

# Run Steamcmd and install Squad
RUN ./steamcmd.sh +login anonymous \
	+force_install_dir /home/steam/project-zomboid-dedicated \
	+app_update 380870 validate \
	+quit

ENV PORT=7787 QUERYPORT=27165 RCONPORT=21114 FIXEDMAXPLAYERS=80 RANDOM=NONE

VOLUME /home/steam/project-zomboid-dedicated

# Set Entrypoint; Technically 2 steps: 1. Update server, 2. Start server
ENTRYPOINT ./steamcmd.sh +login anonymous +force_install_dir /home/steam/project-zomboid-dedicated +app_update 380870 validate +quit && \
        # ./home/steam/project-zomboid-dedicated/start-server.sh -servername $SERVERNAME 
		bash
        
# Expose ports
EXPOSE 16261/udp \
	16262/tcp \
	16263/tcp \
	16264/tcp \
	16265/tcp \
	16266/tcp \
	16267/tcp \
	16268/tcp \
	16269/tcp \
	16270/tcp \
	16271/tcp \
	16272/tcp \
	27015/tcp \
	8766/udp \
	8767/udp
