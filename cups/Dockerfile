FROM olbat/cupsd
#FROM anujdatar/cups     ### ARM platform

################################################################################
### choose the driver folder and base Image according to your server machine ###
### arm: https://hub.docker.com/r/anujdatar/cups             arm_filter      ###   
### x86: https://hub.docker.com/r/olbat/cupsd                x86_filter      ###
################################################################################

RUN apt-get install --yes --no-install-recommends ghostscript
# raspi only
# RUN apt-get install libcupsimage2

# add CAB-drivers and filters SELECT MATCHING FOLDER [x86] or [arm]
COPY ./x86/filter/* /usr/lib/cups/filter/
COPY ./x86/ppd/* /usr/share/ppd/cups-raster/cab/
COPY ./x86/ppd/* /usr/share/ppd/cupsfilters/

# add custom configs 
COPY ./cupsd.conf /etc/cups/
# COPY ./printers.conf /etc/cups/

# setting the permissions right
RUN chmod -R 755 /etc/cups
RUN chmod -R 755 /usr/share/ppd
RUN chmod -R 755 /usr/lib/cups/filter
