Bonjour très cher client !

Aujordhui je vais vous expliquer comment installer et faire fonctionner mon projet.

1)Installer laragon et le configurer
    Se rendre sur https://github.com/leokhoa/laragon/releases/download/6.0.0/laragon-wamp.exe pour installer laragon FULL
    Ouvrir le fichier télecharger (si besoin voici la doc d'install https://laragon.org/docs/install.html)
    Après l'insatlle ouvrer laragon si ce n'est pas déja fait.
    Appuyez sur démarer puis sur Base de donnée
        2)Ajouter une nouvelle session
            Cliquer sur le bouton ajouter en bas à droit
            Puis cliquer sur ajouter une SESSION sur le dossier racine
            Nom de la session: Entrez un nom pour la session, par exemple "Laragon.MySQL".
            Config:
                Hôte: Entrez l'adresse IP ou le nom d'hôte du serveur MySQL 127.0.0.1
                Type de réseau: Sélectionnez "MariaDB or MySQL (TCP/IP)".
                Library: Laissez la valeur par défaut "libmysql.dll".
                Nom ou IP de l'hôte: Entrez l'adresse IP ou le nom d'hôte du serveur MySQL "127.0.0.1".
                Utilisateur: Entrez le nom d'utilisateur MySQL "root".
                Mot de passe: Ne mettez pas de mdp
                Port: Entrez le numéro de port du serveur MySQL "3306".
                Commentaire: Vous pouvez ajouter un commentaire facultatif pour la session si vous en avez l'envie.
            Puis cliquez sur "Ouvrir" pour ouvrir la session.
3)Installer Pycharm
    4)Télécharger PyCharm
        Allez sur le site officiel de JetBrains : www.jetbrains.com
        Cliquez sur "Télécharger" en haut à droite de la page
        Sélectionnez "PyCharm Community" et choisissez la dernière version disponible
        Téléchargez le fichier d'installation correspondant à votre système d'exploitation (Windows, macOS ou Linux)
    5)Exécuter l'installateur
        Ouvrez le fichier d'installation téléchargé
        Suivez les instructions de l'installateur pour installer PyCharm
        Acceptez les termes de la licence et choisissez l'emplacement d'installation
    6)Configurer PyCharm
        Lorsque l'installation est terminée, lancez PyCharm
        Suivez les étapes de configuration initiale pour configurer votre environnement de développement
        Choisissez le répertoire de projet par défaut et configurez les paramètres de votre choix
7)Ouverture du projet
    8)Décompresser le fichier .zip (le fichier .zip est télechargable depuis ici (https://github.com/flkdamien/DamienEXPI1A/archive/refs/heads/master.zip)
        Ouvrez le répertoire où se trouve le fichier .zip de votre projet
        Décompresser le fichier .zip en utilisant un outil de décompression comme WinZip ou 7-Zip (ou Archive Utility sur macOS)
    9)Ouvrir PyCharm
        Lancez PyCharm Community Edition
        Si vous avez déjà un projet ouvert, fermez-le en cliquant sur "File" > "Close Project"
    10)Ouvrir le projet
        Dans PyCharm, cliquez sur "File" > "Open" (ou "Ouvrir" sur macOS)
        Sélectionnez le répertoire où vous avez extrait les fichiers du projet
        Sélectionnez le répertoire racine du projet (le répertoire qui contient tous les fichiers du projet)
        Cliquez sur "OK" pour ouvrir le projet
Et voila vous avez installer le projet.
Maintenant je vais vous expliquez comment faire fonctionner le site web:
Il va falloir démarrer laragon en appuyant sur le bouton démarer
Ensuite il va falloir faire un run de run_mon_app.py
Puis dans le terminal un adresse ip va apparaite
Cliquez dessus
Et voila vous avez accès au projet
Quand vous avez fini votre utilisation vous pouvez stoper le fichier run_mon_app.py

