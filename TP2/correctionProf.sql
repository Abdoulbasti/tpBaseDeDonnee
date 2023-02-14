/*1 Requêtes simples*/
    --1
    SELECT e.nom FROM equipes e, tournois t
    WHERE t.pays = e.pays AND
          t.nom = 'Coupe du monde';

    SELECT nom FROM equipes WHERE pays 
    NOT IN
    (SELECT pays FROM tournois WHERE nom
     = 'Coupe du monde');

    SELECT e.nom FROM equipes e WHERE NOT EXISTS
    (SELECT * FROM tournois t WHERE t.pays=e.pays 
    AND t.nom = 'Coupe du monde') 
    
    --2

    --3 
    SELECT t.nom, t.annee FROM tournois t, participation p, equipes e
    WHERE e.nom = 'xv de France' AND p.eid AND p.tid=t.tid 
    AND NOT EXISTS 
    (SELECT * FROM matchs m WHERE m.tournois=t.tpid
    AND m.gagnant = e.eid);


    --4 
    /*PAS CORRECTE*/
    SELECT e.nom FROM equipes e WHERE NOT EXISTS 
    (SELECT * FROM maths m WHERE m.perd = e.eid);

    --CORRECT 
    SELECT nom FROM matchs WHERE eid NOT EXISTS 
    (SELECT perdant FROM matchs);

    /*Equipes ayant gagné leurs matchs de coupe '93 & 97'*/
    SELECT nom FROM equipes WHERE matchs m, tournois t 
    WHERE eid NOT IN 
    (SELECT m.perdant FROM m, tournois t
    WHERE t. = 'Coupe du monde' AND (t.an=1993 OR t.an=1997)
    AND m.tournois=t.tid
    );

    /*EQUIPE QUI A GAGNÉ TOUS SES MATCHS = EQUIPE T.Q. POUR TOUS tournois t OU 
    ELLE PARTICIPE ET EST VAINQUEUR DU TOURNOI*/

    SELECT e.nom FROM equipes NOT EXISTS 
    ( 
        SELECT t.nom FROM tournois t, participation p, matchs m
        WHERE t.tid=p.pid AND p.eid=e.eid AND m.tournois=t.tid AND m.tour='finale' AND m.gagnant<>e.eid 
    );

    --5 

    --6


/*2 Requêtes avec jointure*/


/*3 Requêtes avec double jointure*/


/*4 Conditions d’existence et inexistence*/


/*5 Cohérence de la table*/