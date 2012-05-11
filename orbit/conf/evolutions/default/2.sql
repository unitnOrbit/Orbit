
# --- !Ups

-- phpMyAdmin SQL Dump
-- version 3.4.5deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: Apr 26, 2012 alle 12:58
-- Versione del server: 5.1.62
-- Versione PHP: 5.3.6-13ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `phdcoursedb`
--

-- FROM BAEZ WITH LOVE

INSERT INTO `countries` (`country_ID`, `name`, `region`, `citizenship`, `deleted`) VALUES
(1, 'China', NULL, 'Chinese', 0),
(2, 'India', NULL, 'Indian', 0),
(3, 'United States Of America', NULL, 'American', 0),
(4, 'Italy', NULL, 'Italian', 0);

INSERT INTO `phdcoursedb`.`funding_institutions` VALUES  (1,'DISI',0,'UNKNOWN');


INSERT INTO `phdcoursedb`.`universities` VALUES  (1,'UNITN','Rome',0,1);


INSERT INTO `phdcoursedb`.`supervisors` VALUES  (1,'Joe','Doe',1,1,1,'joe.doe@gmail.com',0);


INSERT INTO `students` (`user_ID`, `date_of_birth`, `graduation_date`, `first_name`, `last_name`, `full_name`, `phd_cycle`, `is_suspended`, `course_year`, `admitted_conditionally`, `legal_residence`, `current_domicile`, `place_of_birth`, `office_phone`, `mobile_phone`, `office_working_place`, `locker_number`, `phd_scholarship`, `scholarship_type`, `yearly_fee_to_center`, `yearly_fee_to_school`, `has_pc_rights`, `pre_doctoral_scholarship`, `months_predoc_scholarship`, `year_extension_scholarship`, `months`, `personal_funds_available`, `is_graduated`, `commitee_members`, `email`, `deleted`, `Italian_Taxpayer_Code`, `university_of_provenance`, `university`, `funding_institution`, `country_of_provenance`, `citizenship`, `funds_owner`, `tutor`, `current_advisor`) VALUES
(1,'John Erik','Smith','John E. Smith','28',0,2,0,'via manci 27, Trento','','0000-00-00','New York, NY, USA','123-456789','1231-23456','P1-S5-14','27-A',0,'UNKNOWN',0,0,0,NULL,0,'0',0,0,0,NULL,'UNKNOWN','joe.doe@domain.com',0,1,1,1,1,1,1,1,1,1),
(2,'Davide','Kirchner','Davide Kirchner','28',0,2,0,'via manci 27, Trento','','0000-00-00','New York, NY, USA','123-456789','1231-23456','P1-S5-14','27-A',0,'UNKNOWN',0,0,0,NULL,0,'0',0,0,0,NULL,'UNKNOWN','dk@example.com',0,1,1,1,1,1,1,1,1,1);


INSERT INTO `phdcoursedb`.`users_roles` VALUES  (1,'admin',0);


INSERT INTO `phdcoursedb`.`users_credentials` VALUES  (1,'demo','12345',1,1);


-- STATISTICS


INSERT INTO `data_set` (`id`, `description`) VALUES
(1, 'description'),
(2, 'prova'),
(3, NULL),
(4, NULL);


INSERT INTO `widget` (`id`, `name`, `description`) VALUES
(1, 'nome_widget', 'pieChart'),
(2, 'widget_name', 'pieChart');


INSERT INTO `report` (`id`, `name`, `description`) VALUES
(1, 'nome_report', 'distribution of 1st year admitt'),
(2, 'report_name', 'fdsnjakfl fsdjkj llksd jfsjdk lkhfsda fkljdf kjfdskl skldjfk jsdkf hkjdsf jhdfsjd f h sdkf kjsdf asiehtfvknudisf'),
(3, 'altro', 'eruowpirueoovboe be bouw beou pwoe oe mnvcmx, nmcvnx nc cx uvxciuvxicp ivc');


INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Current Students', 'Statistic reports about students'' marks, for current students'),
(2, 'Student applications', 'Statistic reports about student applications over the last years'),
(3, 'Student marks', NULL);


INSERT INTO `statistic` (`id`, `name`, `description`, `format`, `num_visits`, `widget_id`, `dataset_id`) VALUES
(1, 'distribution of 1st year admitted students by nationality for the current year ', 'The output should be the list of countries, each one with the % of students from that country admitted to the 1st year ', NULL, NULL, 1, 2),
(2, 'distribution of current students by nationality ', 'The output should be the list of countries, each one with the % of students from that country currently enrolled ', NULL, NULL, 1, 3),
(3, 'distribution of 1st year admitted students by nationality, over the last 5 years ', 'The output should be the list of countries, each one with the % of students from that country admitted to the 1st year, over the last 5 years ', NULL, NULL, 1, 4);


INSERT INTO `report_category` (`report_id`, `category_id`) VALUES
(1, 2),
(2, 3),
(1, 1),
(2, 1),
(3, 1);


INSERT INTO `report_statistic` (`report_id`, `statistic_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 2),
(3, 1);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# --- !Downs

DELETE FROM `report_category`;
DELETE FROM `report_statistic`;
DELETE FROM `statistic`;
DELETE FROM `category`;
DELETE FROM `report`;
DELETE FROM `data_set`;
DELETE FROM `widget`;

DELETE FROM `users_credentials`;
DELETE FROM `users_roles`;
DELETE FROM `students`;
DELETE FROM `supervisors`;
DELETE FROM `universities`;
DELETE FROM `funding_institutions`;
DELETE FROM `countries`;
