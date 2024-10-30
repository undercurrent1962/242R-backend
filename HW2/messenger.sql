CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `uesr_password` VARCHAR(20) NOT NULL,
    `user_nickname` VARCHAR(20) NOT NULL,
    `profile_picture_link` VARCHAR(50) NOT NULL,
    `profile_message` VARCHAR(50) NOT NULL,
    `is_deleted` BOOLEAN DEFAULT FALSE,
    `signup_date` DATE NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `channel_name` VARCHAR(20) NOT NULL,
    `creater_id` INT NOT NULL,
    `channel_link` VARCHAR(50) NOT NULL,
    `maximum_member` INT NOT NULL,
    `is_deleted` BOOLEAN DEFAULT FALSE,
    `created_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`creater_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `message` VARCHAR(100) NOT NULL,
    `sender_id` INT NOT NULL,
    `channel_id` INT NOT NULL,
    `sent_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`sender_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel_id`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower_id` INT NOT NULL,
    `followee_id` INT NOT NULL,
    `follow_date` DATE NOT NULL,
    PRIMARY KEY (`id`), 
    FOREIGN KEY (`follower_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocker_id` INT NOT NULL,
    `blockee_id` INT NOT NULL,
    `block_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`blocker_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blockee_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;