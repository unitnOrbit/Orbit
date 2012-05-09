
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
(10, NULL),
(20, NULL),
(30, NULL),
(40, NULL),
(2, NULL);
--
-- Dump dei dati per la tabella `widget`
--

INSERT INTO `widget` (`id`, `name`, `description`) VALUES
(1, 'nome_widget', NULL);

--
-- Dump dei dati per la tabella `report`
--

INSERT INTO `report` VALUES
(1000, 'nome_report', NULL),
(2000, NULL, NULL),
(3000, NULL, NULL),
(4000, NULL, NULL),
(5000, NULL, NULL);

--
-- Dump dei dati per la tabella `category`
--

-- INSERT INTO `category` (`id`, `name`, `description`) VALUES (3, 'nome_category', NULL);

INSERT INTO `category` VALUES (3,'Current Students','Statistic reports about students\' marks, for current students' ),(4,'Student applications','Statistic reports about student applications over the last years'),(5,'Student marks',NULL);


--
-- Dump dei dati per la tabella `statistic`
--


INSERT INTO `statistic` (`id`, `name`, `description`, `format`, `num_visits`, `widget_id`, `dataset_id`) VALUES
(100, 'distribution of 1st year admitted students by nationality for the current year ', 'The output should be the list of countries, each one with the % of students from that country admitted to the 1st year ', NULL, NULL, 1, 2),
(200, 'distribution of current students by nationality ', 'The output should be the list of countries, each one with the % of students from that country currently enrolled ', NULL, NULL, 1, 20),
(300, 'distribution of 1st year admitted students by nationality, over the last 5 years ', 'The output should be the list of countries, each one with the % of students from that country admitted to the 1st year, over the last 5 years ', NULL, NULL, 1, 30);

--
-- Dump dei dati per la tabella `report_category`
--


INSERT INTO `report_category` (`report_id`, `category_id`) VALUES
(1000, 3),
(2000, 4);


--
-- Dump dei dati per la tabella `report_statistic`
--


INSERT INTO `report_statistic` (`report_id`, `statistic_id`) VALUES
(3000, 100),
(4000, 200);


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
