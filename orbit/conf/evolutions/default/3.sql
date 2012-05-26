
# --- !Ups

-- phpMyAdmin SQL Dump
-- version 3.4.5deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: Apr 26, 2012 alle 12:58
-- Versione del server: 5.1.62
-- Versione PHP: 5.3.6-13ubuntu3.6

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `phdcoursedb`
--

-- 'global' models

INSERT INTO `countries` (`country_ID`, `name`, `region`, `citizenship`, `deleted`) VALUES
(1, 'China', 'Asia', 'Chinese', 0),
(2, 'India', 'Asia', 'Indian', 0),
(3, 'United States Of America', 'North America', 'American', 0),
(4, 'Italy', 'Europe', 'Italian', 0);

INSERT INTO `funding_institutions` (`funding_institution_ID`, `name`, `deleted`, `type`) VALUES
(1,'DISI',0,'UNKNOWN');

INSERT INTO `universities` (`university_ID`, `name_university`, `location`, `deleted`, `country`) VALUES
(1,'UNITN','Rome',0,1);

INSERT INTO `supervisors` (`supervisor_ID`, `first_name`, `last_name`, `can_be_advisor`, `is_active`, `is_internal`, `email`, `deleted`) VALUES
(1,'Joe','Doe',1,1,1,'joe.doe@gmail.com',0);

INSERT INTO `students` (`user_ID`, `date_of_birth`, `graduation_date`, `first_name`, `last_name`, `full_name`, `phd_cycle`, `is_suspended`, `course_year`, `admitted_conditionally`, `legal_residence`, `current_domicile`, `place_of_birth`, `office_phone`, `mobile_phone`, `office_working_place`, `locker_number`, `phd_scholarship`, `scholarship_type`, `yearly_fee_to_center`, `yearly_fee_to_school`, `has_pc_rights`, `pre_doctoral_scholarship`, `months_predoc_scholarship`, `year_extension_scholarship`, `months`, `personal_funds_available`, `is_graduated`, `commitee_members`, `email`, `deleted`, `Italian_Taxpayer_Code`, `university_of_provenance`, `university`, `funding_institution`, `country_of_provenance`, `citizenship`, `funds_owner`, `tutor`, `current_advisor`) VALUES
(1, '1991-12-22 00:00:00', NULL, 'John Erik', 'Smith', 'John E. Smith', '27', 0, 1, 0, 'via manci 27, Trento', '', 'New York, NY, USA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, 'UNKNOWN', 'john.smith@domain.com', 1, 1, 1, 1, 1, 1, 4, 1, 1, 1),
(2, '1991-12-22 00:00:00', NULL, 'Paolo', 'Rossi', 'Paolo Rossi', '27', 0, 2, 0, 'piazza roma 12, Trento', '', 'Milano, MI, ITA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, 'UNKNOWN', 'paolo.rossi@domain.com', 0, 1, 1, 1, 1, 1, 4, 1, 1, 1),
(3, '1991-12-22 00:00:00', NULL, 'Davide', 'Kirchner', 'Davide Kirchner', '26', 0, 2, 0, 'via manci 27, Trento', '', 'Trento, TN, ITA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, 'UNKNOWN', 'dk@example.com', 0, 1, 1, 1, 1, 1, 4, 1, 1, 1),
(4, '1991-12-22 00:00:00', NULL, 'Paul', 'Jackson', 'Paul Jackson', '26', 0, 2, 0, 'via foscolo 40, Trento', '', 'New York, NY, USA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, 'UNKNOWN', 'paul.jackson@domain.com', 0, 1, 1, 1, 1, 1, 4, 1, 1, 1),
(5, '1991-12-22 00:00:00', NULL, 'Harry', 'Johnson', 'Harry Johnson', '28', 0, 2, 0, 'via milano 50, Trento', '', 'New York, NY, USA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, 'UNKNOWN', 'harry.johnson@domain.com', 0, 1, 1, 1, 1, 1, 4, 1, 1, 1),
(6, '1991-12-22 00:00:00', NULL, 'Patrick', 'Smith', 'Patrick Smith', '28', 0, 2, 0, 'via antonio fogazzaro 35, Trento', '', 'New York, NY, USA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, 'UNKNOWN', 'patrick.smith@domain.com', 0, 1, 1, 1, 1, 1, 4, 1, 1, 1),
(7, '1991-12-22 00:00:00', NULL, 'Some Guy', 'Lee', 'Some Guy', '28', 0, 2, 0, 'via verdi 27, Trento', '', 'Shanghai, SHA, CN', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, 'UNKNOWN', 'someguy.lee@domain.com', 0, 1, 1, 1, 1, 1, 4, 1, 1, 1);


INSERT INTO `users_roles` (`user_rol_ID`, `role`, `deleted`) VALUES
(1,'admin',0),
(2,'professor',0),
(3,'student',0);


INSERT INTO `users_credentials` (`user_credential_ID`, `user_name`, `password`, `user_rol`, `user`, `user_supervisor`) VALUES
(1,'admin','admin',1,NULL,NULL),
(2,'prof','prof',2,NULL,1),
(3,'student','student',3,1,NULL);

-- STATISTICS models


INSERT INTO `data_set` (`id`, `description`) VALUES
(1, 'datasets.StudentsByNationality'),
(2, 'datasets.FirstYStudentsByNationality'),
(3, 'datasets.FirstYStudentsByNationalityLast5Years'),
(4, 'datasets.StudentsByNationality');


INSERT INTO `widget` (`id`, `name`, `description`) VALUES
(1, 'Pie Chart', 'PieChart'),
(2, 'Area Chart', 'AreaChart');


INSERT INTO `report` (`id`, `name`, `description`, `is_public`) VALUES
(1, 'Distribution of first year admitted students by nationality for the current year ', 'distribution of first year admitted students by nationality', 1),
(2, 'Distribution of 1st year admitted students by nationality, over the last 5 years ', 'distribution of 1st year admitted students by nationality, over the last 5 years ', 0),
(3, 'Distribution of current students by nationality ', 'distribution of current students by nationality ', 0),
(4, 'Number of scholarships over the last 5 years, classified by source (UNITN, DISI, Research center, Company, Other) ', 'number of scholarships over the last 5 years, classified by source ', 0),
(5, 'Average number of months spent abroad, by cycle, historically (for 5 cycles) ', 'average number of months spent abroad, by cycle, historically', 0),
(6, 'Average number of months spent abroad, by cycle and by funding institution, historically (for 5 cycles) ', 'average number of months spent abroad, by cycle and by funding institution, historically', 1),
(7, 'Average mark in courses by funding institution, over the past 5 years', 'average mark in courses by funding institution, over the past 5 years', 1);



INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Current Students', 'Statistic reports about students'' marks, for current students'),
(2, 'Student Scholarships', 'Statistic reports about student scholarships over the last 5 years'),
(3, 'Student Marks', 'Students marks'),
(4, 'Time Spent Abroad', 'Number of Month Spent Abroad');


INSERT INTO `statistic` (`id`, `name`, `description`, `format`, `num_visits`, `widget_id`, `dataset_id`) VALUES
(1, 'Distribution of 1st year admitted students by nationality for the current year ', 'The graph shows the list of countries, each one with the percentage of students from that country admitted to the 1st year ', NULL, NULL, 1, 2),
(2, 'Distribution of current students by nationality ', 'The graph shows the list of countries, each one with the percentage of students from that country currently enrolled ', NULL, NULL, 1, 1),
(3, 'Distribution of 1st year admitted students by nationality, over the last 5 years ', 'The graphs shows the list of countries, each one with the percentage of students from that country admitted over the last 5 years ', NULL, NULL, 2, 3),
(4, 'Number of applications over the last 5 years', 'The graph shows the number of applications over the last 5 years', NULL, NULL, 1, 1),
(5, 'Number of scholarships over the last 5 years, ', 'The graph shows the number of scholarships over the last 5 years, classified by source (UNITN, DISI, Research center, Company, Other) ', NULL, NULL, 1, 3),
(6, 'Average number of months spent abroad, by cycle, historically (for 5 cycles) ', 'The graph shows the average number of months spent abroad by cycle, fo 5 cycles', NULL, NULL, 1, 4),
(7, 'Average number of months spent abroad, by cycle and by funding institution, historically (for 5 cycles) ', 'The graph shows the average number of months spent abroad by cycles and by funding institution, for 5 years', NULL, NULL, 1, 3),
(8, 'Average mark in courses by funding institution, over the past 5 years', 'The graph shows the average mark in courses by funding institution, over the past 5 years', NULL, NULL, 1, 4);


INSERT INTO `report_category` (`report_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(7, 3),
(5, 4),
(6, 4);


INSERT INTO `report_statistic` (`report_id`, `statistic_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 5),
(5, 6),
(6, 7),
(7, 8);

INSERT INTO `report_users_roles` (`report_id`, `users_roles_user_rol_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 2),
(3, 3),
(4, 2),
(4, 3),
(5, 2),
(5, 3),
(6, 2),
(6, 3),
(7, 2),
(7, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# --- !Downs

DELETE FROM `report_users_roles`;
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
