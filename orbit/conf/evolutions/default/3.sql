
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
(1,'DISI',0,'UNKNOWN'),
(2, 'UNITN',0,'UNKNOWN');

INSERT INTO `universities` (`university_ID`, `name_university`, `location`, `deleted`, `country`) VALUES
(1,'UNITN','Rome',0,1);

INSERT INTO `supervisors` (`supervisor_ID`, `first_name`, `last_name`, `can_be_advisor`, `is_active`, `is_internal`, `email`, `deleted`) VALUES
(1,'Joe','Doe',1,1,1,'joe.doe@gmail.com',0);

INSERT INTO `students` (`user_ID`, `first_name`, `last_name`, `full_name`, `phd_cycle`, `is_suspended`, `course_year`, `admitted_conditionally`, `legal_residence`, `current_domicile`, `date_of_birth`, `place_of_birth`, `office_phone`, `mobile_phone`, `office_working_place`, `locker_number`, `phd_scholarship`, `scholarship_type`, `yearly_fee_to_center`, `yearly_fee_to_school`, `has_pc_rights`, `pre_doctoral_scholarship`, `months_predoc_scholarship`, `year_extension_scholarship`, `months`, `personal_funds_available`, `is_graduated`, `graduation_date`, `commitee_members`, `email`, `deleted`, `funding_institution`, `university`, `country_of_provenance`, `university_of_provenance`, `citizenship`, `current_advisor`, `tutor`, `funds_owner`, `Italian_Taxpayer_Code`, `photo_profile`, `is_plan_approved`) VALUES
(1, 'John Erik', 'Smith', 'John E. Smith', '27', 0, 1, 0, 'via manci 27, Trento', '', '1991-12-22', 'New York, NY, USA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 0, NULL, 'UNKNOWN', 'john.smith@domain.com', 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, NULL, NULL),
(2, 'Paolo', 'Rossi', 'Paolo Rossi', '27', 0, 2, 0, 'piazza roma 12, Trento', '', '1991-12-22', 'Milano, MI, ITA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, NULL, 'UNKNOWN', 'paolo.rossi@domain.com', 0, 2, 1, 1, 1, 4, 1, 1, 1, 1, NULL, NULL),
(3, 'Davide', 'Kirchner', 'Davide Kirchner', '26', 0, 2, 0, 'via manci 27, Trento', '', '1991-12-22', 'Trento, TN, ITA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 0, NULL, 'UNKNOWN', 'dk@example.com', 0, 1, 1, 1, 1, 3, 1, 1, 1, 1, NULL, NULL),
(4, 'Paul', 'Jackson', 'Paul Jackson', '26', 0, 2, 0, 'via foscolo 40, Trento', '', '1991-12-22', 'New York, NY, USA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, NULL, 'UNKNOWN', 'paul.jackson@domain.com', 0, 1, 1, 1, 1, 4, 1, 1, 1, 1, NULL, NULL),
(5, 'Harry', 'Johnson', 'Harry Johnson', '24', 0, 4, 0, 'via milano 50, Trento', '', '1991-12-22', 'New York, NY, USA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, NULL, 'UNKNOWN', 'harry.johnson@domain.com', 0, 1, 1, 1, 1, 4, 1, 1, 1, 1, NULL, NULL),
(6, 'Patrick', 'Smith', 'Patrick Smith', '27', 0, 1, 0, 'via antonio fogazzaro 35, Trento', '', '1991-12-22', 'New York, NY, USA', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 0, NULL, 'UNKNOWN', 'patrick.smith@domain.com', 0, 2, 1, 1, 1, 4, 1, 1, 1, 1, NULL, NULL),
(7, 'Some Guy', 'Lee', 'Some Guy', '27', 0, 2, 0, 'via verdi 27, Trento', '', '1991-12-22', 'Shanghai, SHA, CN', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, NULL, 'UNKNOWN', 'someguy.lee@domain.com', 0, 1, 1, 1, 1, 4, 1, 1, 1, 1, NULL, NULL),
(8, 'Some Guy', 'Lee', 'Some Guy', '25', 0, 3, 0, 'via verdi 27, Trento', '', '1991-12-22', 'Shanghai, SHA, CN', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, NULL, 'UNKNOWN', 'someguy.lee@domain.com', 0, 1, 1, 1, 1, 4, 1, 1, 1, 1, NULL, NULL),
(9, 'Some indian Guy', 'Lee', 'Some indian Guy Lee', '27', 0, 1, 0, 'via verdi 27, Trento', '', '1991-12-22', 'Shanghai, SHA, CN', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, NULL, 'UNKNOWN', 'someguy.lee@domain.com', 0, 1, 1, 1, 1, 2, 1, 1, 1, 1, NULL, NULL),
(10, 'Some', 'Lee', 'Some Lee', '27', 0, 1, 0, 'via verdi 27, Trento', '', '1991-12-22', 'Shanghai, SHA, CN', '123-456789', '1231-23456', 'P1-S5-14', '27-A', 0, '0', 0, 0, 1, '0', 0, '0', 0, 0, 1, NULL, 'UNKNOWN', 'someguy.lee@domain.com', 0, 1, 1, 1, 1, 4, 1, 1, 1, 1, NULL, NULL);

INSERT INTO `users_roles` (`user_rol_ID`, `role`, `deleted`) VALUES
(1,'admin',0),
(2,'professor',0),
(3,'student',0);


INSERT INTO `users_credentials` (`user_credential_ID`, `user_name`, `password`, `user_rol`, `user`, `user_supervisor`) VALUES
(1,'admin','admin',1,NULL,NULL),
(2,'prof','prof',2,NULL,1),
(3,'student','student',3,1,NULL);

INSERT INTO `courses` (`course_ID`, `notes`, `actual_start_date`, `institution`, `place`, `credits`, `course_name`, `academic_year`, `is_in_manifesto`, `is_by_UNITN`, `is_paid`, `budgeted_cost`, `actual_cost`, `planned_course_period`, `are_all_marks_defined`, `url`, `is_payment_completed`, `deleted`, `professor`) VALUES
(1,'internal course / not started',NULL,'University of Trento','Povo 0, room 202',3,'Web Engineering',2012,1,1,1,1000,0,'Summer 2012',0,'http://summer-course.org',0,0,1),
(2,'external course',NULL,'University of Bolzano','Bolzano',3,'Human Computer Interaction',2012,0,0,0,0,0,'UNKNOWN',0,'http://bolzano-courses.edu/hci',0,0,NULL),
(3,'internal course / started','2012-04-05','Universiti of Trento','Povo 1, room 12',3,'Research Methodology II',2012,1,1,1,3000,0,'Spring 2012',0,'http://research-methodology.net',0,0,1),
(4,'internal course / finished','2012-02-01','University of Trento','Povo 0, room Ofek',3,'Research Methodology I',2012,1,1,1,5000,4500,'Winter 2012',1,'http://research-methodology.net',0,0,1),
(5,NULL,NULL,'Università','Trento',NULL,'Matematica',2012,0,1,NULL,10000,8000,'Ottobre 2013',0,'www.cheneso.com',0,0,NULL),
(6,NULL,NULL,'Università','Trento',NULL,'Matematica',2012,0,1,NULL,10000,8000,'Ottobre 2013',0,'www.cheneso.com',0,0,NULL),
(7,NULL,NULL,'Università','Trento',NULL,'Matematica',2012,0,1,NULL,10000,8000,'Ottobre 2013',0,'www.cheneso.com',0,0,NULL),
(8,NULL,NULL,'Università','Trento',NULL,'Matematica',2012,0,1,NULL,10000,8000,'Ottobre 2013',0,'www.cheneso.com',0,0,NULL),
(9,NULL,NULL,'Università','Trento',NULL,'Matematica',2012,0,1,NULL,10000,8000,'Ottobre 2013',0,'www.cheneso.com',0,0,NULL),
(10,NULL,NULL,'Università','Trento',NULL,'DEMO',2012,0,1,NULL,10000,8000,'Ottobre 2013',0,'www.cheneso.com',0,0,NULL),
(11,NULL,NULL,'Milano','none',NULL,'Prova Corso Esterno',2012,0,0,NULL,0,0,'none',0,'none',1,0,NULL);

INSERT INTO `courses_enrollments` (`enrollment_ID`, `qualification`, `is_finished`, `credits`, `enrolled_at`, `updated_at`, `course`, `student`, `approved_at`) VALUES
(3,'27',1,5,'2012-05-04 00:00:00',NULL,3,2,NULL),
(4,'21',NULL,12,'2012-05-04 00:00:00',NULL,5,1,NULL),
(5,'30L',NULL,6,'2012-05-04 00:00:00',NULL,6,2,NULL),
(6,'25',NULL,3,'2012-05-04 00:00:00',NULL,7,3,NULL),
(8,'30',NULL,6,'2012-05-07 00:00:00',NULL,8,4,NULL),
(9,'none',NULL,6,'2012-05-07 00:00:00',NULL,6,3,NULL),
(10,'',1,6,'2012-05-15 10:50:18','2012-05-15 10:50:18',4,2,'2012-05-15 10:50:18');


INSERT INTO `trips` (`trip_ID`, `academic_year_id`, `Date_of_request`, `Planned_start_date`, `Planned_Reason_for_Travel`, `status`, `Planned_end_date`, `Planned_destination`, `Planned_means_of_transport`, `is_stopover_requested`, `Reason_for_extraordinary_transport`, `Reason_for_stopover`, `type_of_transportation`, `is_approved`, `are_personal_funds_used`, `personal_funds_amount`, `alternative_fund_1_name`, `alternative_fund_1_manager`, `alternative_fund_1_amount`, `alternative_fund_2_name`, `alternative_fund_2_amount`, `alternative_fund_2_manager`, `has_advisor_approved`, `foreseen_meals_cost`, `foreseen_lodging_cost`, `foreseen_transportation_cost`, `expenses_sustained_before_trip`, `is_advance_payment_requested`, `actual_begin_date_time`, `actual_end_date_time`, `departure_border_cross_datetime`, `arrival_border_cross_datetime`, `actual_destination`, `current_address`, `advance_payment_received`, `requested_payment_method`, `self_declaration_missing_recepits`, `other_declarations`, `Travel_tickets`, `personal_veichle_KM_travelled`, `personal_veichle_colleagues`, `highway_toll_fees`, `total_transport_expenses`, `total_lodging_expenses`, `number_of_nights`, `num_lodging_receipts`, `num_meals_invoices`, `num_days_of_meals`, `total_meal_expenses`, `registration_fee`, `other_costs_amount`, `other_costs_description`, `total_expenses`, `created_at`, `updated_at`, `reimb_transport_expenses`, `date_reim_request_submitted`, `reimb_lodging_expenses`, `reimb_extra_costs`, `deleted`, `student`, `has_coord_approved`, `has_fund_1_mgr_approved`, `has_fund_2_mgr_approved`) VALUES
(26,2011,'2012-04-15','2012-01-02','work','ACCEPT','2012-02-01','Italy','bus',0,'null','null','plane',0,1,700,NULL,NULL,NULL,NULL,NULL,NULL,0,234,234,234,3545,0,'2011-04-28 00:00:00','2011-04-30 00:00:00','2012-01-01 11:11:00','2012-01-01 11:11:00','naples','Digitex',2000,'Bank Account',NULL,'non lo voglio','ticket',NULL,'null',NULL,NULL,11.11,11,11,11,11,11.11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-28',NULL,NULL,0,1,1,0,0),
(32,2012,'2012-04-26','2012-10-14','work','REFUSE','2012-11-14','Italy','bus',0,'null','null','plane',1,1,700,NULL,NULL,NULL,NULL,NULL,NULL,0,6456,3141,534,232,0,'2010-04-25 00:00:00','2010-04-28 00:00:00','2012-01-01 11:11:00','2012-01-01 11:11:00','naples','Digitex',2000,'Bank Account',' ','non lo voglio','ticket',NULL,'null',NULL,NULL,11.11,11,11,11,11,11.11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-28',NULL,NULL,1,1,1,1,0),
(33,2012,'2012-04-26','2012-10-14','work','ACCEPTED','2012-11-14','Italy','bus',0,'null','null','plane',1,1,700,NULL,NULL,NULL,NULL,NULL,NULL,1,242,645,234,3543,0,'2009-04-22 00:00:00','2009-04-28 00:00:00','2011-01-01 11:11:00','2012-01-01 11:11:00','rome','Digitex',2000,'Bank Account',' ','non lo voglio','ticket',NULL,'null',NULL,NULL,11.11,11,11,11,11,11.11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-28',NULL,NULL,1,4,1,0,0),
(34,2012,'2012-04-26','1998-01-15','work','ACCEPT','2003-02-02','naples','bus',0,'keep to the class','Aperitivo','plane',1,1,264,NULL,NULL,NULL,NULL,NULL,NULL,1,123,345,234,2342,0,'2012-04-22 00:00:00','2012-04-28 00:00:00','2012-04-28 00:00:00','2012-04-28 00:00:00','naples','Via Piazza 9',0,'BANK',' ','non lo voglio','ticket',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,0),
(35,2012,'2011-04-26','1998-01-15','work','ACCEPT','2003-02-02','Italy','bus',0,'null','null','plane',1,1,700,NULL,NULL,NULL,NULL,NULL,NULL,1,245,234,534,435,0,'2011-04-28 00:00:00','2011-05-01 00:00:00','2012-01-01 11:11:00','2012-01-01 11:11:00','naples','Digitex',2000,'Bank Account',' ','non lo voglio','ticket',NULL,'null',NULL,NULL,11.11,11,11,11,11,11.11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-28',NULL,NULL,1,4,0,0,0),
(36,2012,'2012-04-26','2012-05-10','work','ACCEPT','2012-06-15','rome','bus',0,'keep to the class','Aperitivo','plane',0,1,700,'',NULL,NULL,NULL,NULL,NULL,1,100,150,234,2342,0,'2011-04-20 00:00:00','2011-04-28 00:00:00','2012-02-02 10:22:00','2012-01-02 10:22:00','rome','via manci 27, Trento',20000,'MATTE CAZZO',' ','non lo voglio','ticket',NULL,'null',0,0,10,10,10,10,10,10,11,0,NULL,0,'2012-04-28 11:24:36','2012-04-28 11:24:36',0,'2012-05-10',0,0,0,2,1,0,0),
(37,2012,'2012-04-15','2013-01-01','work','INWAIT','2013-02-02','Billund','taxi',0,'keep to the class','Aperitivo','plane',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1000,1000,5000,0,0,'2011-04-17 11:17:25','2011-04-30 11:17:25','2012-04-30 11:17:25','2012-04-30 11:17:25','rome','trento',0,'BANK',NULL,'none','ticket',NULL,NULL,NULL,0,0,43,NULL,NULL,NULL,NULL,1,0,NULL,0,'2010-04-20 11:17:25','2010-04-30 11:17:25',0,'2012-04-30',0,0,1,2,1,0,0),
(41,2012,'2012-04-15','2014-10-11','work','REFUSE','2014-12-11','Billund','feet',0,'keep to the class','Aperitivo','plane',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,123,123,123,4123,0,'2011-04-22 11:17:25','2011-04-30 11:17:25','2012-04-30 11:17:25','2012-04-30 11:17:25','rome','trento',0,'BANK',NULL,'none','ticket',NULL,NULL,NULL,0,0,21,NULL,NULL,NULL,NULL,123.1,123.1,'12323',0,NULL,NULL,0,NULL,0,0,0,6,1,1,0),
(42,2012,'2012-04-15','2015-10-11','taci','INWAIT','2015-12-11','prima o poi lo scopro','che',1,'Tahiti','Aperitivo','sono',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,123.1,123.1,123.1,0.1,0,NULL,NULL,NULL,NULL,NULL,'curioso',NULL,'BANK',NULL,'di','sapere perchè mai? XD',NULL,NULL,NULL,0,0,21,NULL,NULL,NULL,NULL,123.1,123.1,'12323',0,NULL,NULL,0,NULL,0,0,1,1,1,0,0),
(43,2011,'2012-04-15','2014-11-01','interesting reasons','REFUSE','2015-01-01','N.Y.','bus',1,'Mancester','Aperitivo','plane',0,1,12431,NULL,NULL,NULL,NULL,NULL,NULL,0,1121.31,1313.13,1221.2,10,0,NULL,NULL,NULL,NULL,NULL,'trento',NULL,'BANK',NULL,'no comment','plane ticket number 1, etc..',NULL,NULL,NULL,0,0,60,NULL,NULL,NULL,NULL,131,1311.31,'1',0,NULL,NULL,0,NULL,0,0,1,5,0,0,0),
(44,2011,'2012-04-15','2016-01-11','reason','REFUSE','2016-09-11','L.A.','car',1,'Lisbona','Aperitivo','plane',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,12412,21412,1001,0,0,NULL,NULL,NULL,NULL,NULL,'bologna',NULL,'CASH',NULL,'declaration','ticket',NULL,NULL,NULL,0,0,8,NULL,NULL,NULL,NULL,1224,121212,'21',0,NULL,NULL,0,NULL,0,0,1,5,0,0,0),
(45,2011,'2012-04-15','2014-04-28','ananas','ABORTED','2015-02-28','Australia','auto',1,'Tripoli','Aperitivo','plane',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,45745,21447,12231,0,0,NULL,NULL,NULL,NULL,NULL,'ora',NULL,'OTHER',NULL,'mela','arancia',NULL,NULL,NULL,0,0,9,NULL,NULL,NULL,NULL,536,0,'0',0,NULL,NULL,0,NULL,0,0,1,5,0,0,0),
(46,2011,'2012-04-15','2012-05-11','no reason','INWAIT','2012-05-01','rome','bus',0,'no','Aperitivo','train',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,110,111,111,0,NULL,NULL,NULL,NULL,NULL,NULL,'london',NULL,'CASH',NULL,'afsf','asf',NULL,NULL,NULL,0,0,1,NULL,NULL,NULL,NULL,1,0,'0',0,NULL,NULL,0,NULL,0,0,1,5,0,0,0),
(47,2012,'2012-04-16','2012-05-22','lol','ACCEPTED','2012-05-02','bari','car',1,'fa','si','train',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,43,121,111,1,NULL,NULL,NULL,NULL,NULL,NULL,'mezzocorona',NULL,'CASH',NULL,'lul','lal',NULL,NULL,NULL,0,0,2,NULL,NULL,NULL,NULL,12,121,'2',0,NULL,NULL,0,NULL,0,0,0,6,0,0,0),
(48,2021,'2012-01-01','2021-12-12','ciaoooo','ACCEPT','2021-12-14','ginevra','bus',0,'none','null','plane',0,0,10000,'null',1,1234,'null',0,0,1,123,123,123,12,NULL,NULL,NULL,NULL,NULL,NULL,'dresda',NULL,'BANK',NULL,'ciao','ciaojojo',NULL,NULL,NULL,0,0,1,NULL,NULL,NULL,NULL,111,111,'1',603,'2012-05-03 00:00:00','2012-05-03 00:00:00',0,NULL,0,0,1,1,1,0,0);


-- STATISTICS models


INSERT INTO `data_set` (`id`, `description`) VALUES
(1, 'datasets.StudentsByNationality'),
(2, 'datasets.FirstYStudentsByNationality'),
(3, 'datasets.FirstYStudentsByNationalityLast5Years'),
(4, 'datasets.ScholarshipOver5bySource'),
(5, 'datasets.AverageMark'),
(6, 'datasets.AvgMonthAbroadByCycleFor5Cycles'),
(7, 'datasets.AvgMonthAbroadByCycleByInstitutionFor5CyclesHistorically');


INSERT INTO `widget` (`id`, `name`, `description`) VALUES
(1, 'Pie Chart', 'PieChart'),
(2, 'Area Chart', 'AreaChart'),
(3, 'Vertical Bar Chart', 'ColumnChart'),
(4, 'Orizontal Bar Chart', 'BarChart');


INSERT INTO `report` (`id`, `name`, `description`, `is_public`) VALUES
(1, 'Distribution of 1st year admitted students by nationality for the current year ', 'distribution of first year admitted students by nationality', 1),
(2, 'Distribution of 1st year admitted students by nationality, over the last 5 years ', 'distribution of 1st year admitted students by nationality, over the last 5 years ', 0),
(3, 'Distribution of current students by nationality ', 'distribution of current students by nationality ', 0),
(4, 'Number of scholarships over the last 5 years, classified by source (UNITN, DISI, Research center, Company, Other) ', 'number of scholarships over the last 5 years, classified by source ', 0),
(5, 'Average number of months spent abroad, by cycle, historically (for 5 cycles) ', 'average number of months spent abroad, by cycle, historically', 0),
(6, 'Average number of months spent abroad, by cycle and by funding institution, historically (for 5 cycles) ', 'average number of months spent abroad, by cycle and by funding institution, historically', 1),
(7, 'Average mark in courses by funding institution, over the past 5 years', 'Average mark in courses by funding institution, considered over the past 5 years.', 1),
(10, 'Report di prova', 'jhasbdghjbsah dbsabdhjs abdhjbdshjds fdsbhfjdsh fnsd hjbds', 1);



INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Current Students', 'Statistic reports about students'' marks, for current students'),
(2, 'Student Scholarships', 'Statistic reports about student scholarships over the last 5 years'),
(3, 'Student Marks', 'Students marks'),
(4, 'Time Spent Abroad', 'Number of month spent abroad'),
(6, 'Categoria di prova', 'asdasd');


INSERT INTO `statistic` (`id`, `name`, `description`, `format`, `num_visits`, `widget_options`, `dataset_options`, `widget_id`, `dataset_id`) VALUES
(1, 'Distribution of 1st year admitted students by nationality for the current year ', 'The graph shows the list of countries, each one with the percentage of students from that country admitted to the 1st year ', NULL, NULL, NULL, NULL, 1, 2),
(2, 'Distribution of current students by nationality ', 'The graph shows the list of countries, each one with the percentage of students from that country currently enrolled ', NULL, NULL, NULL, NULL, 1, 1),
(3, 'Distribution of 1st year admitted students by nationality, over the last 5 years ', 'The graphs shows the list of countries, each one with the percentage of students from that country admitted over the last 5 years ', NULL, NULL, '{"isStacked":true}', NULL, 2, 3),
(4, 'Number of scholarships over the last 5 years, ', 'The graph shows the number of scholarships over the last 5 years, classified by source (UNITN, DISI, Research center, Company, Other) ', NULL, NULL, NULL, NULL, 2, 4),
(5, 'Average number of months spent abroad, by cycle, historically (for 5 cycles) ', 'The graph shows the average number of months spent abroad by cycle, fo 5 cycles', NULL, NULL, NULL, NULL, 3, 6),
(6, 'Average number of months spent abroad, by cycle and by funding institution, historically (for 5 cycles) ', 'The graph shows the average number of months spent abroad by cycles and by funding institution, for 5 years', NULL, NULL, NULL, NULL, 2, 7),
(7, 'Average mark in courses by funding institution, over the past 5 years', 'The graph shows the average mark in courses by funding institution, over the past 5 years. Note that any "-1" value means there was no student taking exams with a scholarship from that funding institution, during the considered academic year.', NULL, NULL, NULL, NULL, 3, 5);


INSERT INTO `report_category` (`report_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(7, 3),
(5, 4),
(6, 4),
(10, 6);


INSERT INTO `report_statistic` (`report_id`, `statistic_id`) VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(6, 6),
(7, 7);


INSERT INTO `report_users_roles` (`report_id`, `users_roles_user_rol_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 2),
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

DELETE FROM `trips`;
DELETE FROM `courses_enrollments`;
DELETE FROM `courses`;
DELETE FROM `users_credentials`;
DELETE FROM `users_roles`;
DELETE FROM `students`;
DELETE FROM `supervisors`;
DELETE FROM `universities`;
DELETE FROM `funding_institutions`;
DELETE FROM `countries`;
