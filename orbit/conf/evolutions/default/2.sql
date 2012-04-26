
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
(2, NULL);

--
-- Dump dei dati per la tabella `widget`
--

INSERT INTO `widget` (`id`, `name`, `description`) VALUES
(1, 'nome_widget', NULL);

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(3, 'nome_category', NULL);

--
-- Dump dei dati per la tabella `statistic`
--

INSERT INTO `statistic` (`id`, `name`, `description`, `num_visits`, `widget_id`, `dataset_id`) VALUES
(1, 'prova', NULL, NULL, 1, 2);

--
-- Dump dei dati per la tabella `category_statistic`
--

INSERT INTO `category_statistic` (`category_id`, `statistic_id`) VALUES
(3, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# --- !Downs

DELETE FROM `category_statistic`;
DELETE FROM `category`;
DELETE FROM `statistic`;
DELETE FROM `data_set`;
DELETE FROM `widget`;



