CREATE DATABASE `emp_manager`;
USE `emp_manager`;


CREATE TABLE `managers` (
	`manager_id` INT,
     `first_name` VARCHAR(20),
    `last_name` VARCHAR(20),
    `emp_id` INT,
    PRIMARY KEY (`manager_id`, `emp_id`)
);

CREATE TABLE `employees` (
	`emp_id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(20),
    `last_name` VARCHAR(20),
    `manager_id` INT
);

INSERT INTO `employees` (`first_name`, `last_name`, `manager_id`) VALUES ('Yatharth', 'Kumar', 1), ('Ankit', 'Prakash', 2), ('Sarthak', 'Singh', 1);

INSERT INTO `employees` (`first_name`, `last_name`, `manager_id`) VALUES ('Siya', 'Gupta', NULL);

INSERT INTO `managers` (`manager_id`,`first_name`, `last_name`, `emp_id`) VALUES (1,'Shivam', 'Gulia', 1), (1,'Shivam', 'Gulia',3), (2,'Shubra', 'Gupta',2);

SELECT * FROM `managers`;

SELECT * FROM `employees`;	

-- 1. 

SELECT `managers`.`first_name` AS `manager_first_name` , `managers`.`last_name` AS `manager_last_name`, `employees`.`first_name` AS `employee_first_name`, `employees`.`last_name` AS `employee_last_name` FROM `managers` LEFT JOIN `employees` ON `managers`.`emp_id` = `employees`.`emp_id`; 


-- 2.

SELECT `managers`.`first_name` AS `manager_first_name` , `managers`.`last_name` AS `manager_last_name`, `employees`.`first_name` AS `employee_first_name`, `employees`.`last_name` AS `employee_last_name` FROM `managers` LEFT JOIN `employees` ON `managers`.`emp_id` = `employees`.`emp_id` WHERE `managers`.`first_name` = 'Shivam'  AND `managers`.`last_name` = 'Gulia';

SELECT `managers`.`first_name` AS `manager_first_name` , `managers`.`last_name` AS `manager_last_name`, `employees`.`first_name` AS `employee_first_name`, `employees`.`last_name` AS `employee_last_name` FROM `managers` LEFT JOIN `employees` ON `managers`.`emp_id` = `employees`.`emp_id` WHERE `managers`.`first_name` = 'Shubra'  AND `managers`.`last_name` = 'Gupta';

-- 3.

SELECT `first_name`, `last_name`, COUNT(`emp_id`) AS `employee_count` FROM `managers` GROUP BY `first_name`, `last_name`;

-- 4. 

SELECT * FROM `employees` WHERE `manager_id` IS NULL;

--  5. 

DELIMITER $$ 
CREATE FUNCTION `get_full_name` (`first_name` VARCHAR(20), `last_name` VARCHAR(20)) RETURNS VARCHAR(41) DETERMINISTIC
BEGIN 
RETURN CONCAT(`first_name`, ' ' , `last_name`);
END $$
DELIMITER ;


SELECT * , get_full_name(`first_name`, `last_name`) FROM `employees`;

