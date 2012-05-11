
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

--
-- Dump dei dati per la tabella `data_set`
--

INSERT INTO `data_set` (`id`, `description`) VALUES
(1, 'description'),
(2, 'prova'),
(3, NULL),
(4, NULL);
--

-- Dump dei dati per la tabella `widget`
--

INSERT INTO `widget` (`id`, `name`, `description`) VALUES
(1, 'nome_widget', NULL);
(2, 'widget_name', NULL);

--
-- Dump dei dati per la tabella `report`
--

INSERT INTO `report` (`id`, `name`, `description`) VALUES
(1, 'nome_report', NULL),
(2, 'report_name', NULL),
(3, NULL, NULL),


--
-- Dump dei dati per la tabella `category`
--

-- INSERT INTO `category` (`id`, `name`, `description`) VALUES (3, 'nome_category', NULL);

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Current Students', 'Statistic reports about students'' marks, for current students'),
(2, 'Student applications', 'Statistic reports about student applications over the last years'),
(3, 'Student marks', NULL);


--
-- Dump dei dati per la tabella `statistic`
--


INSERT INTO `statistic` (`id`, `name`, `description`, `format`, `num_visits`, `widget_id`, `dataset_id`) VALUES
(1, 'distribution of 1st year admitted students by nationality for the current year ', 'The output should be the list of countries, each one with the % of students from that country admitted to the 1st year ', NULL, NULL, 1, 2),
(2, 'distribution of current students by nationality ', 'The output should be the list of countries, each one with the % of students from that country currently enrolled ', NULL, NULL, 1, 3),
(3, 'distribution of 1st year admitted students by nationality, over the last 5 years ', 'The output should be the list of countries, each one with the % of students from that country admitted to the 1st year, over the last 5 years ', NULL, NULL, 1, 4);

--
-- Dump dei dati per la tabella `report_category`
--


INSERT INTO `report_category` (`report_id`, `category_id`) VALUES
(1, 2),
(2, 3);



--
-- Dump dei dati per la tabella `report_statistic`
--


INSERT INTO `report_statistic` (`report_id`, `statistic_id`) VALUES
(3, 1),
(4, 2);

--
-- Dump dei dati per la tabella `countries`
--

INSERT INTO `countries` (`country_ID`, `name`, `region`, `citizenship`, `deleted`) VALUES
(1, 'China', NULL, 'Chinese', 0),
(2, 'India', NULL, 'Indian', 0),
(3, 'United States Of America', NULL, 'American', 0),
(4, 'Italy', NULL, 'Italian', 0);

--
-- Dump dei dati per la tabella `students`
--

INSERT INTO `students` (`user_ID`, `date_of_birth`, `graduation_date`, `first_name`, `last_name`, `full_name`, `phd_cycle`, `is_suspended`, `course_year`, `admitted_conditionally`, `legal_residence`, `current_domicile`, `place_of_birth`, `office_phone`, `mobile_phone`, `office_working_place`, `locker_number`, `phd_scholarship`, `scholarship_type`, `yearly_fee_to_center`, `yearly_fee_to_school`, `has_pc_rights`, `pre_doctoral_scholarship`, `months_predoc_scholarship`, `year_extension_scholarship`, `months`, `personal_funds_available`, `is_graduated`, `commitee_members`, `email`, `deleted`, `Italian_Taxpayer_Code`, `university_of_provenance`, `university`, `funding_institution`, `country_of_provenance`, `citizenship`, `funds_owner`, `tutor`, `current_advisor`) VALUES
(1, '1986-05-02 00:00:00', NULL, 'paolo ', 'rossi', NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(2, '1985-08-24 00:00:00', NULL, 'john ', 'snow', NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# --- !Downs

DELETE FROM `report_category`;
DELETE FROM `category`;
DELETE FROM `statistic`;
DELETE FROM `data_set`;
DELETE FROM `widget`;
DELETE FROM `report_statistic`;
DELETE FROM `report`;
DELETE FROM 'students';
DELETE FROM 'countries';

