CREATE DATABASE alarm
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
use alarm;
set names utf8;

drop table if exists events;
create table events
(
	id				int(11) NOT NULL AUTO_INCREMENT,
	event_id		varchar(64),
	endpoint        varchar(128),
	counter         varchar(256),
	max_step        int(11),
	current_step    int(11),
	priority        int(11),
	expression_id	int(11),
	strategy_id		int(11),
	content			varchar(4096),
	note            varchar(256),
	status			varchar(32),
	team			varchar(64),
	event_time      timestamp,
	PRIMARY KEY (`id`),
	UNIQUE KEY `idx_event_time` (`event_id`, `event_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

drop table if exists alerts;
create table alerts
(
	id				int(11) NOT NULL AUTO_INCREMENT,
	event_id		varchar(64),
	endpoint        varchar(128),
	counter         varchar(256),
	max_step        int(11),
	current_step    int(11),
	priority        int(11),
	expression_id	int(11),
	strategy_id		int(11),
	content			varchar(4096),
	note            varchar(256),
	status			varchar(32),
	team			varchar(64),
	modify_time		timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	event_time      timestamp,
	recovery_time	timestamp,
	PRIMARY KEY (`id`),
	UNIQUE KEY `idx_event_time` (`event_id`, `event_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

