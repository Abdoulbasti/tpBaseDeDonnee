-- 1
\d magasin;
-- 2
SELECT * FROM produit;
-- 3
SELECT ville FROM usine GROUP BY ville;
-- 4
SELECT nom_prod, couleur FROM produit;
-- 5
SELECT produit.ref_prod, SUM(quantite) as quantite 
    FROM produit, provenance 
    WHERE produit.ref_prod = provenance.ref_prod and ref_mag = 14
    GROUP BY produit.ref_prod
    ORDER BY produit.ref_prod;
-- 6
SELECT * FROM usine WHERE ville = 'Marseille';
-- 7
SELECT DISTINCT magasin.ref_mag 
    FROM magasin, provenance
    WHERE 1 = provenance.ref_prod and provenance.ref_usine = 109 and provenance.ref_mag = magasin.ref_mag;
-- 8
SELECT nom_prod, ref_prod FROM produit WHERE couleur = 'rouge' GROUP BY ref_prod;
-- 9
SELECT nom_mag FROM magasin WHERE LEFT(ville, 1) = 'L' GROUP BY nom_mag;
-- 10
SELECT ref_prod, nom_prod FROM produit WHERE LEFT(nom_prod, 5) = 'casse';
-- 11
SELECT DISTINCT magasin.ref_mag FROM magasin, provenance WHERE magasin.ref_mag = provenance.ref_mag;
-- 12
SELECT nom_prod, couleur FROM produit WHERE poids >= 15 and poids < 45;
-- 13
SELECT DISTINCT nom_prod FROM produit WHERE (couleur = 'jaune' or couleur = 'bleu') and poids < 20;
-- 14
SELECT DISTINCT nom_prod FROM produit WHERE couleur = 'jaune' or (couleur = 'bleu' and poids < 20);
-- 15
SELECT DISTINCT nom_prod FROM produit WHERE LEFT(nom_prod, 5) = 'lampe' or poids > 30;
-- 16
SELECT ref_mag FROM magasin WHERE nom_mag = 'NULL';
-- 17
SELECT ref_mag FROM magasin WHERE nom_mag = '';
-- 18
SELECT DISTINCT ref_prod FROM provenance WHERE ref_usine IN (
    SELECT ref_usine FROM usine WHERE nom_usine = 'martin' and ville = 'Nantes'
);
SELECT DISTINCT ref_prod 
    FROM provenance, usine 
    WHERE nom_usine = 'martin' and ville = 'Nantes' and provenance.ref_usine = usine.ref_usine;
-- 19
SELECT DISTINCT nom_usine FROM usine, magasin WHERE usine.ville = magasin.ville;
-- 20
SELECT produit.ref_prod, SUM(quantite) as quantite 
    FROM produit, provenance 
    WHERE produit.ref_prod = provenance.ref_prod and ref_mag IN (
        SELECT ref_mag FROM magasin WHERE LEFT(nom_mag, 1) = 'P'
    )
    GROUP BY produit.ref_prod
    ORDER BY produit.ref_prod;
-- 21
SELECT DISTINCT nom_usine 
    FROM usine, produit, provenance 
    WHERE usine.ref_usine = provenance.ref_usine and produit.ref_prod = provenance.ref_prod and nom_prod = 'ordinateur';
-- 22
SELECT DISTINCT nom_prod FROM produit WHERE poids IN (
    SELECT ref_prod FROM produit
);