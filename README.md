<img src="django-compose.png" alt="404" width="600" height="200">

## ein Template für containerisierte Django apps ##

Für ``docker-compose`` funktioniert das Projekt out of the box, bei der Migration
zu ``podman-compose`` müssen durch die rootless pods noch einige Konfigurationen an der Servermaschine vorgenommen werden.

## ``Podman`` und ``podman-compose`` installieren:
 
    apt-get install podman
    apt-get install podman-compose

das podman-compose paket ist nur bei neuen Distros verfügbar bei älteren Distros muss es über python pip installiert werden:

    apt-get install python3-pip
    pip3 install podman-compose

Docker registries einfügen in ``/etc/containers/registries.conf``:

    unqualified-search-registries = ["docker.io"]

## Einem (nicht root) Nutzer Rechte für permanent laufende Container geben

    sudo loginctl enable-linger <USERNAME>

Eine port config für die pods erstellen:

    sudo -e /etc/sysctl.d/podman-privileged-ports.conf

und folgende Einträge für ``HTTP``, ``HTTPS`` und ``CUPS`` in diese config einfügen:

    net.ipv4.ip_unprivileged_port_start=80


Setting permanent machen:

    sudo sysctl --load /etc/sysctl.d/podman-privileged-ports.conf

Öffnen der Firewall an diesen Ports (wenn FW vorhanden):

    sudo ufw allow 80,443,631/tcp comment Podman-Containers



## wichtige Commands 

aktuellen Stand der Servermaschine prüfen:

    # zeigt alle (laufenden) container
    podman-compose container ls
    # zeigt alle gebauten images
    podman-compose image list

Das Projekt initialisieren (auf oberster Projektebene ausführen):

    # Images bauen (dauert lang)
    podman-compose build
    # container starten
    podman-compose up -d 

Nützliches:

    # container im Vordergrund starten mit auto remove
    podman-compose up && podman-compose rm -fsv
    # system bereinigen
    podman image prune
    podman container prune
    podman system prune
    # interaktives terminal in laufendem container
    podman exec -it <CONTAINERID> bash


## Development Server

Durch das Docker compose setup wir es schwieriger am Quellcode der Webapp zu arbeiten.
Deshalb hier ein kleines Tutorial für die Benutzung des Dev-server:

Zunächst python venv aufsetzen (directory egal):

    python3 -m venv <VENVNAME>
    # venv aktivieren
    source <PATHTOVENV>/bin/activate
    # requirements aus web-ordner installieren
    pip install -r requirements.txt

Django Development Server starten (aktiviertes VENV in dir WEB)

    python manage.py runserver <HOSTNAME>.local:8000

Wenn eine Datenbank/ staticfiles benötigt werden:

    python manage.py migrate
    python manage.py collectstatic

