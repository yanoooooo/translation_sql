DROP TABLE mode_master;
DROP TABLE user;
DROP TABLE questionnaire;
DROP TABLE work_log;

CREATE TABLE IF NOT EXISTS `mode_master` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  `name` TEXT NOT NULL UNIQUE,
  `lyrics_candidate` INTEGER NOT NULL,
  `lyrics_edit` INTEGER NOT NULL,
  `notes_edit` INTEGER NOT NULL);

CREATE TABLE IF NOT EXISTS `user` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `name` TEXT NOT NULL UNIQUE,
  `mode_id` INTEGER NOT NULL,
  `created_date` DECIMAL(10,0) NOT NULL,
  CONSTRAINT `fk_user_mode_master`
    FOREIGN KEY (`mode_id`)
    REFERENCES `mode_master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `questionnaire` (
  `user_id` INTEGER NOT NULL,
  `sex` INTEGER NOT NULL,
  `age` INTEGER NOT NULL,
  `readable` INTEGER NOT NULL,
  `sing` INTEGER NOT NULL,
  `english` INTEGER NOT NULL,
  `translation` INTEGER NOT NULL,
  `japanese_likeness` INTEGER NOT NULL,
  `edit` INTEGER NOT NULL,
  `compare` INTEGER NOT NULL,
  `match` INTEGER NOT NULL,
  `ease_use` INTEGER NOT NULL,
  `satisfy` INTEGER NOT NULL,
  `ease_use_text` TEXT NULL DEFAULT NULL,
  `difficult_use_text` TEXT NULL DEFAULT NULL,
  CONSTRAINT `fk_questionnaire_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `work_log` (
  `user_id` INTEGER NOT NULL,
  `phrase` INTEGER NOT NULL DEFAULT 0,
  `trial_listening` INTEGER NOT NULL DEFAULT 0,
  `edit` INTEGER NOT NULL DEFAULT 0,
  `lyrics_select_modal` INTEGER NULL DEFAULT NULL,
  `lyrics_select` INTEGER NULL DEFAULT NULL,
  `lyrics_textform` INTEGER NOT NULL DEFAULT 0,
  `notes_edit_right` INTEGER NULL DEFAULT NULL,
  `notes_edit_left` INTEGER NULL DEFAULT NULL,
  `notes_edit_center` INTEGER NULL DEFAULT NULL,
  `compare` INTEGER NOT NULL DEFAULT 0,
  `settings` INTEGER NOT NULL DEFAULT 0,
  `help` INTEGER NOT NULL DEFAULT 0,
  `finish` INTEGER NOT NULL DEFAULT 0,
  `time` INTEGER NOT NULL DEFAULT 0,
  CONSTRAINT `fk_work_log_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

/* mode_master data */
INSERT INTO `mode_master` (`id`, `name`, `lyrics_candidate`, `lyrics_edit`, `notes_edit`) VALUES (1, "(A0 B0 C0)", 0, 0, 0);
INSERT INTO `mode_master` (`id`, `name`, `lyrics_candidate`, `lyrics_edit`, `notes_edit`) VALUES (2, "(A0 B0 C1)", 0, 0, 1);
INSERT INTO `mode_master` (`id`, `name`, `lyrics_candidate`, `lyrics_edit`, `notes_edit`) VALUES (3, "(A0 B1 C0)", 0, 1, 0);
INSERT INTO `mode_master` (`id`, `name`, `lyrics_candidate`, `lyrics_edit`, `notes_edit`) VALUES (4, "(A0 B1 C1)", 0, 1, 1);
INSERT INTO `mode_master` (`id`, `name`, `lyrics_candidate`, `lyrics_edit`, `notes_edit`) VALUES (5, "(A1 B1 C0)", 1, 1, 0);
INSERT INTO `mode_master` (`id`, `name`, `lyrics_candidate`, `lyrics_edit`, `notes_edit`) VALUES (6, "(A1 B1 C1)", 1, 1, 1);

