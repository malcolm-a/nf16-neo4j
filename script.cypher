:begin
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{_id:13, properties:{country:"France", name:"Marie", age:22}}, {_id:14, properties:{country:"USA", gender:"M", name:"Craig", age:30}}, {_id:15, properties:{country:"France", gender:"F", name:"Leïla", age:25}}, {_id:16, properties:{country:"USA", gender:"M", name:"Jamal", age:33}}, {_id:17, properties:{country:"USA", gender:"F", name:"Sofia", age:21}}, {_id:18, properties:{country:"France", gender:"M", name:"Jacob", age:20}}, {_id:19, properties:{country:"USA", gender:"F", name:"Emma", age:19}}, {_id:20, properties:{country:"France", gender:"Undefined", name:"Louis", age:34}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:User;
UNWIND [{_id:3, properties:{name:"The Weeknd", genre:"Pop"}}, {_id:4, properties:{country:"France", career_start:2003, name:"Justice", genre:"Electronic"}}, {_id:5, properties:{country:"USA", career_start:2004, name:"Kendrick Lamar", genre:"Hip-Hop"}}, {_id:6, properties:{country:"France", career_start:1993, name:"Daft Punk", genre:"Electronic"}}, {_id:7, properties:{country:"USA", career_start:1992, name:"Pharrell Williams", genre:"Pop"}}, {_id:8, properties:{country:"USA", career_start:1999, name:"Clipse", genre:"Hip-Hop"}}, {_id:9, properties:{country:"USA", career_start:2007, genre:"Hip-Hop", name:"Tyler, the Creator"}}, {_id:10, properties:{country:"Australia", career_start:2007, name:"Tame Impala", genre:"Pop"}}, {_id:11, properties:{country:"USA", career_start:2012, name:"SZA", genre:"R&B"}}, {_id:12, properties:{country:"Barbados", career_start:2005, name:"Rihanna", genre:"Pop"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Artist;
UNWIND [{_id:0, properties:{founded:1985, name:"Major Music"}}, {_id:1, properties:{founded:1992, name:"Great Records"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Label;
:commit
:begin
UNWIND [{start: {_id:3}, end: {_id:5}, properties:{}}, {start: {_id:3}, end: {_id:6}, properties:{}}, {start: {_id:3}, end: {_id:7}, properties:{}}, {start: {_id:3}, end: {_id:9}, properties:{}}, {start: {_id:3}, end: {_id:10}, properties:{}}, {start: {_id:4}, end: {_id:10}, properties:{}}, {start: {_id:5}, end: {_id:7}, properties:{}}, {start: {_id:5}, end: {_id:8}, properties:{}}, {start: {_id:5}, end: {_id:11}, properties:{}}, {start: {_id:5}, end: {_id:12}, properties:{}}, {start: {_id:6}, end: {_id:7}, properties:{}}, {start: {_id:7}, end: {_id:8}, properties:{}}, {start: {_id:7}, end: {_id:9}, properties:{}}, {start: {_id:7}, end: {_id:10}, properties:{}}, {start: {_id:7}, end: {_id:11}, properties:{}}, {start: {_id:7}, end: {_id:12}, properties:{}}, {start: {_id:8}, end: {_id:9}, properties:{}}, {start: {_id:11}, end: {_id:12}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:COLLABORATED_WITH]->(end) SET r += row.properties;
UNWIND [{start: {_id:3}, end: {_id:0}, properties:{}}, {start: {_id:5}, end: {_id:0}, properties:{}}, {start: {_id:12}, end: {_id:0}, properties:{}}, {start: {_id:11}, end: {_id:0}, properties:{}}, {start: {_id:6}, end: {_id:1}, properties:{}}, {start: {_id:4}, end: {_id:1}, properties:{}}, {start: {_id:10}, end: {_id:1}, properties:{}}, {start: {_id:9}, end: {_id:1}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SIGNED_WITH]->(end) SET r += row.properties;
UNWIND [{start: {_id:14}, end: {_id:7}, properties:{}}, {start: {_id:14}, end: {_id:10}, properties:{}}, {start: {_id:14}, end: {_id:12}, properties:{}}, {start: {_id:15}, end: {_id:3}, properties:{}}, {start: {_id:15}, end: {_id:5}, properties:{}}, {start: {_id:15}, end: {_id:8}, properties:{}}, {start: {_id:15}, end: {_id:9}, properties:{}}, {start: {_id:15}, end: {_id:11}, properties:{}}, {start: {_id:15}, end: {_id:12}, properties:{}}, {start: {_id:16}, end: {_id:4}, properties:{}}, {start: {_id:16}, end: {_id:5}, properties:{}}, {start: {_id:13}, end: {_id:3}, properties:{}}, {start: {_id:13}, end: {_id:5}, properties:{}}, {start: {_id:13}, end: {_id:7}, properties:{}}, {start: {_id:13}, end: {_id:8}, properties:{}}, {start: {_id:13}, end: {_id:11}, properties:{}}, {start: {_id:14}, end: {_id:4}, properties:{}}, {start: {_id:14}, end: {_id:6}, properties:{}}, {start: {_id:16}, end: {_id:6}, properties:{}}, {start: {_id:16}, end: {_id:8}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:LIKES]->(end) SET r += row.properties;
UNWIND [{start: {_id:16}, end: {_id:9}, properties:{}}, {start: {_id:16}, end: {_id:10}, properties:{}}, {start: {_id:17}, end: {_id:3}, properties:{}}, {start: {_id:17}, end: {_id:5}, properties:{}}, {start: {_id:17}, end: {_id:7}, properties:{}}, {start: {_id:17}, end: {_id:8}, properties:{}}, {start: {_id:17}, end: {_id:9}, properties:{}}, {start: {_id:17}, end: {_id:11}, properties:{}}, {start: {_id:17}, end: {_id:12}, properties:{}}, {start: {_id:18}, end: {_id:6}, properties:{}}, {start: {_id:18}, end: {_id:7}, properties:{}}, {start: {_id:18}, end: {_id:8}, properties:{}}, {start: {_id:18}, end: {_id:11}, properties:{}}, {start: {_id:19}, end: {_id:3}, properties:{}}, {start: {_id:19}, end: {_id:4}, properties:{}}, {start: {_id:19}, end: {_id:7}, properties:{}}, {start: {_id:19}, end: {_id:9}, properties:{}}, {start: {_id:20}, end: {_id:4}, properties:{}}, {start: {_id:20}, end: {_id:10}, properties:{}}, {start: {_id:20}, end: {_id:12}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:LIKES]->(end) SET r += row.properties;
:commit
:begin
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
:commit
:begin
DROP CONSTRAINT UNIQUE_IMPORT_NAME;
:commit
