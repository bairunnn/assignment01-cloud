/*
    Which station is closest to Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

-- Result: Station 3208
-- Enter your SQL query here
SELECT
    station_statuses.id AS station_id,
    station_statuses.name AS station_name,
    ROUND(
        public.ST_Distance(
            public.ST_Transform(station_statuses.geog, 32129),
            public.ST_Transform(public.ST_SetSRID(public.ST_MakePoint(-75.192584, 39.952415), 4326), 32129)
        ) / 50.0
    ) * 50 AS distance
FROM indego.station_statuses
ORDER BY distance ASC
LIMIT 1;
