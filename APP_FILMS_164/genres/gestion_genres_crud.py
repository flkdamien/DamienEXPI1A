"""Gestion des "routes" FLASK et des données pour les genres.
Fichier : gestion_genres_crud.py
Auteur : OM 2021.03.16
"""
from pathlib import Path

from flask import redirect
from flask import request
from flask import session
from flask import url_for

from APP_FILMS_164 import app
from APP_FILMS_164.database.database_tools import DBconnection
from APP_FILMS_164.erreurs.exceptions import *
from APP_FILMS_164.genres.gestion_genres_wtf_forms import FormWTFAjouterGenres
from APP_FILMS_164.genres.gestion_genres_wtf_forms import FormWTFDeleteGenre
from APP_FILMS_164.genres.gestion_genres_wtf_forms import FormWTFUpdateGenre

"""
    Auteur : OM 2021.03.16
    Définition d'une "route" /genres_afficher
    
    Test : ex : http://127.0.0.1:5575/genres_afficher
    
    Paramètres : order_by : ASC : Ascendant, DESC : Descendant
                id_genre_sel = 0 >> tous les genres.
                id_genre_sel = "n" affiche le genre dont l'id est "n"
"""


@app.route("/genres_afficher/<string:order_by>/<int:id_genre_sel>", methods=['GET', 'POST'])
def genres_afficher(order_by, id_genre_sel):
    if request.method == "GET":
        try:
            with DBconnection() as mc_afficher:
                if order_by == "ASC" and id_genre_sel == 0:
                    strsql_genres_afficher = """SELECT * FROM t_compte INNER JOIN t_type_compte ON t_type_compte.id_type_compte = t_compte.fk_type_compte ORDER BY id_compte ASC"""
                    mc_afficher.execute(strsql_genres_afficher)
                elif order_by == "ASC":
                    # C'EST LA QUE VOUS ALLEZ DEVOIR PLACER VOTRE PROPRE LOGIQUE MySql
                    # la commande MySql classique est "SELECT * FROM t_genre"
                    # Pour "lever"(raise) une erreur s'il y a des erreurs sur les noms d'attributs dans la table
                    # donc, je précise les champs à afficher
                    # Constitution d'un dictionnaire pour associer l'id du genre sélectionné avec un nom de variable
                    valeur_id_compte_selected_dictionnaire = {"value_id_compte_selected": id_genre_sel}
                    strsql_genres_afficher = """SELECT * FROM t_compte WHERE id_compte = %(value_id_genre_selected)s"""

                    mc_afficher.execute(strsql_genres_afficher, valeur_id_compte_selected_dictionnaire)
                else:
                    strsql_genres_afficher = """SELECT * FROM t_compte INNER JOIN t_type_compte ON t_type_compte.id_type_compte = t_compte.fk_type_compte ORDER BY id_compte ASC"""

                    mc_afficher.execute(strsql_genres_afficher)

                data_genres = mc_afficher.fetchall()

                print("data_genres ", data_genres, " Type : ", type(data_genres))

                # Différencier les messages si la table est vide.
                if not data_genres and id_genre_sel == 0:
                    flash("""La table "t_compte" est vide. !!""", "warning")
                elif not data_genres and id_genre_sel > 0:
                    # Si l'utilisateur change l'id_genre dans l'URL et que le genre n'existe pas,
                    flash(f"Le compte demandé n'existe pas !!", "warning")
                else:
                    # Dans tous les autres cas, c'est que la table "t_genre" est vide.
                    # OM 2020.04.09 La ligne ci-dessous permet de donner un sentiment rassurant aux utilisateurs.
                    flash(f"Données des comptes affichés !!", "success")

        except Exception as Exception_genres_afficher:
            raise ExceptionGenresAfficher(f"fichier : {Path(__file__).name}  ;  "
                                          f"{genres_afficher.__name__} ; "
                                          f"{Exception_genres_afficher}")

    # Envoie la page "HTML" au serveur.
    return render_template("genres/genres_afficher.html", data=data_genres)


"""
    Auteur : OM 2021.03.22
    Définition d'une "route" /genres_ajouter
    
    Test : ex : http://127.0.0.1:5575/genres_ajouter
    
    Paramètres : sans
    
    But : Ajouter un genre pour un film
    
    Remarque :  Dans le champ "name_genre_html" du formulaire "genres/genres_ajouter.html",
                le contrôle de la saisie s'effectue ici en Python.
                On transforme la saisie en minuscules.
                On ne doit pas accepter des valeurs vides, des valeurs avec des chiffres,
                des valeurs avec des caractères qui ne sont pas des lettres.
                Pour comprendre [A-Za-zÀ-ÖØ-öø-ÿ] il faut se reporter à la table ASCII https://www.ascii-code.com/
                Accepte le trait d'union ou l'apostrophe, et l'espace entre deux mots, mais pas plus d'une occurence.
"""


@app.route("/genres_ajouter", methods=['GET', 'POST'])
def genres_ajouter_wtf():
    form = FormWTFAjouterGenres()
    # 2024.05.19 OM Pour remplir une dropdown liste
    str_sql_type_compte = "SELECT * FROM t_type_compte"
    with DBconnection() as mybd_conn:
        mybd_conn.execute(str_sql_type_compte)
    data_type_compte = mybd_conn.fetchall()
    print("data_type_compte ", data_type_compte)
    form.comptes_dropdown_wtf.choices = [(row['id_type_compte'], row['type_compte']) for row in data_type_compte]

    if request.method == "POST":
        try:
            if form.validate_on_submit():
                name_genre_wtf = form.nom_genre_wtf.data
                name_genre = name_genre_wtf.lower()
                Mot_de_Passe = form.Mot_de_Passe_wtf.data
                Nom_type_de_Compte = form.comptes_dropdown_wtf.data
                Url_image = form.Url_image_wtf.data
                valeurs_insertion_dictionnaire = {"value_intitule_genre": name_genre,
                                                  "value_mdp": Mot_de_Passe,
                                                  "value_typecompte": Nom_type_de_Compte,
                                                  "value_url_image": Url_image
                                                  }
                print("valeurs_insertion_dictionnaire ", valeurs_insertion_dictionnaire)

                strsql_insert_genre = """INSERT INTO t_compte (id_compte,Nom_Pseudo,Mot_de_Passe,fk_type_compte, Url_Image) VALUES (NULL,%(value_intitule_genre)s,%(value_mdp)s,%(value_typecompte)s,%(value_url_image)s) """
                with DBconnection() as mconn_bd:
                    mconn_bd.execute(strsql_insert_genre, valeurs_insertion_dictionnaire)

                flash(f"Données insérées !!", "success")
                print(f"Données insérées !!")

                # Pour afficher et constater l'insertion de la valeur, on affiche en ordre inverse. (ASC)
                return redirect(url_for('genres_afficher', order_by='ASC', id_genre_sel=0))

        except Exception as Exception_genres_ajouter_wtf:
            raise ExceptionGenresAjouterWtf(f"fichier : {Path(__file__).name}  ;  "
                                            f"{genres_ajouter_wtf.__name__} ; "
                                            f"{Exception_genres_ajouter_wtf}")
    return render_template("genres/genres_ajouter_wtf.html", form=form)


"""
    Auteur : OM 2021.03.29
    Définition d'une "route" /genre_update
    
    Test : ex cliquer sur le menu "genres" puis cliquer sur le bouton "EDIT" d'un "genre"
    
    Paramètres : sans
    
    But : Editer(update) un genre qui a été sélectionné dans le formulaire "genres_afficher.html"
    
    Remarque :  Dans le champ "nom_genre_update_wtf" du formulaire "genres/genre_update_wtf.html",
                le contrôle de la saisie s'effectue ici en Python.
                On transforme la saisie en minuscules.
                On ne doit pas accepter des valeurs vides, des valeurs avec des chiffres,
                des valeurs avec des caractères qui ne sont pas des lettres.
                Pour comprendre [A-Za-zÀ-ÖØ-öø-ÿ] il faut se reporter à la table ASCII https://www.ascii-code.com/
                Accepte le trait d'union ou l'apostrophe, et l'espace entre deux mots, mais pas plus d'une occurence.
"""


@app.route("/genre_update", methods=['GET', 'POST'])
def genre_update_wtf():
    # L'utilisateur vient de cliquer sur le bouton "EDIT". Récupère la valeur de "id_genre"
    id_compte_update = request.values['id_genre_btn_edit_html']

    # Objet formulaire pour l'UPDATE
    form_update = FormWTFUpdateGenre()
    # 2024.05.19 OM Pour remplir une dropdown liste
    str_sql_type_compte = "SELECT * FROM t_type_compte"
    with DBconnection() as mybd_conn:
        mybd_conn.execute(str_sql_type_compte)
    data_type_compte = mybd_conn.fetchall()
    print("data_type_compte update ", data_type_compte)
    form_update.comptes_dropdown_update_wtf.choices = [(row['id_type_compte'], row['type_compte']) for row in data_type_compte]

    try:
        # 2023.05.14 OM S'il y a des listes déroulantes dans le formulaire
        # La validation pose quelques problèmes
        if request.method == "POST" and form_update.submit.data:
            # Récupèrer la valeur du champ depuis "genre_update_wtf.html" après avoir cliqué sur "SUBMIT".
            # Puis la convertir en lettres minuscules.
            name_pseudo_update = form_update.Nom_Pseudo_update_wtf.data
            # name_pseudo_update = name_pseudo_update.lower()
            mot_de_passe_update = form_update.Mot_de_Passe_update_wtf.data
            url_update = form_update.Url_image_update_wtf.data
            type_compte = form_update.comptes_dropdown_update_wtf.data



            valeur_update_dictionnaire = {"value_id_compte_update": id_compte_update,
                                          "value_nom_pseudo": name_pseudo_update,
                                          "value_mot_de_passe": mot_de_passe_update,
                                          "value_url": url_update,
                                          "value_type_compte": type_compte
                                          }
            print("valeur_update_dictionnaire ", valeur_update_dictionnaire)

            str_sql_update_intitulegenre = """UPDATE t_compte SET Nom_Pseudo = %(value_nom_pseudo)s, 
            Mot_de_Passe = %(value_mot_de_passe)s, Url_image = %(value_url)s, fk_type_compte = %(value_type_compte)s WHERE id_compte = %(value_id_compte_update)s """
            with DBconnection() as mconn_bd:
                mconn_bd.execute(str_sql_update_intitulegenre, valeur_update_dictionnaire)

            flash(f"Donnée mise à jour !!", "success")
            print(f"Donnée mise à jour !!")

            # afficher et constater que la donnée est mise à jour.
            # Affiche seulement la valeur modifiée, "ASC" et l'"id_compte_update"
            return redirect(url_for('genres_afficher', order_by="ASC", id_genre_sel=0))
        elif request.method == "GET":
            # Opération sur la BD pour récupérer "id_genre" et "intitule_genre" de la "t_genre"
            # str_sql_id_genre = "SELECT id_compte, Nom_Pseudo, Mot_de_Passe, Nom_type_de_Compte FROM t_compte " \
            #                    "WHERE id_compte = %(value_id_compte)s"
            str_sql_id_genre = "SELECT id_compte,Nom_Pseudo,Mot_de_passe,is_delete, fk_type_compte, id_type_compte, type_compte FROM t_compte INNER JOIN t_type_compte ON t_type_compte.id_type_compte = t_compte.fk_type_compte " \
                               "WHERE id_compte = %(value_id_compte)s"
            valeur_select_dictionnaire = {"value_id_compte": id_compte_update}
            with DBconnection() as mybd_conn:
                mybd_conn.execute(str_sql_id_genre, valeur_select_dictionnaire)
            # Une seule valeur est suffisante "fetchone()", vu qu'il n'y a qu'un seul champ "nom genre" pour l'UPDATE
            data_nom_compte = mybd_conn.fetchone()
            print("data_nom_genre ", data_nom_compte, " type ", type(data_nom_compte), " compte ",
                  data_nom_compte["id_compte"])

            # Afficher la valeur sélectionnée dans les champs du formulaire "genre_update_wtf.html"
            form_update.Nom_Pseudo_update_wtf.data = data_nom_compte["Nom_Pseudo"]
            form_update.Mot_de_Passe_update_wtf.data = data_nom_compte["Mot_de_passe"]
            form_update.comptes_dropdown_update_wtf.data = data_nom_compte["id_type_compte"]

            # form_update.comptes_dropdown_update_wtf.choices = 2
            # form_update.comptes_dropdown_update_wtf.default = 2

    except Exception as Exception_genre_update_wtf:
        raise ExceptionGenreUpdateWtf(f"fichier : {Path(__file__).name}  ;  "
                                      f"{genre_update_wtf.__name__} ; "
                                      f"{Exception_genre_update_wtf}")

    return render_template("genres/genre_update_wtf.html", form_update=form_update)


"""
    Auteur : OM 2021.04.08
    Définition d'une "route" /genre_delete
    
    Test : ex. cliquer sur le menu "genres" puis cliquer sur le bouton "DELETE" d'un "genre"
    
    Paramètres : sans
    
    But : Effacer(delete) un genre qui a été sélectionné dans le formulaire "genres_afficher.html"
    
    Remarque :  Dans le champ "nom_genre_delete_wtf" du formulaire "genres/genre_delete_wtf.html",
                le contrôle de la saisie est désactivée. On doit simplement cliquer sur "DELETE"
"""


@app.route("/genre_delete", methods=['GET', 'POST'])
def genre_delete_wtf():
    data_films_attribue_genre_delete = None
    btn_submit_del = None
    # L'utilisateur vient de cliquer sur le bouton "DELETE". Récupère la valeur de "id_genre"
    id_genre_delete = request.values['id_genre_btn_delete_html']

    # Objet formulaire pour effacer le genre sélectionné.
    form_delete = FormWTFDeleteGenre()
    try:
        print(" on submit ", form_delete.validate_on_submit())
        if request.method == "POST" and form_delete.validate_on_submit():

            if form_delete.submit_btn_annuler.data:
                return redirect(url_for("genres_afficher", order_by="ASC", id_genre_sel=0))

            if form_delete.submit_btn_conf_del.data:
                # Récupère les données afin d'afficher à nouveau
                # le formulaire "genres/genre_delete_wtf.html" lorsque le bouton "Etes-vous sur d'effacer ?" est cliqué.
                data_films_attribue_genre_delete = session['data_films_attribue_genre_delete']
                print("data_films_attribue_genre_delete ", data_films_attribue_genre_delete)

                flash(f"Voulez vous vraiment changer le statut du compte !!!", "danger")
                # L'utilisateur vient de cliquer sur le bouton de confirmation pour effacer...
                # On affiche le bouton "Effacer genre" qui va irrémédiablement EFFACER le genre
                btn_submit_del = True

            if form_delete.submit_btn_del.data:
                valeur_delete_dictionnaire = {"value_id_compte": id_genre_delete}
                print("valeur_delete_dictionnaire ", valeur_delete_dictionnaire)

                str_sql_delete_compte_statut = """UPDATE t_compte SET is_delete = 1 WHERE id_compte = %(value_id_compte)s"""
                #Je met cela en commentaire parce que je voulais garder les comptes mais juste mettre leurs statut en effacé

                #str_sql_delete_creation_compte = """DELETE FROM t_creation_compte WHERE Fk_compte_personne = %(value_id_compte)s"""
                #str_sql_delete_modification_compte = """DELETE FROM t_modification_compte WHERE Fk_compte_personne = %(value_id_compte)s"""
                #str_sql_delete_idcompte = """DELETE FROM t_compte WHERE id_compte = %(value_id_compte)s"""
                # Manière brutale d'effacer d'abord la "fk_genre", même si elle n'existe pas dans la "t_genre_film"
                # Ensuite on peut effacer le genre vu qu'il n'est plus "lié" (INNODB) dans la "t_genre_film"
                with DBconnection() as mconn_bd:
                    mconn_bd.execute(str_sql_delete_compte_statut, valeur_delete_dictionnaire)
                    #mconn_bd.execute(str_sql_delete_creation_compte, valeur_delete_dictionnaire)
                    #mconn_bd.execute(str_sql_delete_modification_compte, valeur_delete_dictionnaire)
                    #mconn_bd.execute(str_sql_delete_idcompte, valeur_delete_dictionnaire)

                flash(f"Compte définitivement effacé !!", "success")
                print(f"Compte définitivement effacé !!")

                # afficher les données
                return redirect(url_for('genres_afficher', order_by="ASC", id_genre_sel=0))

        if request.method == "GET":
            valeur_select_dictionnaire = {"value_id_compte": id_genre_delete}
            print(id_genre_delete, type(id_genre_delete))

            # Requête qui affiche tous les films_genres qui ont le genre que l'utilisateur veut effacer
            str_sql_genres_films_delete = """SELECT sup.id_supression_compte, c.Nom_pseudo, p.Prenom, p.Nom 
                                             FROM t_supression_compte AS sup
                                             INNER JOIN t_compte AS c 
                                             ON sup.FK_compte_personne = c.id_compte
                                             INNER JOIN t_personne AS p
                                             ON sup.FK_personne_compte = p.id_personne
                                             WHERE sup.FK_compte_personne = %(value_id_compte)s"""



            with DBconnection() as mydb_conn:
                mydb_conn.execute(str_sql_genres_films_delete, valeur_select_dictionnaire)
                data_films_attribue_genre_delete = mydb_conn.fetchall()
                print("data_films_attribue_genre_delete...", data_films_attribue_genre_delete)

                # Nécessaire pour mémoriser les données afin d'afficher à nouveau
                # le formulaire "genres/genre_delete_wtf.html" lorsque le bouton "Etes-vous sur d'effacer ?" est cliqué.
                session['data_films_attribue_genre_delete'] = data_films_attribue_genre_delete

                # Opération sur la BD pour récupérer "id_genre" et "intitule_genre" de la "t_genre"
                str_sql_id_genre = "SELECT id_compte, Nom_Pseudo FROM t_compte WHERE id_compte = %(value_id_compte)s"

                mydb_conn.execute(str_sql_id_genre, valeur_select_dictionnaire)
                # Une seule valeur est suffisante "fetchone()",
                # vu qu'il n'y a qu'un seul champ "nom genre" pour l'action DELETE
                data_nom_genre = mydb_conn.fetchone()
                print("data_nom_genre ", data_nom_genre, " type ", type(data_nom_genre), " genre ",
                      data_nom_genre["Nom_Pseudo"])

            # Afficher la valeur sélectionnée dans le champ du formulaire "genre_delete_wtf.html"
            form_delete.nom_genre_delete_wtf.data = data_nom_genre["Nom_Pseudo"]

            # Le bouton pour l'action "DELETE" dans le form. "genre_delete_wtf.html" est caché.
            btn_submit_del = False

    except Exception as Exception_genre_delete_wtf:
        raise ExceptionGenreDeleteWtf(f"fichier : {Path(__file__).name}  ;  "
                                      f"{genre_delete_wtf.__name__} ; "
                                      f"{Exception_genre_delete_wtf}")

    return render_template("genres/genre_delete_wtf.html",
                           form_delete=form_delete,
                           btn_submit_del=btn_submit_del,
                           data_films_associes=data_films_attribue_genre_delete)
