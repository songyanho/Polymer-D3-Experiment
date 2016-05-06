CREATE TABLE odtrips(
    origin_id INTEGER,
    destination_id INTEGER,
    counttrips INTEGER
);

INSERT INTO odtrips VALUES  (1,2,3), 
                            (1,4,10),
                            (2,3,1),
                            (4,1,20)
                            ;
SELECT  origin_id, 
        destination_id,
        SUM(counttrips) AS tripsFromOriginToDestination,
        (SELECT SUM(o2.counttrips) FROM odtrips o2 WHERE o2.destination_id=o1.origin_id) AS tripsFromDestination, 
        (SELECT SUM(o3.counttrips) FROM odtrips o3 WHERE o3.origin_id=o1.origin_id) AS tripsFromOrigin
        FROM odtrips o1 
        GROUP BY o1.origin_id, o1.destination_id;