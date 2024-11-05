-- 1
SELECT `users`.`id`,
    `users`.`name`,
    `tickets`.`seat_number`
FROM `users`
    INNER JOIN `tickets` ON `users`.`id` = `tickets`.`user`
where `tickets`.`train` = 11
ORDER BY `tickets`.`seat_number` ASC;
-- 2
SELECT `users`.`id`,
    `users`.`name`,
    count(`tickets`.`id`) AS `trains_count`,
    sum(`trains`.`distance`) / 10 AS `total_distance`
FROM `users`
    INNER JOIN `tickets` ON `users`.`id` = `tickets`.`user`
    INNER JOIN `trains` ON `tickets`.`train` = `trains`.`id`
GROUP BY `users`.`id`
ORDER BY `total_distance` DESC
LIMIT 6;
-- 3
SELECT `trains`.`id`,
    `types`.`name` AS `type`,
    `source_stations`.`name` AS `source`,
    `destination_stations`.`name` AS `destination`,
    Timediff(`trains`.`arrival`, `trains`.`departure`) AS `travel_time`
FROM `trains`
    INNER JOIN `types` ON `trains`.`type` = `types`.`id`
    INNER JOIN `stations` AS `source_stations` ON `trains`.`source` = `source_stations`.`id`
    INNER JOIN `stations` AS `destination_stations` ON `trains`.`destination` = `destination_stations`.`id`
ORDER BY `travel_time` DESC
LIMIT 6;
-- 4 
SELECT `types`.`name` AS `type`,
    `source_stations`.`name` AS `source`,
    `destination_stations`.`name` AS `destination`,
    `trains`.`departure`,
    `trains`.`arrival`,
    round(
        `types`.`fare_rate` / 1000 * `trains`.`distance`,
        -2
    ) AS `fare`
FROM `trains`
    INNER JOIN `types` ON `trains`.`type` = `types`.`id`
    INNER JOIN `stations` AS `source_stations` ON `trains`.`source` = `source_stations`.`id`
    INNER JOIN `stations` AS `destination_stations` ON `trains`.`destination` = `destination_stations`.`id`
ORDER BY `departure` ASC;
-- 5
SELECT `trains`.`id`,
    `types`.`name` AS `type`,
    `source_stations`.`name` AS `source`,
    `destination_stations`.`name` AS `destination`,
    count(`tickets`.`train`) AS `occupied`,
    `types`.`max_seats` AS `maximum`
FROM `trains`
    INNER JOIN `types` ON `trains`.`type` = `types`.`id`
    INNER JOIN `stations` AS `source_stations` ON `trains`.`source` = `source_stations`.`id`
    INNER JOIN `stations` AS `destination_stations` ON `trains`.`destination` = `destination_stations`.`id`
    INNER JOIN `tickets` ON `trains`.`id` = `tickets`.`train`
GROUP BY `trains`.`id`
ORDER BY `trains`.`id` ASC;
-- 6
SELECT `trains`.`id`,
    `types`.`name` AS `type`,
    `source_stations`.`name` AS `source`,
    `destination_stations`.`name` AS `destination`,
    count(`tickets`.`train`) AS `occupied`,
    `types`.`max_seats` AS `maximum`
FROM `trains`
    INNER JOIN `types` ON `trains`.`type` = `types`.`id`
    INNER JOIN `stations` AS `source_stations` ON `trains`.`source` = `source_stations`.`id`
    INNER JOIN `stations` AS `destination_stations` ON `trains`.`destination` = `destination_stations`.`id`
    LEFT OUTER JOIN `tickets` ON `trains`.`id` = `tickets`.`train`
GROUP BY `trains`.`id`
ORDER BY `trains`.`id` ASC;

