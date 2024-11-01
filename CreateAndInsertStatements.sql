CREATE DATABASE `emp_manager`;
USE `emp_manager`;


CREATE TABLE `managers` (
	`manager_id` INT PRIMARY KEY AUTO_INCREMENT,
     `first_name` VARCHAR(20),
    `last_name` VARCHAR(20),
    `emp_id` INT
);

CREATE TABLE `employees` (
	`emp_id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(20),
    `last_name` VARCHAR(20),
    `manager_id` INT,
    FOREIGN KEY (`manager_id`) REFERENCES `managers`(`manager_id`)
);

INSERT INTO `managers` (`first_name`, `last_name`) VALUES ('Shivam', 'Gulia'), ('Shivam', 'Gulia');

SELECT * FROM `managers`;

INSERT INTO `employees` (`first_name`, `last_name`, `manager_id`) VALUES ('Yatharth', 'Kumar', 1), ('Ankit', 'Prakash', 2);

SELECT * FROM `employees`;

UPDATE `managers` SET `emp_id` = '1' WHERE (`manager_id` = '1');
UPDATE `managers` SET `emp_id` = '2' WHERE (`manager_id` = '2');


