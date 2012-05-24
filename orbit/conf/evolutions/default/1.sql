# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table category (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  description               varchar(255),
  constraint pk_category primary key (id))
;

create table countries (
  country_ID                integer auto_increment not null,
  name                      varchar(255),
  region                    varchar(255),
  citizenship               varchar(255),
  deleted                   tinyint(1) default 0,
  constraint pk_countries primary key (country_ID))
;

create table courses (
  course_ID                 integer auto_increment not null,
  actual_start_date         datetime,
  notes                     longtext,
  institution               varchar(255),
  place                     varchar(255),
  credits                   integer,
  course_name               varchar(255),
  academic_year             integer,
  is_in_manifesto           tinyint(1) default 0,
  is_by_UNITN               tinyint(1) default 0,
  is_paid                   tinyint(1) default 0,
  budgeted_cost             integer,
  actual_cost               integer,
  planned_course_period     varchar(255),
  are_all_marks_defined     tinyint(1) default 0,
  url                       varchar(255),
  is_payment_completed      tinyint(1) default 0,
  deleted                   tinyint(1) default 0,
  professor                 integer,
  constraint pk_courses primary key (course_ID))
;

create table courses_enrollments (
  enrollment_ID             integer auto_increment not null,
  enrolled_at               datetime,
  updated_at                datetime,
  qualification             varchar(255),
  is_finished               tinyint(1) default 0,
  credits                   integer,
  student                   integer not null,
  course                    integer not null,
  constraint pk_courses_enrollments primary key (enrollment_ID))
;

create table data_set (
  id                        bigint auto_increment not null,
  description               varchar(255),
  constraint pk_data_set primary key (id))
;

create table funding_institutions (
  funding_institution_ID    integer auto_increment not null,
  name                      varchar(255),
  deleted                   tinyint(1) default 0,
  type                      varchar(255),
  constraint pk_funding_institutions primary key (funding_institution_ID))
;

create table report (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  description               varchar(255),
  constraint pk_report primary key (id))
;

create table statistic (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  description               varchar(255),
  format                    varchar(255),
  num_visits                integer,
  widget_options            varchar(255),
  dataset_options           varchar(255),
  widget_id                 bigint not null,
  dataset_id                bigint not null,
  constraint pk_statistic primary key (id))
;

create table students (
  user_ID                   integer auto_increment not null,
  date_of_birth             datetime,
  graduation_date           datetime,
  first_name                varchar(255),
  last_name                 varchar(255),
  full_name                 varchar(255),
  phd_cycle                 varchar(255),
  is_suspended              tinyint(1) default 0,
  course_year               integer,
  admitted_conditionally    tinyint(1) default 0,
  legal_residence           varchar(255),
  current_domicile          varchar(255),
  place_of_birth            varchar(255),
  office_phone              varchar(255),
  mobile_phone              varchar(255),
  office_working_place      varchar(255),
  locker_number             varchar(255),
  phd_scholarship           tinyint(1) default 0,
  scholarship_type          varchar(255),
  yearly_fee_to_center      integer,
  yearly_fee_to_school      integer,
  has_pc_rights             tinyint(1) default 0,
  pre_doctoral_scholarship  varchar(255),
  months_predoc_scholarship integer,
  year_extension_scholarship varchar(255),
  months                    integer,
  personal_funds_available  integer,
  is_graduated              tinyint(1) default 0,
  commitee_members          varchar(255),
  email                     varchar(255),
  deleted                   tinyint(1) default 0,
  Italian_Taxpayer_Code     integer,
  university_of_provenance  integer not null,
  university                integer not null,
  funding_institution       integer not null,
  country_of_provenance     integer not null,
  citizenship               integer not null,
  funds_owner               integer not null,
  tutor                     integer not null,
  current_advisor           integer not null,
  constraint pk_students primary key (user_ID))
;

create table supervisors (
  supervisor_ID             integer auto_increment not null,
  first_name                varchar(255),
  last_name                 varchar(255),
  can_be_advisor            tinyint(1) default 0,
  is_active                 tinyint(1) default 0,
  is_internal               tinyint(1) default 0,
  email                     varchar(255),
  deleted                   tinyint(1) default 0,
  constraint pk_supervisors primary key (supervisor_ID))
;

create table trips (
  trip_ID                   integer auto_increment not null,
  Planned_start_date        datetime,
  Planned_end_date          datetime,
  actual_begin_date_time    datetime,
  actual_end_date_time      datetime,
  departure_border_cross_datetime datetime,
  arrival_border_cross_datetime datetime,
  created_at                datetime,
  updated_at                datetime,
  date_reim_request_submitted datetime,
  academic_year_id          integer,
  Date_of_request           integer,
  Planned_Reason_for_Travel varchar(255),
  status                    varchar(255),
  Planned_destination       varchar(255),
  Planned_means_of_transport varchar(255),
  is_stopover_requested     tinyint(1) default 0,
  Reason_for_extraordinary_transport varchar(255),
  Reason_for_stopover       varchar(255),
  type_of_transportation    varchar(255),
  is_approved               tinyint(1) default 0,
  are_personal_funds_used   tinyint(1) default 0,
  personal_funds_amount     integer,
  alternative_fund_1_name   varchar(255),
  alternative_fund_1_manager integer,
  alternative_fund_1_amount integer,
  alternative_fund_2_name   varchar(255),
  alternative_fund_2_amount integer,
  alternative_fund_2_manager integer,
  has_advisor_approved      tinyint(1) default 0,
  foreseen_meals_cost       float,
  foreseen_lodging_cost     float,
  foreseen_transportation_cost float,
  expenses_sustained_before_trip float,
  is_advance_payment_requested tinyint(1) default 0,
  actual_destination        varchar(255),
  current_address           varchar(255),
  advance_payment_received  float,
  requested_payment_method  varchar(255),
  self_declaration_missing_recepits longtext,
  other_declarations        longtext,
  Travel_tickets            longtext,
  personal_veichle_KM_travelled integer,
  personal_veichle_colleagues varchar(255),
  highway_toll_fees         float,
  total_transport_expenses  float,
  total_lodging_expenses    float,
  number_of_nights          integer,
  num_lodging_receipts      integer,
  num_meals_invoices        integer,
  num_days_of_meals         integer,
  total_meal_expenses       float,
  registration_fee          float,
  other_costs_amount        float,
  other_costs_description   integer,
  total_expenses            float,
  reimb_transport_expenses  float,
  reimb_lodging_expenses    float,
  reimb_extra_costs         float,
  deleted                   tinyint(1) default 0,
  has_coord_approved        tinyint(1) default 0,
  has_fund_1_mgr_approved   tinyint(1) default 0,
  has_fund_2_mgr_approved   tinyint(1) default 0,
  student                   integer not null,
  constraint pk_trips primary key (trip_ID))
;

create table universities (
  university_ID             integer auto_increment not null,
  name_university           varchar(255),
  location                  varchar(255),
  deleted                   tinyint(1) default 0,
  country                   integer,
  constraint pk_universities primary key (university_ID))
;

create table users_credentials (
  user_credential_ID        integer auto_increment not null,
  user_name                 varchar(255),
  password                  varchar(255),
  user_rol                  integer not null,
  user                      integer not null,
  constraint pk_users_credentials primary key (user_credential_ID))
;

create table user_group (
  id                        bigint auto_increment not null,
  type_user                 varchar(255),
  constraint pk_user_group primary key (id))
;

create table users_roles (
  user_rol_ID               integer auto_increment not null,
  role                      varchar(255),
  deleted                   tinyint(1) default 0,
  constraint pk_users_roles primary key (user_rol_ID))
;

create table widget (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  description               varchar(255),
  constraint pk_widget primary key (id))
;


create table report_statistic (
  report_id                      bigint not null,
  statistic_id                   bigint not null,
  constraint pk_report_statistic primary key (report_id, statistic_id))
;

create table report_category (
  report_id                      bigint not null,
  category_id                    bigint not null,
  constraint pk_report_category primary key (report_id, category_id))
;
alter table courses add constraint fk_courses_professor_1 foreign key (professor) references supervisors (supervisor_ID) on delete restrict on update restrict;
create index ix_courses_professor_1 on courses (professor);
alter table courses_enrollments add constraint fk_courses_enrollments_student_2 foreign key (student) references students (user_ID) on delete restrict on update restrict;
create index ix_courses_enrollments_student_2 on courses_enrollments (student);
alter table courses_enrollments add constraint fk_courses_enrollments_course_3 foreign key (course) references courses (course_ID) on delete restrict on update restrict;
create index ix_courses_enrollments_course_3 on courses_enrollments (course);
alter table statistic add constraint fk_statistic_widget_4 foreign key (widget_id) references widget (id) on delete restrict on update restrict;
create index ix_statistic_widget_4 on statistic (widget_id);
alter table statistic add constraint fk_statistic_dataset_5 foreign key (dataset_id) references data_set (id) on delete restrict on update restrict;
create index ix_statistic_dataset_5 on statistic (dataset_id);
alter table students add constraint fk_students_universityOfProven_6 foreign key (university_of_provenance) references universities (university_ID) on delete restrict on update restrict;
create index ix_students_universityOfProven_6 on students (university_of_provenance);
alter table students add constraint fk_students_university_7 foreign key (university) references universities (university_ID) on delete restrict on update restrict;
create index ix_students_university_7 on students (university);
alter table students add constraint fk_students_fundingInstitution_8 foreign key (funding_institution) references funding_institutions (funding_institution_ID) on delete restrict on update restrict;
create index ix_students_fundingInstitution_8 on students (funding_institution);
alter table students add constraint fk_students_countryOfProvenanc_9 foreign key (country_of_provenance) references countries (country_ID) on delete restrict on update restrict;
create index ix_students_countryOfProvenanc_9 on students (country_of_provenance);
alter table students add constraint fk_students_citizenship_10 foreign key (citizenship) references countries (country_ID) on delete restrict on update restrict;
create index ix_students_citizenship_10 on students (citizenship);
alter table students add constraint fk_students_fundsOwner_11 foreign key (funds_owner) references supervisors (supervisor_ID) on delete restrict on update restrict;
create index ix_students_fundsOwner_11 on students (funds_owner);
alter table students add constraint fk_students_tutor_12 foreign key (tutor) references supervisors (supervisor_ID) on delete restrict on update restrict;
create index ix_students_tutor_12 on students (tutor);
alter table students add constraint fk_students_currentAdvisor_13 foreign key (current_advisor) references supervisors (supervisor_ID) on delete restrict on update restrict;
create index ix_students_currentAdvisor_13 on students (current_advisor);
alter table trips add constraint fk_trips_student_14 foreign key (student) references students (user_ID) on delete restrict on update restrict;
create index ix_trips_student_14 on trips (student);
alter table universities add constraint fk_universities_country_15 foreign key (country) references countries (country_ID) on delete restrict on update restrict;
create index ix_universities_country_15 on universities (country);
alter table users_credentials add constraint fk_users_credentials_userRol_16 foreign key (user_rol) references users_roles (user_rol_ID) on delete restrict on update restrict;
create index ix_users_credentials_userRol_16 on users_credentials (user_rol);
alter table users_credentials add constraint fk_users_credentials_user_17 foreign key (user) references students (user_ID) on delete restrict on update restrict;
create index ix_users_credentials_user_17 on users_credentials (user);



alter table report_statistic add constraint fk_report_statistic_report_01 foreign key (report_id) references report (id) on delete restrict on update restrict;

alter table report_statistic add constraint fk_report_statistic_statistic_02 foreign key (statistic_id) references statistic (id) on delete restrict on update restrict;

alter table report_category add constraint fk_report_category_report_01 foreign key (report_id) references report (id) on delete restrict on update restrict;

alter table report_category add constraint fk_report_category_category_02 foreign key (category_id) references category (id) on delete restrict on update restrict;

# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table category;

drop table report_category;

drop table countries;

drop table courses;

drop table courses_enrollments;

drop table data_set;

drop table funding_institutions;

drop table report;

drop table report_statistic;

drop table statistic;

drop table students;

drop table supervisors;

drop table trips;

drop table universities;

drop table users_credentials;

drop table user_group;

drop table users_roles;

drop table widget;

SET FOREIGN_KEY_CHECKS=1;

