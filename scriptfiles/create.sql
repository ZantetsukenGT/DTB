CREATE TABLE sessions
(
	session_account_id INT NOT NULL,
	session_name VARCHAR(24) NOT NULL,
	session_ip VARCHAR(15) NOT NULL,
	session_gpci VARCHAR(40) NOT NULL,
	session_country VARCHAR(40) NOT NULL,
	session_city VARCHAR(40) NOT NULL,
	session_isp VARCHAR(100) NOT NULL,
	session_start DATETIME NOT NULL,
	session_end DATETIME NOT NULL,
	session_login BOOLEAN NOT NULL,
	session_login_attempt TINYINT NOT NULL,
	PRIMARY KEY (session_account_id)
);

CREATE INDEX sessions_idx
ON sessions(session_ip);

CREATE TABLE setadmin
(
	setadmin_to_account_id INT NOT NULL,
	setadmin_by_account_id INT NOT NULL,
	setadmin_level TINYINT NOT NULL,
	setadmin_date DATETIME NOT NULL
);

CREATE INDEX setadmin_idx
ON setadmin(setadmin_to_account_id, setadmin_by_account_id);

CREATE TABLE accounts
(
	account_id INT NOT NULL AUTO_INCREMENT,
	account_name VARCHAR(24) NOT NULL,
	account_registered BOOLEAN NOT NULL DEFAULT 1,
	account_register_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	account_password VARCHAR(128),
	account_salt VARCHAR(20),
	account_admin TINYINT NOT NULL DEFAULT 0,
	account_kills INT NOT NULL DEFAULT 0,
	account_multikill INT NOT NULL DEFAULT 0,
	account_deaths INT NOT NULL DEFAULT 0,
	account_kdratio FLOAT NOT NULL DEFAULT 0.0,
	account_games_won INT NOT NULL DEFAULT 0,
	account_games_lost INT NOT NULL DEFAULT 0,
	account_games_played INT NOT NULL DEFAULT 0,
	account_wlratio FLOAT NOT NULL DEFAULT 0.0,
	account_bombs_planted INT NOT NULL DEFAULT 0,
	account_bombs_defused INT NOT NULL DEFAULT 0,
	account_level TINYINT NOT NULL DEFAULT 0,
	account_xp INT NOT NULL DEFAULT 0,
	account_playtime INT NOT NULL DEFAULT 0,
	PRIMARY KEY (account_id)
);

CREATE UNIQUE INDEX accounts_uniq_idx
ON accounts(account_name);

CREATE TABLE bans
(
	ban_to_account_id INT NOT NULL,
	ban_by_account_id INT,
	ban_to_name VARCHAR(24) NOT NULL,
	ban_by_name VARCHAR(24),
	ban_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ban_reason VARCHAR(49)
);

CREATE INDEX bans_idx
ON bans(ban_to_account_id, ban_by_account_id);

CREATE INDEX bans_date_idx
ON bans(ban_date);

CREATE TABLE kicks
(
	kick_to_account_id INT NOT NULL,
	kick_by_account_id INT,
	kick_to_name VARCHAR(24) NOT NULL,
	kick_by_name VARCHAR(24),
	kick_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	kick_reason VARCHAR(64)
);

CREATE INDEX kicks_idx
ON kicks(kick_to_account_id, kick_by_account_id);

CREATE INDEX kicks_date_idx
ON kicks(kick_date);

CREATE TABLE chat
(
	chat_by_account_id INT NOT NULL,
	chat_to_account_id INT,
	chat_by_name VARCHAR(24) NOT NULL,
	chat_to_name VARCHAR(24),
	chat_message VARCHAR(143),
	chat_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX chat_idx
ON chat(chat_by_account_id, chat_to_account_id);

CREATE INDEX chat_date_idx
ON chat(chat_date);

CREATE TABLE deaths
(
	death_dead_account_id INT NOT NULL,
	death_killer_account_id INT,
	death_dead_name VARCHAR(24) NOT NULL,
	death_killer_name VARCHAR(24),
	death_reason INT UNSIGNED NOT NULL DEFAULT 0,
	death_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX deaths_idx
ON deaths(death_dead_account_id, death_killer_account_id);

CREATE INDEX deaths_date_idx
ON deaths(death_date);
