CREATE KEYSPACE IF NOT EXISTS raw WITH replication = { 'class': 'SimpleStrategy', 'replication_factor': '2' };
USE raw;
CREATE TABLE IF NOT EXISTS raw (insertion_time timeuuid, user int, message text, PRIMARY KEY (device, insertion_time)) WITH CLUSTERING ORDER BY (insertion_time DESC);

