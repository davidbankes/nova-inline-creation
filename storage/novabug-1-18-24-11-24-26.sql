# ************************************************************
# Sequel Ace SQL dump
# Version 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.33)
# Database: novabug
# Generation Time: 2024-01-18 16:24:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table action_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `action_events`;

CREATE TABLE `action_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionable_id` bigint unsigned NOT NULL,
  `target_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned DEFAULT NULL,
  `fields` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'running',
  `exception` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `original` mediumtext COLLATE utf8mb4_unicode_ci,
  `changes` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `action_events_actionable_type_actionable_id_index` (`actionable_type`,`actionable_id`),
  KEY `action_events_target_type_target_id_index` (`target_type`,`target_id`),
  KEY `action_events_batch_id_model_type_model_id_index` (`batch_id`,`model_type`,`model_id`),
  KEY `action_events_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `action_events` WRITE;
/*!40000 ALTER TABLE `action_events` DISABLE KEYS */;

INSERT INTO `action_events` (`id`, `batch_id`, `user_id`, `name`, `actionable_type`, `actionable_id`, `target_type`, `target_id`, `model_type`, `model_id`, `fields`, `status`, `exception`, `created_at`, `updated_at`, `original`, `changes`)
VALUES
	(1,'9b1f7053-f4d5-41b7-8592-09b013af94c0',1,'Create','App\\Models\\User',2,'App\\Models\\User',2,'App\\Models\\User',2,'','finished','','2024-01-18 15:55:08','2024-01-18 15:55:08',NULL,'{\"name\":\"Fred Weasley\",\"email\":\"fred.weasley@hogwarts.edu\",\"updated_at\":\"2024-01-18T15:55:08.000000Z\",\"created_at\":\"2024-01-18T15:55:08.000000Z\",\"id\":2}'),
	(2,'9b1f7073-90ac-4831-b9e7-976612e3644b',1,'Create','App\\Models\\User',3,'App\\Models\\User',3,'App\\Models\\User',3,'','finished','','2024-01-18 15:55:29','2024-01-18 15:55:29',NULL,'{\"name\":\"George Weasley\",\"email\":\"george.weasley@hogwarts.edu\",\"updated_at\":\"2024-01-18T15:55:29.000000Z\",\"created_at\":\"2024-01-18T15:55:29.000000Z\",\"id\":3}'),
	(3,'9b1f70e5-03fe-4b63-8311-6f0e01998ba7',1,'Create','App\\Models\\Proposal',1,'App\\Models\\Proposal',1,'App\\Models\\Proposal',1,'','finished','','2024-01-18 15:56:43','2024-01-18 15:56:43',NULL,'{\"title\":\"An amazing grant proposal\",\"updated_at\":\"2024-01-18T15:56:43.000000Z\",\"created_at\":\"2024-01-18T15:56:43.000000Z\",\"id\":1}'),
	(4,'9b1f70f8-c69a-4325-84e2-e41d2d5ad317',1,'Attach','App\\Models\\Proposal',1,'App\\Models\\User',1,'Illuminate\\Database\\Eloquent\\Relations\\Pivot',NULL,'','finished','','2024-01-18 15:56:56','2024-01-18 15:56:56',NULL,'{\"proposal_id\":\"1\",\"user_id\":\"1\"}'),
	(5,'9b1f70fe-d384-4cac-b6c9-1840d76106ee',1,'Attach','App\\Models\\Proposal',1,'App\\Models\\User',2,'Illuminate\\Database\\Eloquent\\Relations\\Pivot',NULL,'','finished','','2024-01-18 15:57:00','2024-01-18 15:57:00',NULL,'{\"proposal_id\":\"1\",\"user_id\":\"2\"}'),
	(6,'9b1f7262-6781-485b-9a2d-fb1ad366434a',1,'Create','App\\Models\\Requirement',1,'App\\Models\\Requirement',1,'App\\Models\\Requirement',1,'','finished','','2024-01-18 16:00:53','2024-01-18 16:00:53',NULL,'{\"name\":\"Study of environmental impact (pdf)\",\"proposal_id\":1,\"updated_at\":\"2024-01-18T16:00:53.000000Z\",\"created_at\":\"2024-01-18T16:00:53.000000Z\",\"id\":1}');

/*!40000 ALTER TABLE `action_events` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents`;

CREATE TABLE `documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
	(3,'2018_01_01_000000_create_action_events_table',1),
	(4,'2019_05_10_000000_add_fields_to_action_events_table',1),
	(5,'2019_08_19_000000_create_failed_jobs_table',1),
	(6,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(7,'2021_08_25_193039_create_nova_notifications_table',1),
	(8,'2022_04_26_000000_add_fields_to_nova_notifications_table',1),
	(9,'2022_12_19_000000_create_field_attachments_table',1),
	(11,'2024_01_18_154120_create_requirements_table',2),
	(12,'2024_01_18_154335_create_documents_table',2),
	(13,'2024_01_18_153621_create_proposals_table_and_users_pivot',3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table nova_field_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nova_field_attachments`;

CREATE TABLE `nova_field_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attachable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachable_id` bigint unsigned NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nova_field_attachments_attachable_type_attachable_id_index` (`attachable_type`,`attachable_id`),
  KEY `nova_field_attachments_url_index` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table nova_notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nova_notifications`;

CREATE TABLE `nova_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nova_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table nova_pending_field_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nova_pending_field_attachments`;

CREATE TABLE `nova_pending_field_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `draft_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nova_pending_field_attachments_draft_id_index` (`draft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table password_reset_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table proposal_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proposal_user`;

CREATE TABLE `proposal_user` (
  `proposal_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `proposal_user` WRITE;
/*!40000 ALTER TABLE `proposal_user` DISABLE KEYS */;

INSERT INTO `proposal_user` (`proposal_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL),
	(1,2,NULL,NULL);

/*!40000 ALTER TABLE `proposal_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table proposals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proposals`;

CREATE TABLE `proposals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;

INSERT INTO `proposals` (`id`, `title`, `created_at`, `updated_at`)
VALUES
	(1,'An amazing grant proposal','2024-01-18 15:56:43','2024-01-18 15:56:43');

/*!40000 ALTER TABLE `proposals` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table requirements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `requirements`;

CREATE TABLE `requirements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proposal_id` int unsigned NOT NULL,
  `document_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;

INSERT INTO `requirements` (`id`, `created_at`, `updated_at`, `name`, `proposal_id`, `document_id`)
VALUES
	(1,'2024-01-18 16:00:53','2024-01-18 16:00:53','Study of environmental impact (pdf)',1,NULL);

/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'David Bankes','davidbankes@gmail.com',NULL,'$2y$12$b/IW4GDs1HO2JD863JsideBmfCo9oIJow3bJ6fFw.x2zUKV3AGbNu',NULL,'2024-01-18 15:45:52','2024-01-18 15:45:52'),
	(2,'Fred Weasley','fred.weasley@hogwarts.edu',NULL,'$2y$12$KNLyTZPouNYXQVkJKbtCr.WsxMadd/kYpZr2BABMWEMWTvb0L6flu',NULL,'2024-01-18 15:55:08','2024-01-18 15:55:08'),
	(3,'George Weasley','george.weasley@hogwarts.edu',NULL,'$2y$12$Xbo0jI8at1HDTYuS8/ZSj.O8JX/Da.g0.XsAN3x.1nDi4hkXAh99S',NULL,'2024-01-18 15:55:29','2024-01-18 15:55:29');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
