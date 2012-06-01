# --- Created by Ebean DDL

create table category (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  description               varchar(255),
  constraint pk_category primary key (id))
;
create table data_set (
  id                        bigint auto_increment not null,
  description               varchar(255),
  constraint pk_data_set primary key (id))
;
create table report (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  description               varchar(255),
  is_public                 tinyint(1) default 0,
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
create table user_group (
  id                        bigint auto_increment not null,
  type_user                 varchar(255),
  constraint pk_user_group primary key (id))
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

create table report_users_roles (
  report_id                      bigint not null,
  users_roles_user_rol_ID        integer not null,
  constraint pk_report_users_roles primary key (report_id, users_roles_user_rol_ID))
;
alter table statistic add constraint fk_statistic_widget_4 foreign key (widget_id) references widget (id) on delete restrict on update restrict;
create index ix_statistic_widget_4 on statistic (widget_id);
alter table statistic add constraint fk_statistic_dataset_5 foreign key (dataset_id) references data_set (id) on delete restrict on update restrict;
create index ix_statistic_dataset_5 on statistic (dataset_id);
alter table report_statistic add constraint fk_report_statistic_report_01 foreign key (report_id) references report (id) on delete restrict on update restrict;

alter table report_statistic add constraint fk_report_statistic_statistic_02 foreign key (statistic_id) references statistic (id) on delete restrict on update restrict;

alter table report_category add constraint fk_report_category_report_01 foreign key (report_id) references report (id) on delete restrict on update restrict;

alter table report_category add constraint fk_report_category_category_02 foreign key (category_id) references category (id) on delete restrict on update restrict;

alter table report_users_roles add constraint fk_report_users_roles_report_01 foreign key (report_id) references report (id) on delete restrict on update restrict;

alter table report_users_roles add constraint fk_report_users_roles_users_r_02 foreign key (users_roles_user_rol_ID) references users_roles (user_rol_ID) on delete restrict on update restrict;

