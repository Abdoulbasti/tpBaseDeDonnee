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


    --2

    --3

    --4

    --5


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