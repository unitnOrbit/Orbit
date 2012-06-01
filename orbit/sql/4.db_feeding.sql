
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
