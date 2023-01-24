--1
\d

--2 
SELECT * FROM provenance ;
SELECT * FROM produit;
SELECT * FROM usine;
SELECT * FROM magasin;

--3 Les villes ou il y'a une usine
SELECT DISTINCT ville
FROM usine;

--4 les noms et les couleurs de chaque produit 
SELECT nom_prod, couleurs
FROM produit;

--5 la référence et la quantité de chaque produit livré au magasin avec la référence 14 
SELECT ref_prod, quantite 
FROM provenance
WHERE ref_mag = 14;

--6 la référence, le nom et la ville de toutes les usines de Marseille ;
SELECT *
FROM usine 
WHERE ville = 'Marseille';

--7 
SELECT ref_mag 
FROM provenance
WHERE ref_usine = 109 AND ref_prod=1;

--8 la référence et le nom de tous les produits rouges
SELECT ref_prod, nom_prod
FROM produit
WHERE couleur = 'rouge';

--9 le nom des magasins dans une ville qui commence avec la lettre ’L’ 
/*SELECT DISTINCT nom_mag
FROM magasin 
WHERE LEFT(ville, 1) = 'L'; */
SELECT nom_mag FROM magasin WHERE LEFT(ville, 1) = 'L';

--10
SELECT ref_prod, nom_prod FROM produit WHERE LEFT(nom_prod, 5) = 'casse';

--11
SELECT ref_mag FROM provenance;
SELECT DISTINCT ref_mag FROM provenance;

--12
SELECT nom_prod, couleur FROM produit WHERE poids>=15 AND poids<=45;

--13
SELECT nom_prod FROM produit WHERE (couleur='jaune' OR couleur='bleu') AND poids<20;

--14
SELECT nom_prod FROM produit WHERE (couleur='jaune' OR couleur='bleu') AND poids<20;

(SELECT nom_prod FROM produit WHERE couleur='jaune')
UNION 
(SELECT nom_prod FROM produit WHERE (couleur='bleu' AND poids<20));    

--La version qui marche comme attendu
SELECT nom_prod FROM produit WHERE couleur='jaune' OR couleur='bleu' AND poids<20;

--15
SELECT nom_prod FROM produit WHERE poids>30 
UNION ALL -- et
SELECT nom_prod FROM produit WHERE LEFT(nom_prod, 5)='lampe';

--16
SELECT ref_mag FROM magasin WHERE nom_mag = 'NULL'; ok

--17 ??
SELECT ref_mag FROM magasin WHERE nom_mag ='';  ??
SELECT ref_mag FROM magasin WHERE nom_mag IS NULL; ?? ok

--18 ???
SELECT ref_prod FROM produit, usine WHERE nom_usine='martin' AND usine.ville='Nantes';


--19
SELECT nom_usine FROM usine, magasin WHERE usine.ville=magasin.ville;


--20
SELECT ref_prod, quantite FROM provenance, magasin WHERE LEFT(nom_mag, 1)='P';

--21
SELECT nom_usine FROM usine, produit WHERE nom_prod = 'ordinateur';


--22
SELECT nom_prod, poids, ref_prod FROM produit 
WHERE poids IN (SELECT ref_prod FROM produit);