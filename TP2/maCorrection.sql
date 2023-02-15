--1 Requêtes simple 
    --1
    SELECT * FROM tournois;
    SELECT * FROM matchs;
    SELECT * FROM equipes;
    SELECT * FROM participation;

    --2
    SELECT annee FROM tournois WHERE pays = 'Nouvelle-Zélande';

    --3
    SELECT pays FROM equipes WHERE nom = 'XV de France';

    --4
    SELECT DISTINCT eid AS gagnant FROM equipes, matchs 
    WHERE equipes.eid = matchs.gagnant;

    /*
    AS pour donner un nom resulat d'un attribut
    SELECT DISTINCT eid AS gagnant FROM equipes, matchs 
    WHERE equipes.eid = matchs.gagnant;*/

    --SELECT DISTINCT gagnant FROM matchs WHERE 



--2 Requêtes avec jointure 

    --1 
    -- Ajout de DISTINCT pour eviter les repetition de données
    SELECT nom FROM equipes, matchs WHERE equipes.eid = matchs.gagnant;

    SELECT nom FROM equipes JOIN matchs ON equipes.eid = matchs.gagnant;

    --2
    SELECT tournois.nom, tournois.annee FROM tournois, matchs, equipes 
    WHERE tournois.tid = matchs.tournois AND 
            equipes.eid = 2 AND 
            equipes.eid = matchs.perdant;

    SELECT tournois.nom, tournois.annee 
    FROM (tournois JOIN matchs ON tournois.tid = matchs.tournois)
    JOIN equipes ON (equipes.eid = matchs.perdant AND equipes.eid = 2);

    --3
    SELECT mid FROM matchs, equipes
    WHERE matchs.perdant = equipes.eid AND equipes.nom = 'Wallabies';

    SELECT mid FROM matchs JOIN equipes ON
    (matchs.perdant = equipes.eid AND equipes.nom = 'Wallabies');

    --4
    SELECT mid FROM matchs, equipes, participation 
    WHERE
        participation.eid = equipes.eid AND 
        participation.tid = matchs.tournois AND
        (participation.eid = matchs.gagnant OR participation.eid = matchs.perdant) AND
        equipes.nom = 'All Blacks';


    SELECT mid FROM (participation NATURAL JOIN equipes) 
    JOIN matchs ON 
    (
        participation.tid = matchs.tournois AND 
        (participation.eid = matchs.gagnant OR participation.eid = matchs.perdant) AND
        equipes.nom = 'All Blacks'
    );
    
    --5
    SELECT equipes.eid FROM equipes, participation, tournois
    WHERE   tournois.nom = 'Coupe du Monde' AND 
            tournois.annee = 1991 AND 
            participation.tid = tournois.tid AND
            participation.eid = equipes.eid;


    SELECT DISTINCT equipes.eid FROM participation NATURAL JOIN equipes, tournois
    WHERE   tournois.nom = 'Coupe du Monde' AND 
            tournois.annee = 1991;


--3 Requêtes avec double jointure 

    --1


    --2

    --3

    --4

    --5


--4 Condition d'existence et d'inexistence 

    --1


    --2

    --3

    --4

    --5

    --6


--5 Cohérence de la table

    --1


    --2

    --3

    --4