// Query 1: Trouver tous les artistes aimés par un utilisateur
// 1. Artists that user 5 (Sofia) likes
MATCH (u:User {name: 'Sofia'})-[:LIKES]->(a:Artist)
RETURN a.name AS artist, a.genre AS genre;

// Query 2: Collaborateurs des collaborateurs d'un artiste
// 2. Artists that collaborated with artist 5 (Pharrell Williams)
MATCH (a:Artist {name: 'Pharrell Williams'})-[:COLLABORATED_WITH]-(collab:Artist)
OPTIONAL MATCH (collab)-[:COLLABORATED_WITH]-(collab2:Artist)
WHERE collab2 <> a
RETURN collab.name AS collaborator, COLLECT(DISTINCT collab2.name) AS their_collaborators
ORDER BY collaborator;

// Query 3: Âge moyen des auditeurs par maison de disque
// 3. Average age of fans by record label
MATCH (u:User)-[:LIKES]->(a:Artist)-[:SIGNED_WITH]->(l:Label)
RETURN l.name AS label, ROUND(AVG(u.age), 2) AS avg_fan_age
ORDER BY label;

// Query 4: artistes ayant des fans en commun
// 4. Pairs of artists with the number of users they have in common
MATCH (a1:Artist)<-[:LIKES]-(u:User)-[:LIKES]->(a2:Artist)
WHERE elementId(a1) < elementId(a2)
RETURN a1.name AS artist1, a2.name AS artist2, COUNT(DISTINCT u) AS common_fans
ORDER BY common_fans DESC;

// Query 5: Recommandation d'artistes
// 5. Find artists that users with similar tastes like, but the target user doesn't
MATCH (target:User {name: 'Marie'})-[:LIKES]->(a:Artist)<-[:LIKES]-(similar:User)
WHERE target <> similar
MATCH (similar)-[:LIKES]->(rec:Artist)
WHERE NOT (target)-[:LIKES]->(rec)
RETURN rec.name AS recommended_artist, 
       COUNT(DISTINCT similar) AS score,
       COLLECT(DISTINCT similar.name) AS recommended_by
ORDER BY score DESC;

// Query 6: Chemin le plus court entre deux artistes
MATCH path = shortestPath(
  (a1:Artist {name: 'Justice'})-[:COLLABORATED_WITH*]-(a2:Artist {name: 'Rihanna'})
)
RETURN [n IN nodes(path) | n.name] AS collaboration_chain, length(path) AS degrees_of_separation;

// Query 7: Insertion d'un nouvel artiste et d'une relation
// 7. Insertion d'un nouvel artiste et création d'une relation de collaboration
CREATE (new:Artist {name: 'Beyoncé', genre: 'R&B'})
WITH new
MATCH (existing:Artist {name: 'Rihanna'})
CREATE (new)-[:COLLABORATED_WITH]->(existing)
RETURN new.name AS new_artist, existing.name AS collaborates_with;

// Query 8: Mise à jour des propriétés d'un utilisateur
// 8. Mise à jour des propriétés d'un utilisateur
MATCH (u:User {name: 'Marie'})
SET u.age = 26, u.country = 'Canada'
RETURN u.name AS user, u.age AS new_age, u.country AS new_country;

// Query 9: Suppression d'un artiste et de ses relations
// 9. Suppression d'un artiste et de toutes ses relations
MATCH (a:Artist {name: 'Beyoncé'})
DETACH DELETE a
RETURN "Artiste Beyoncé supprimé avec succès" AS result;
