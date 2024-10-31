CREATE TABLE `students`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `enrollment_year` INT NOT NULL,
    `department` VARCHAR(30) NOT NULL,
    `individual_id` INT NOT NULL,
    `phone_number` VARCHAR(20) NOT NULL,
    `address` VARCHAR(50) NOT NULL,
    `total_credit` INT DEFAULT 0,
    `GPA` FLOAT DEFAULT 0.0,
    `in_school` BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

