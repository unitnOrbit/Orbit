# Ebean DDL generation disabled for global database

# --- !Ups

--
-- Definition of table `phdcoursedb`.`countries`
--

CREATE TABLE  `phdcoursedb`.`countries` (
  `country_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `region` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `citizenship` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`country_ID`),
  UNIQUE KEY `name_countries_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phdcoursedb`.`countries`
--

/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
LOCK TABLES `countries` WRITE;
INSERT INTO `phdcoursedb`.`countries` VALUES  (1,'Italy','Europe','Italian',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;


--
-- Definition of table `phdcoursedb`.`courses`
--

CREATE TABLE  `phdcoursedb`.`courses` (
  `course_ID` int(11) NOT NULL AUTO_INCREMENT,
  `notes` text CHARACTER SET latin1,
  `actual_start_date` date DEFAULT NULL,
  `institution` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `place` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `credits` int(11) DEFAULT '0',
  `course_name` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `academic_year` int(11) NOT NULL DEFAULT '0',
  `is_in_manifesto` tinyint(1) NOT NULL DEFAULT '0',
  `is_by_UNITN` tinyint(1) NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) DEFAULT NULL,
  `budgeted_cost` int(11) NOT NULL DEFAULT '0',
  `actual_cost` int(11) NOT NULL DEFAULT '0',
  `planned_course_period` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN' COMMENT 'EG summer 2013',
  `are_all_marks_defined` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'have all students been graded?',
  `url` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `is_payment_completed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'did the guy get the money?',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `professor` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_ID`),
  KEY `Professor` (`professor`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`professor`) REFERENCES `supervisors` (`supervisor_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phdcoursedb`.`courses`
--

/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
LOCK TABLES `courses` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;


--
-- Definition of table `phdcoursedb`.`courses_enrollments`
--

CREATE TABLE  `phdcoursedb`.`courses_enrollments` (
  `enrollment_ID` int(11) NOT NULL AUTO_INCREMENT,
  `qualification` varchar(30) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `is_finished` tinyint(1) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `enrolled_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `course` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  PRIMARY KEY (`enrollment_ID`),
  KEY `index_courses_users_on_course_id` (`qualification`),
  KEY `index_courses_users_on_user_id` (`is_finished`),
  KEY `index_courses_users_on_course_id_and_user_id` (`qualification`,`is_finished`),
  KEY `fk_courses_enrollments_courses1` (`course`),
  KEY `fk_courses_enrollments_students1` (`student`),
  CONSTRAINT `fk_courses_enrollments_courses1` FOREIGN KEY (`course`) REFERENCES `courses` (`course_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_enrollments_students1` FOREIGN KEY (`student`) REFERENCES `students` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phdcoursedb`.`courses_enrollments`
--

/*!40000 ALTER TABLE `courses_enrollments` DISABLE KEYS */;
LOCK TABLES `courses_enrollments` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `courses_enrollments` ENABLE KEYS */;


--
-- Definition of table `phdcoursedb`.`funding_institutions`
--

CREATE TABLE  `phdcoursedb`.`funding_institutions` (
  `funding_institution_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN' COMMENT 'Who pays their scholarship',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  PRIMARY KEY (`funding_institution_ID`),
  UNIQUE KEY `funding_institution_name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phdcoursedb`.`funding_institutions`
--

/*!40000 ALTER TABLE `funding_institutions` DISABLE KEYS */;
LOCK TABLES `funding_institutions` WRITE;
INSERT INTO `phdcoursedb`.`funding_institutions` VALUES  (1,'DISI',0,'UNKNOWN');
UNLOCK TABLES;
/*!40000 ALTER TABLE `funding_institutions` ENABLE KEYS */;


--
-- Definition of table `phdcoursedb`.`students`
--

CREATE TABLE  `phdcoursedb`.`students` (
  `user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN' COMMENT 'First and middle name',
  `last_name` varchar(300) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN' COMMENT 'family name',
  `full_name` varchar(500) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN' COMMENT 'name as we want it displayed',
  `phd_cycle` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `course_year` int(3) NOT NULL DEFAULT '0' COMMENT '1,2,3,4,5',
  `admitted_conditionally` tinyint(1) NOT NULL DEFAULT '0',
  `legal_residence` varchar(500) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `current_domicile` varchar(500) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(300) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `office_phone` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `mobile_phone` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `office_working_place` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN' COMMENT 'P1-S5-14 (Pvo1 - Open space 5 - desk 14)',
  `locker_number` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `phd_scholarship` tinyint(1) DEFAULT NULL,
  `scholarship_type` varchar(500) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN' COMMENT 'Specify name of the grant + fund number',
  `yearly_fee_to_center` int(6) NOT NULL DEFAULT '0',
  `yearly_fee_to_school` int(6) NOT NULL DEFAULT '0',
  `has_pc_rights` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Has the right to receive a pc?',
  `pre_doctoral_scholarship` varchar(500) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Specify name fund + fund number ',
  `months_predoc_scholarship` int(2) NOT NULL DEFAULT '0' COMMENT 'Nr. months of predoc scholarship - maximum 6 months',
  `year_extension_scholarship` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '0' COMMENT 'Specify name fund + fund number',
  `months` int(2) NOT NULL DEFAULT '0' COMMENT 'maximum 12 months',
  `personal_funds_available` int(10) NOT NULL DEFAULT '0' COMMENT '750 granted at registration, other 750 when admitted to the second yr',
  `is_graduated` tinyint(1) NOT NULL DEFAULT '0',
  `graduation_date` date DEFAULT NULL,
  `commitee_members` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN' COMMENT 'Commitee members separated by comma',
  `email` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `funding_institution` int(11) NOT NULL COMMENT 'DISI, UNITN, Fbk...ecc',
  `university` int(11) NOT NULL,
  `country_of_provenance` int(11) NOT NULL,
  `university_of_provenance` int(11) NOT NULL,
  `citizenship` int(11) NOT NULL,
  `current_advisor` int(11) NOT NULL,
  `tutor` int(11) NOT NULL,
  `funds_owner` int(11) NOT NULL,
  `Italian_Taxpayer_Code` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  KEY `fk_students_universities` (`university`),
  KEY `fk_funding_institution` (`funding_institution`),
  KEY `fk_students_countries1` (`country_of_provenance`),
  KEY `fk_student_university_provenance` (`university_of_provenance`),
  KEY `fk_student_citizenship` (`citizenship`),
  KEY `fk_students_supervisors1` (`current_advisor`),
  KEY `fk_students_supervisors2` (`tutor`),
  KEY `fk_students_supervisors3` (`funds_owner`),
  CONSTRAINT `fk_students_supervisors1` FOREIGN KEY (`current_advisor`) REFERENCES `supervisors` (`supervisor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_supervisors2` FOREIGN KEY (`tutor`) REFERENCES `supervisors` (`supervisor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_supervisors3` FOREIGN KEY (`funds_owner`) REFERENCES `supervisors` (`supervisor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_citizenship` FOREIGN KEY (`citizenship`) REFERENCES `countries` (`country_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_country` FOREIGN KEY (`country_of_provenance`) REFERENCES `countries` (`country_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_funding_institution` FOREIGN KEY (`funding_institution`) REFERENCES `funding_institutions` (`funding_institution_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_university` FOREIGN KEY (`university`) REFERENCES `universities` (`university_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_university_provenance` FOREIGN KEY (`university_of_provenance`) REFERENCES `universities` (`university_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phdcoursedb`.`students`
--

/*!40000 ALTER TABLE `students` DISABLE KEYS */;
LOCK TABLES `students` WRITE;
INSERT INTO `phdcoursedb`.`students` VALUES  (1,'John Erik','Smith','John E. Smith','28',0,2,0,'via manci 27, Trento','','0000-00-00','New York, NY, USA','123-456789','1231-23456','P1-S5-14','27-A',0,'UNKNOWN',0,0,0,NULL,0,'0',0,0,0,NULL,'UNKNOWN','joe.doe@domain.com',0,1,1,1,1,1,1,1,1,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;


--
-- Definition of table `phdcoursedb`.`supervisors`
--

CREATE TABLE  `phdcoursedb`.`supervisors` (
  `supervisor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `last_name` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `can_be_advisor` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_internal` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`supervisor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phdcoursedb`.`supervisors`
--

/*!40000 ALTER TABLE `supervisors` DISABLE KEYS */;
LOCK TABLES `supervisors` WRITE;
INSERT INTO `phdcoursedb`.`supervisors` VALUES  (1,'Joe','Doe',1,1,1,'joe.doe@gmail.com',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `supervisors` ENABLE KEYS */;


--
-- Definition of table `phdcoursedb`.`trips`
--

CREATE TABLE  `phdcoursedb`.`trips` (
  `trip_ID` int(11) NOT NULL AUTO_INCREMENT,
  `academic_year_id` int(11) DEFAULT NULL,
  `Date_of_request` int(11) DEFAULT NULL,
  `Planned_start_date` date NOT NULL,
  `Planned_Reason_for_Travel` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `Planned_end_date` date NOT NULL,
  `Planned_destination` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Planned_means_of_transport` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `is_stopover_requested` tinyint(1) DEFAULT NULL,
  `Reason_for_extraordinary_transport` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Reason_for_stopover` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `type_of_transportation` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT 'ORDINARY or EXTRAORDINARY',
  `is_approved` tinyint(1) DEFAULT NULL,
  `are_personal_funds_used` tinyint(1) DEFAULT NULL COMMENT 'if used, date of request must be before oct 31st of the 3rd year',
  `personal_funds_amount` int(11) DEFAULT NULL,
  `alternative_fund_1_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `alternative_fund_1_manager` int(11) DEFAULT NULL,
  `alternative_fund_1_amount` int(11) DEFAULT NULL,
  `alternative_fund_2_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `alternative_fund_2_amount` int(11) DEFAULT NULL,
  `alternative_fund_2_manager` int(11) DEFAULT NULL,
  `has_advisor_approved` tinyint(1) NOT NULL,
  `foreseen_meals_cost` float DEFAULT NULL,
  `foreseen_lodging_cost` float DEFAULT NULL,
  `foreseen_transportation_cost` float DEFAULT NULL,
  `expenses_sustained_before_trip` float DEFAULT NULL COMMENT 'eg flight ticket is bought before',
  `is_advance_payment_requested` tinyint(1) DEFAULT NULL,
  `actual_begin_date_time` datetime DEFAULT NULL,
  `actual_end_date_time` datetime DEFAULT NULL,
  `departure_border_cross_datetime` datetime DEFAULT NULL,
  `arrival_border_cross_datetime` datetime DEFAULT NULL,
  `actual_destination` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `current_address` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `advance_payment_received` float DEFAULT NULL,
  `requested_payment_method` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'ENUM. almost always is BANK ACCOUNT',
  `self_declaration_missing_recepits` text CHARACTER SET latin1,
  `other_declarations` text CHARACTER SET latin1,
  `Travel_tickets` text CHARACTER SET latin1,
  `personal_veichle_KM_travelled` int(11) DEFAULT NULL,
  `personal_veichle_colleagues` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `highway_toll_fees` float DEFAULT NULL,
  `total_transport_expenses` float DEFAULT '0',
  `total_lodging_expenses` float DEFAULT '0',
  `number_of_nights` int(11) DEFAULT NULL,
  `num_lodging_receipts` int(11) DEFAULT NULL,
  `num_meals_invoices` int(11) DEFAULT NULL,
  `num_days_of_meals` int(11) DEFAULT NULL,
  `total_meal_expenses` float DEFAULT NULL,
  `registration_fee` float DEFAULT NULL,
  `other_costs_amount` float DEFAULT '0',
  `other_costs_description` int(11) DEFAULT NULL,
  `total_expenses` float DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reimb_transport_expenses` float DEFAULT '0',
  `date_reim_request_submitted` date DEFAULT NULL,
  `reimb_lodging_expenses` float DEFAULT '0',
  `reimb_extra_costs` float DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `student` int(11) NOT NULL,
  `has_coord_approved` tinyint(1) NOT NULL,
  `has_fund_1_mgr_approved` tinyint(1) NOT NULL DEFAULT '0',
  `has_fund_2_mgr_approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trip_ID`),
  KEY `index_travels_on_academic_year_id` (`academic_year_id`),
  KEY `index_travels_on_status` (`status`),
  KEY `index_travels_on_begin_date` (`actual_begin_date_time`),
  KEY `index_travels_on_end_date` (`actual_end_date_time`),
  KEY `index_travels_on_total_expenses` (`total_expenses`),
  KEY `index_travels_on_approved` (`is_approved`),
  KEY `fk_travels_users1` (`student`),
  CONSTRAINT `fk_travels_users1` FOREIGN KEY (`student`) REFERENCES `students` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phdcoursedb`.`trips`
--

/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
LOCK TABLES `trips` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;


--
-- Definition of table `phdcoursedb`.`universities`
--

CREATE TABLE  `phdcoursedb`.`universities` (
  `university_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name_university` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `location` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `country` int(11) DEFAULT NULL,
  PRIMARY KEY (`university_ID`),
  UNIQUE KEY `name_university_UNIQUE` (`name_university`),
  KEY `fk_university_country` (`country`),
  CONSTRAINT `fk_university_country` FOREIGN KEY (`country`) REFERENCES `countries` (`country_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phdcoursedb`.`universities`
--

/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
LOCK TABLES `universities` WRITE;
INSERT INTO `phdcoursedb`.`universities` VALUES  (1,'UNITN','Rome',0,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;


--
-- Definition of table `phdcoursedb`.`users_credentials`
--

CREATE TABLE  `phdcoursedb`.`users_credentials` (
  `user_credential_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `password` varchar(500) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `user_rol` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`user_credential_ID`),
  KEY `fk_users_credentials_users_roles1` (`user_rol`),
  KEY `fk_users_credentials_users1` (`user`),
  CONSTRAINT `fk_users_credentials_users1` FOREIGN KEY (`user`) REFERENCES `students` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_credentials_users_roles1` FOREIGN KEY (`user_rol`) REFERENCES `users_roles` (`user_rol_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phdcoursedb`.`users_credentials`
--

/*!40000 ALTER TABLE `users_credentials` DISABLE KEYS */;
LOCK TABLES `users_credentials` WRITE;
INSERT INTO `phdcoursedb`.`users_credentials` VALUES  (1,'demo','12345',1,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users_credentials` ENABLE KEYS */;


--
-- Definition of table `phdcoursedb`.`users_roles`
--

CREATE TABLE  `phdcoursedb`.`users_roles` (
  `user_rol_ID` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'UNKNOWN',
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_rol_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phdcoursedb`.`users_roles`
--

/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
LOCK TABLES `users_roles` WRITE;
INSERT INTO `phdcoursedb`.`users_roles` VALUES  (1,'admin',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;


# --- !Downs

DROP TABLE IF EXISTS `phdcoursedb`.`countries`;
DROP TABLE IF EXISTS `phdcoursedb`.`courses_enrollments`;
DROP TABLE IF EXISTS `phdcoursedb`.`funding_institutions`;
DROP TABLE IF EXISTS `phdcoursedb`.`students`;
DROP TABLE IF EXISTS `phdcoursedb`.`courses`;
DROP TABLE IF EXISTS `phdcoursedb`.`supervisors`;
DROP TABLE IF EXISTS `phdcoursedb`.`trips`;
DROP TABLE IF EXISTS `phdcoursedb`.`universities`;
DROP TABLE IF EXISTS `phdcoursedb`.`users_credentials`;
DROP TABLE IF EXISTS `phdcoursedb`.`users_roles`;
