<img src="cups.png" width="150" height="150"> 

## An example printer server ##
This is an example of how to integrate a CUPS printer setup as a containerized service into a docker project.
The example is given for ``cabsquix4600m`` datamatrix printers.


    # cab CUPS Linux Driver, Version 1.45
    #
    # Copyright (c) 2004-2022 by cab Produkttechnik GmbH, Germany
    #
    # Licensed under Apache License v2.0.  See the file "LICENSE" for more
    # information.


    Introduction
    -------------------------------------------------------------------------------

    A LINUX system supports different kinds of printing systems. One of those is
    called CUPS (Common Unix Printing System) which is supported by this printer
    driver. The printing system covers interfaces like USB, parallel port and
    ethernet. To enable the CUPS printing system to work with cab printers, it
    needs additional information about the capabilities of the printers and a way
    to provide them with the correct data stream:

    * A set of PPD (Postscript Printer Description) files define the options
        of the cab printers.
        Each PPD file describes a type of printer with its properties and
        capabilities, like caba3200.ppd describes a A-Series A3/200 or cabm4300.ppd
        a M-Series M4/300. Options are e.g. resolution, heat level, cutter mode etc.
        The PPDs are localized in the following languages: English, German, French,
        Spanish, Italian Danish and Simplified Chinese.

    * A binary filter module to convert the printing data into a format known by
        the cab printers.
        It converts the output of CUPS (raster data) into the cab specific
        printer language.


    System requirements
    -------------------------------------------------------------------------------
    CUPS 1.2 or later


    Installation
    -------------------------------------------------------------------------------

    Before starting with the installation, make shure CUPS is installed and
    running. A simple test is to point your browser to http://localhost:631. If you
    get the CUPS Administration webinterface, it is up and running. If not, first
    install and/or start the cups daemon.

    To install the cab CUPS printer driver do the following (you likely must be
    logged in as root user):

    1. If an older cab CUPS printer driver is installed, it is recommended to
        remove its files first. This includes the filter module 'rastertocab', the
        PPD files and any installed cab CUPS printer.

    2. From the package's content, copy the filter module to the CUPS filter
        directory, e.g.:
        cp rastertocab /usr/lib/cups/filter/rastertocab
        chmod 755 /usr/lib/cups/filter/rastertocab

        Depending on your system, the filter directory might be e.g.
        /usr/lib32/cups/filter or /usr/lib64/cups/filter.
        If cups-config is installed, you might try 'cups-config --serverbin',
        otherwise, look for other filters named "rastertoXXX".

    3. Copy the PPD files to a cab subdirectory within the CUPS PPD
        directory, e.g.:
        install -m 755 -v -d /usr/share/ppd/cups-raster/cab
        cp ppd/*.ppd /usr/share/ppd/cups-raster/cab/


    Adding/Removing printers
    -------------------------------------------------------------------------------
    The simplest way to administrate your printers is to use the web interface at
    http://localhost:631.


    List of PPDs and its printer types
    -------------------------------------------------------------------------------

    cab A-Series Printers

    caba3200.ppd        cab A3/200
    caba3300.ppd        cab A3/300
    caba3230.ppd        cab A3-2/300
    caba4300.ppd        cab A4/300
    caba4600.ppd        cab A4/600
    caba6300.ppd        cab A6/300
    caba8300.ppd        cab A8/300

    cab M-Series Printer

    cabm4200.ppd        cab M4/200
    cabm4300.ppd        cab M4/300

    cab A4+-Series Printer

    caba2p3.ppd         cab A2+/300
    caba2p3k.ppd        cab A2+/300K
    caba2p6.ppd         cab A2+/600
    caba4p2.ppd         cab A4+/200
    caba4p2k.ppd        cab A4+/200K
    caba4p3.ppd         cab A4+/300
    caba4p3k.ppd        cab A4+/300K
    caba4p6.ppd         cab A4+/600
    caba4p6k.ppd        cab A4+/600K
    caba6p2.ppd         cab A6+/200
    caba6p3.ppd         cab A6+/300
    caba8p3.ppd         cab A8+/300

    cab A4.3+-Series Printer

    caba43p2.ppd        cab A4.3+/200
    caba43p3.ppd        cab A4.3+/300

    cab A4+M-Series Printer

    caba4pm3.ppd        cab A4+M/300
    caba4pm6.ppd        cab A4+M/600

    cab Mach4-Series Printer

    cabma4200.ppd       cab Mach4/200
    cabma4300.ppd       cab Mach4/300
    cabma4600.ppd       cab Mach4/600

    cab Hermes Series

    cabha2l3.ppd        cab Hermes A2L/300
    cabha2r3.ppd        cab Hermes A2R/300
    cabha2l6.ppd        cab Hermes A2L/600
    cabha2r6.ppd        cab Hermes A2R/600
    cabha4l3.ppd        cab Hermes A4L/300
    cabha4r3.ppd        cab Hermes A4R/300
    cabha4l6.ppd        cab Hermes A4L/600
    cabha4r6.ppd        cab Hermes A4R/600
    cabha5l3.ppd        cab Hermes A5L/300
    cabha5r3.ppd        cab Hermes A5R/300
    cabha5l6.ppd        cab Hermes A5L/600
    cabha5r6.ppd        cab Hermes A5R/600

    cab Hermes+ Series

    cabhp2r3.ppd        cab Hermes+ 2R/300
    cabhp2l3.ppd        cab Hermes+ 2L/300
    cabhp2r6.ppd        cab Hermes+ 2R/600
    cabhp2l6.ppd        cab Hermes+ 2L/600
    cabhp4r2.ppd        cab Hermes+ 4R/200
    cabhp4l2.ppd        cab Hermes+ 4L/200
    cabhp4r3.ppd        cab Hermes+ 4R/300
    cabhp4l3.ppd        cab Hermes+ 4L/300
    cabhp4r6.ppd        cab Hermes+ 4R/600
    cabhp4l6.ppd        cab Hermes+ 4L/600
    cabhp43r2.ppd       cab Hermes+ 4.3R/200
    cabhp43l2.ppd       cab Hermes+ 4.3L/200
    cabhp43r3.ppd       cab Hermes+ 4.3R/300
    cabhp43l3.ppd       cab Hermes+ 4.3L/300
    cabhp6r2.ppd        cab Hermes+ 6R/200
    cabhp6l2.ppd        cab Hermes+ 6L/200
    cabhp6r3.ppd        cab Hermes+ 6R/300
    cabhp6l3.ppd        cab Hermes+ 6L/300

    cab PX Modules

    cabpx4l2.ppd        cab PX4L/200
    cabpx4r2.ppd        cab PX4R/200
    cabpx4l3.ppd        cab PX4L/300
    cabpx4r3.ppd        cab PX4R/300
    cabpx4l6.ppd        cab PX4L/600
    cabpx4r6.ppd        cab PX4R/600
    cabpx43l2.ppd       cab PX4.3L/200
    cabpx43r2.ppd       cab PX4.3R/200
    cabpx43l3.ppd       cab PX4.3L/300
    cabpx43r3.ppd       cab PX4.3R/300
    cabpx6l2.ppd        cab PX6L/200
    cabpx6r2.ppd        cab PX6R/200
    cabpx6l3.ppd        cab PX6L/300
    cabpx6r3.ppd        cab PX6R/300

    cab EOS-Series Printer

    cabeos1200.ppd      cab EOS1/200
    cabeos1300.ppd      cab EOS1/300
    cabeos4200.ppd      cab EOS4/200
    cabeos4300.ppd      cab EOS4/300
    cabeos2200.ppd      cab EOS2/200
    cabeos2300.ppd      cab EOS2/300
    cabeos5200.ppd      cab EOS5/200
    cabeos5300.ppd      cab EOS5/300


    cab SQUIX-Series Printer

    cabsquix2300.ppd    cab_SQUIX 2/300
    cabsquix2300p.ppd   cab_SQUIX 2/300P
    cabsquix2600.ppd    cab_SQUIX 2 600
    cabsquix2600p.ppd   cab_SQUIX 2 600P
    cabsquix4300.ppd    cab SQUIX 4/300
    cabsquix4300p.ppd   cab SQUIX 4/300P
    cabsquix4300m.ppd   cab SQUIX 4/300M
    cabsquix4300mp.ppd  cab SQUIX 4/300MP
    cabsquix4300mt.ppd  cab SQUIX 4/300MT
    cabsquix4600.ppd    cab SQUIX 4/600
    cabsquix4600p.ppd   cab SQUIX 4/600P
    cabsquix4600m.ppd   cab SQUIX 4/600M
    cabsquix4600mp.ppd  cab SQUIX 4/600MP
    cabsquix4600mt.ppd  cab SQUIX 4/600MT
    cabsquix4p200.ppd   cab SQUIX 4.3/200
    cabsquix4p200p.ppd  cab SQUIX 4.3/200P
    cabsquix4p200m.ppd  cab SQUIX 4.3/200M
    cabsquix4p200mp.ppd cab SQUIX 4.3/200MP
    cabsquix4p200mt.ppd cab SQUIX 4.3/200MT
    cabsquix4p200r.ppd  cab SQUIX 4.3/200R
    cabsquix4p300.ppd   cab SQUIX 4.3/300
    cabsquix4p300p.ppd  cab SQUIX 4.3/300P
    cabsquix4p300m.ppd  cab SQUIX 4.3/300M
    cabsquix4p300mp.ppd cab SQUIX 4.3/300MP
    cabsquix4p300mt.ppd cab SQUIX 4.3/300MT
    cabsquix4p300r.ppd  cab SQUIX 4.3/300R
    cabsquix6p200.ppd   cab SQUIX 6.3/200
    cabsquix6p200p.ppd  cab SQUIX 6.3/200P
    cabsquix6p300.ppd   cab SQUIX 6.3/300
    cabsquix6p300p.ppd  cab SQUIX 6.3/300P

    cab MACH 4S-Series Printer

    cabmach4s300.ppd    cab MACH 4S/300
    cabmach4s600.ppd    cab MACH 4S/600
    cabmach4sp200.ppd   cab MACH 4.3S/200
    cabmach4sp300.ppd   cab MACH 4.3S/300

    cab Hermes Q Series

    cabhq2l3.ppd        cab Hermes Q2L/300
    cabhq2l6.ppd        cab HERMES Q2L/600
    cabhq2r3.ppd        cab HERMES Q2R/300
    cabhq2r6.ppd        cab HERMES Q2R/600
    cabhq43l2.ppd       cab HERMES Q4.3L/300
    cabhq43l3.ppd       cab HERMES Q4.3L/300
    cabhq43r2.ppd       cab HERMES Q4.3R/200
    cabhq43r3.ppd       cab HERMES Q4.3R/300
    cabhq4l3.ppd        cab HERMES Q4L/300
    cabhq4l6.ppd        cab HERMES Q4L/600
    cabhq4r3.ppd        cab HERMES Q4R/300
    cabhq4r6.ppd        cab HERMES Q4R/600
    cabhq63l2.ppd       cab HERMES Q6.3L/200
    cabhq63l3.ppd       cab HERMES Q6.3L/300
    cabhq63r2.ppd       cab HERMES Q6.3R/200
    cabhq63r3.ppd       cab HERMES Q6.3R/300

    cab PX Q Modules

    cabpxq4l3.ppd       cab PX Q4L/300
    cabpxq4r3.ppd       cab PX Q4R/300
    cabpxq4l6.ppd       cab PX Q4L/600
    cabpxq4r6.ppd       cab PX Q4R/600
    cabpxq43l2.ppd      cab PX Q4.3L/200
    cabpxq43r2.ppd      cab PX Q4.3R/200
    cabpxq43l3.ppd      cab PX Q4.3L/300
    cabpxq43r3.ppd      cab PX Q4.3R/300
    cabpxq6l2.ppd       cab PX Q6L/200
    cabpxq6r2.ppd       cab PX Q6R/200
    cabpxq6l3.ppd       cab PX Q6L/300
    cabpxq6r3.ppd       cab PX Q6R/300

    cab AXON Series

    cabaxon113.ppd      cab AXON 1.1/300
    cabaxon116.ppd      cab AXON 1.1/600
    cabaxon123.ppd      cab AXON 1.2/300
    cabaxon126.ppd      cab AXON 1.2/600

    cab XC Series

    cabxc43.ppd         cab XC4/300
    cabxc63.ppd         cab XC6/300
