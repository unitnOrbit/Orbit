# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table category (
  id                        bigint not null,
  name                      varchar(255),
  description               varchar(255),
  constraint pk_category primary key (id))
;

create table countries (
  country_ID                integer not null,
  name                      varchar(255),
  region                    varchar(255),
  citizenship               varchar(255),
  deleted                   boolean,
  constraint pk_countries primary key (country_ID))
;

create table courses (
  course_ID                 integer not null,
  actual_start_date         timestamp,
  notes                     clob,
  institution               varchar(255),
  place                     varchar(255),
  credits                   integer,
  course_name               varchar(255),
  academic_year             integer,
  is_in_manifesto           boolean,
  is_by_UNITN               boolean,
  is_paid                   boolean,
  budgeted_cost             integer,
  actual_cost               integer,
  planned_course_period     varchar(255),
  are_all_marks_defined     boolean,
  url                       varchar(255),
  is_payment_completed      boolean,
  deleted                   boolean,
  professor                 integer,
  constraint pk_courses primary key (course_ID))
;

create table courses_enrollments (
  enrollment_ID             integer not null,
  enrolled_at               timestamp,
  updated_at                timestamp,
  qualification             varchar(255),
  is_finished               boolean,
  credits                   integer,
  student                   integer not null,
  course                    integer not null,
  constraint pk_courses_enrollments primary key (enrollment_ID))
;

create table data_set (
  id                        bigint not null,
  description               varchar(255),
  constraint pk_data_set primary key (id))
;

create table funding_institutions (
  funding_institution_ID    integer not null,
  name                      varchar(255),
  deleted                   boolean,
  type                      varchar(255),
  constraint pk_funding_institutions primary key (funding_institution_ID))
;

create table repo (
  id                        bigint not null,
  name                      varchar(255),
  description               varchar(255),
  constraint pk_repo primary key (id))
;

create table statistic (
  id                        bigint not null,
  name                      varchar(255),
  description               varchar(255),
  num_visits                integer,
  widget_id                 bigint not null,
  dataset_id                bigint not null,
  constraint pk_statistic primary key (id))
;

create table students (
  user_ID                   integer not null,
  date_of_birth             timestamp,
  graduation_date           timestamp,
  first_name                varchar(255),
  last_name                 varchar(255),
  full_name                 varchar(255),
  phd_cycle                 varchar(255),
  is_suspended              boolean,
  course_year               integer,
  admitted_conditionally    boolean,
  legal_residence           varchar(255),
  current_domicile          varchar(255),
  place_of_birth            varchar(255),
  office_phone              varchar(255),
  mobile_phone              varchar(255),
  office_working_place      varchar(255),
  locker_number             varchar(255),
  phd_scholarship           boolean,
  scholarship_type          varchar(255),
  yearly_fee_to_center      integer,
  yearly_fee_to_school      integer,
  has_pc_rights             boolean,
  pre_doctoral_scholarship  varchar(255),
  months_predoc_scholarship integer,
  year_extension_scholarship varchar(255),
  months                    integer,
  personal_funds_available  integer,
  is_graduated              boolean,
  commitee_members          varchar(255),
  email                     varchar(255),
  deleted                   boolean,
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
  supervisor_ID             integer not null,
  first_name                varchar(255),
  last_name                 varchar(255),
  can_be_advisor            boolean,
  is_active                 boolean,
  is_internal               boolean,
  email                     varchar(255),
  deleted                   boolean,
  constraint pk_supervisors primary key (supervisor_ID))
;

create table trips (
  trip_ID                   integer not null,
  Planned_start_date        timestamp,
  Planned_end_date          timestamp,
  actual_begin_date_time    timestamp,
  actual_end_date_time      timestamp,
  departure_border_cross_datetime timestamp,
  arrival_border_cross_datetime timestamp,
  created_at                timestamp,
  updated_at                timestamp,
  date_reim_request_submitted timestamp,
  academic_year_id          integer,
  Date_of_request           integer,
  Planned_Reason_for_Travel varchar(255),
  status                    varchar(255),
  Planned_destination       varchar(255),
  Planned_means_of_transport varchar(255),
  is_stopover_requested     boolean,
  Reason_for_extraordinary_transport varchar(255),
  Reason_for_stopover       varchar(255),
  type_of_transportation    varchar(255),
  is_approved               boolean,
  are_personal_funds_used   boolean,
  personal_funds_amount     integer,
  alternative_fund_1_name   varchar(255),
  alternative_fund_1_manager integer,
  alternative_fund_1_amount integer,
  alternative_fund_2_name   varchar(255),
  alternative_fund_2_amount integer,
  alternative_fund_2_manager integer,
  has_advisor_approved      boolean,
  foreseen_meals_cost       float,
  foreseen_lodging_cost     float,
  foreseen_transportation_cost float,
  expenses_sustained_before_trip float,
  is_advance_payment_requested boolean,
  actual_destination        varchar(255),
  current_address           varchar(255),
  advance_payment_received  float,
  requested_payment_method  varchar(255),
  self_declaration_missing_recepits clob,
  other_declarations        clob,
  Travel_tickets            clob,
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
  deleted                   boolean,
  has_coord_approved        boolean,
  has_fund_1_mgr_approved   boolean,
  has_fund_2_mgr_approved   boolean,
  student                   integer not null,
  constraint pk_trips primary key (trip_ID))
;

create table universities (
  university_ID             integer not null,
  name_university           varchar(255),
  location                  varchar(255),
  deleted                   boolean,
  country                   integer,
  constraint pk_universities primary key (university_ID))
;

create table users_credentials (
  user_credential_ID        integer not null,
  user_name                 varchar(255),
  password                  varchar(255),
  user_rol                  integer not null,
  user                      integer not null,
  constraint pk_users_credentials primary key (user_credential_ID))
;

create table user_group (
  id                        bigint not null,
  type_user                 varchar(255),
  constraint pk_user_group primary key (id))
;

create table users_roles (
  user_rol_ID               integer not null,
  role                      varchar(255),
  deleted                   boolean,
  constraint pk_users_roles primary key (user_rol_ID))
;

create table widget (
  id                        bigint not null,
  name                      varchar(255),
  description               varchar(255),
  constraint pk_widget primary key (id))
;


create table repo_statistic (
  repo_id                        bigint not null,
  statistic_id                   bigint not null,
  constraint pk_repo_statistic primary key (repo_id, statistic_id))
;

create table repo_category (
  repo_id                        bigint not null,
  category_id                    bigint not null,
  constraint pk_repo_category primary key (repo_id, category_id))
;
create sequence category_seq;

create sequence countries_seq;

create sequence courses_seq;

create sequence courses_enrollments_seq;

create sequence data_set_seq;

create sequence funding_institutions_seq;

create sequence repo_seq;

create sequence statistic_seq;

create sequence students_seq;

create sequence supervisors_seq;

create sequence trips_seq;

create sequence universities_seq;

create sequence users_credentials_seq;

create sequence user_group_seq;

create sequence users_roles_seq;

create sequence widget_seq;

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



alter table repo_statistic add constraint fk_repo_statistic_repo_01 foreign key (repo_id) references repo (id) on delete restrict on update restrict;

alter table repo_statistic add constraint fk_repo_statistic_statistic_02 foreign key (statistic_id) references statistic (id) on delete restrict on update restrict;

alter table repo_category add constraint fk_repo_category_repo_01 foreign key (repo_id) references repo (id) on delete restrict on update restrict;

alter table repo_category add constraint fk_repo_category_category_02 foreign key (category_id) references category (id) on delete restrict on update restrict;

# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists category;

drop table if exists repo_category;

drop table if exists countries;

drop table if exists courses;

drop table if exists courses_enrollments;

drop table if exists data_set;

drop table if exists funding_institutions;

drop table if exists repo;

drop table if exists repo_statistic;

drop table if exists statistic;

drop table if exists students;

drop table if exists supervisors;

drop table if exists trips;

drop table if exists universities;

drop table if exists users_credentials;

drop table if exists user_group;

drop table if exists users_roles;

drop table if exists widget;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists category_seq;

drop sequence if exists countries_seq;

drop sequence if exists courses_seq;

drop sequence if exists courses_enrollments_seq;

drop sequence if exists data_set_seq;

drop sequence if exists funding_institutions_seq;

drop sequence if exists repo_seq;

drop sequence if exists statistic_seq;

drop sequence if exists students_seq;

drop sequence if exists supervisors_seq;

drop sequence if exists trips_seq;

drop sequence if exists universities_seq;

drop sequence if exists users_credentials_seq;

drop sequence if exists user_group_seq;

drop sequence if exists users_roles_seq;

drop sequence if exists widget_seq;

