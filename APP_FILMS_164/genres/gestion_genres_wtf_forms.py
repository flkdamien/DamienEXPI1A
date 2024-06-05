"""
    Fichier : gestion_genres_wtf_forms.py
    Auteur : OM 2021.03.22
    Gestion des formulaires avec WTF
"""
from flask_wtf import FlaskForm
from wtforms import StringField, DateField
from wtforms import SubmitField
from wtforms import SelectField
from wtforms.validators import Length, InputRequired, DataRequired
from wtforms.validators import Regexp


class FormWTFAjouterGenres(FlaskForm):
    """
        Dans le formulaire "genres_ajouter_wtf.html" on impose que le champ soit rempli.
        Définition d'un "bouton" submit avec un libellé personnalisé.
    """
    nom_genre_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    nom_genre_wtf = StringField("Nom/Pseudo ", validators=[Length(min=2, max=20, message="min 2 max 20"),
                                                                   Regexp(nom_genre_regexp,
                                                                          message="Pas de chiffres, de caractères "
                                                                                  "spéciaux, "
                                                                                  "d'espace à double, de double "
                                                                                  "apostrophe, de double trait union")
                                                                   ])

    Mot_de_Passe_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    Mot_de_Passe_wtf = StringField("Mot de Passe ", validators=[Length(min=2, max=20, message="min 2 max 20"),
                                                    Regexp(Mot_de_Passe_regexp,
                                                           message="Pas de chiffres, de caractères "
                                                                   "spéciaux, "
                                                                   "d'espace à double, de double "
                                                                   "apostrophe, de double trait union")
                                                    ])
    Url_image_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    Url_image_wtf = StringField("Url de la photo de profil ", validators=[Length(min=2, max=9000, message="min 2 max 20"),

                                                                ])
    comptes_dropdown_wtf = SelectField("Type de compte",
                                    validators=[DataRequired(message="Sélectionner un type")],
                                    coerce = int,
                                    validate_choice=False
                                    )
    # Nom_type_de_Compte_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    # Nom_type_de_Compte_wtf = StringField("Type de Compte (Admin or User) ", validators=[Length(min=2, max=20, message="Veuillez Selectionner un type de compte !!!"),
    #
    #                                                             ])
    submit = SubmitField("Enregistrer le compte")


class FormWTFUpdateGenre(FlaskForm):
    """
        Dans le formulaire "genre_update_wtf.html" on impose que le champ soit rempli.
        Définition d'un "bouton" submit avec un libellé personnalisé.
    """
    Nom_Pseudo_update_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    Nom_Pseudo_update_wtf = StringField("Nom/Pseudo ", validators=[Length(min=2, max=20, message="min 2 max 20"),
                                                                          Regexp(Nom_Pseudo_update_regexp,
                                                                                 message="Pas de chiffres, de "
                                                                                         "caractères "
                                                                                         "spéciaux, "
                                                                                         "d'espace à double, de double "
                                                                                         "apostrophe, de double trait "
                                                                                         "union")
                                                                          ])
    Mot_de_Passe_update_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    Mot_de_Passe_update_wtf = StringField("Mot de passe ", validators=[Length(min=2, max=20, message="min 2 max 20"),
                                                                          Regexp(Mot_de_Passe_update_regexp,
                                                                                 message="Pas de chiffres, de "
                                                                                         "caractères "
                                                                                         "spéciaux, "
                                                                                         "d'espace à double, de double "
                                                                                         "apostrophe, de double trait "
                                                                                         "union")
                                                                          ])
    Url_image_update_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    Url_image_update_wtf = StringField("Url de la photo de profil ", validators=[Length(min=2, max=9000, message="min 2 max 9000"),

                                                                          ])
    comptes_dropdown_update_wtf = SelectField("Type de compte",
                                    validators=[DataRequired(message="Sélectionner un type")],
                                    coerce = int,
                                    validate_choice=False
                                    )
    # date_genre_wtf_essai = DateField("Essai date", validators=[InputRequired("Date obligatoire"),
    #                                                            DataRequired("Date non valide")])
    submit = SubmitField("Modifier le compte")


class FormWTFDeleteGenre(FlaskForm):
    """
        Dans le formulaire "genre_delete_wtf.html"

        nom_genre_delete_wtf : Champ qui reçoit la valeur du genre, lecture seule. (readonly=true)
        submit_btn_del : Bouton d'effacement "DEFINITIF".
        submit_btn_conf_del : Bouton de confirmation pour effacer un "genre".
        submit_btn_annuler : Bouton qui permet d'afficher la table "t_genre".
    """
    nom_genre_delete_wtf = StringField("Effacer ce compte")
    submit_btn_del = SubmitField("Effacer compte")
    submit_btn_conf_del = SubmitField("Etes-vous sur d'effacer ce compte ?")
    submit_btn_annuler = SubmitField("Annuler")
