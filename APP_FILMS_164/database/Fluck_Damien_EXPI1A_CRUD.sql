-- Récupère un compte par son ID
SELECT * 
FROM t_compte 
WHERE id_compte = %(value_id_genre_selected)s;


-- Récupère la liste des comptes avec leur type de compte
SELECT * 
FROM t_compte 
INNER JOIN t_type_compte 
ON t_type_compte.id_type_compte = t_compte.fk_type_compte 
ORDER BY id_compte ASC;


-- Crée un nouveau compte
INSERT INTO t_compte 
(id_compte, Nom_Pseudo, Mot_de_Passe, fk_type_compte, Url_Image) 
VALUES 
(NULL, %(value_intitule_genre)s, %(value_mdp)s, %(value_typecompte)s, %(value_url_image)s);


-- Met à jour un compte existant
UPDATE t_compte 
SET 
    Nom_Pseudo = %(value_nom_pseudo)s, 
    Mot_de_Passe = %(value_mot_de_passe)s, 
    Url_image = %(value_url)s, 
    fk_type_compte = %(value_type_compte)s 
WHERE id_compte = %(value_id_compte_update)s;


-- Récupère les informations d'un compte avec son type de compte
SELECT 
    id_compte, 
    Nom_Pseudo, 
    Mot_de_passe, 
    is_delete, 
    fk_type_compte, 
    id_type_compte, 
    type_compte 
FROM t_compte 
INNER JOIN t_type_compte 
ON t_type_compte.id_type_compte = t_compte.fk_type_compte 
WHERE id_compte = %(value_id_compte)s;


-- Supprime logiquement un compte (is_delete = 1)
UPDATE t_compte 
SET is_delete = 1 
WHERE id_compte = %(value_id_compte)s;


-- Supprime les créations de compte liées à un compte
DELETE FROM t_creation_compte 
WHERE Fk_compte_personne = %(value_id_compte)s;


-- Supprime les modifications de compte liées à un compte
DELETE FROM t_modification_compte 
WHERE Fk_compte_personne = %(value_id_compte)s;


-- Supprime définitivement un compte
DELETE FROM t_compte 
WHERE id_compte = %(value_id_compte)s;


-- Récupère les informations de suppression d'un compte
SELECT 
    sup.id_supression_compte, 
    c.Nom_pseudo, 
    p.Prenom, 
    p.Nom 
FROM t_supression_compte AS sup 
INNER JOIN t_compte AS c 
ON sup.FK_compte_personne = c.id_compte 
INNER JOIN t_personne AS p 
ON sup.FK_personne_compte = p.id_personne 
WHERE sup.FK_compte_personne = %(value_id_compte)s;


-- Récupère les informations de base d'un compte
SELECT 
    id_compte, 
    Nom_Pseudo 
FROM t_compte 
WHERE id_compte = %(value_id_compte)s;


-- Récupère les informations de création de compte
SELECT 
    cc.id_creation_compte, 
    c.Nom_Pseudo, 
    cc.Date_creation_compte, 
    c.Url_image, 
    p1.Nom, 
    p1.Prenom, 
    GROUP_CONCAT(c.Nom_Pseudo) AS Compte 
FROM t_creation_compte AS cc 
LEFT JOIN t_personne AS p1 
ON p1.id_personne = cc.Fk_personne_compte 
LEFT JOIN t_compte AS c 
ON c.id_compte = cc.Fk_compte_personne 
WHERE cc.id_creation_compte IS NOT NULL 
GROUP BY 
    cc.id_creation_compte, 
    c.Nom_Pseudo, 
    cc.Date_creation_compte, 
    c.Url_image, 
    p1.Nom, 
    p1.Prenom;


-- Récupère la liste des comptes
SELECT 
    id_compte, 
    Nom_Pseudo 
FROM t_compte 
ORDER BY id_compte ASC;