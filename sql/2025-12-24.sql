-- Yiimp full schema + migrations + algos/ports synced from stratum config.sample
-- Generated: 2025-12-24T12:25:43.547886Z
-- Notes:
--  - This file is intended for FRESH install (drops/creates nothing except creates DB if missing).
--  - Ports/visible are taken from stratum/config.sample/*.conf.
--  - Algos present in stratum code but missing config.sample are inserted with port=0 and visible=0.
--  - After import, add your coins in `coins` table and set `coins.algo` to one of the algos below.
--
CREATE DATABASE IF NOT EXISTS `yiimpfrontend` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `yiimpfrontend`;

SET FOREIGN_KEY_CHECKS=0;

-- ===== BASE EXPORT (2024-03-06) =====
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coinid` int DEFAULT NULL,
  `last_earning` int DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `no_fees` tinyint(1) DEFAULT NULL,
  `donation` tinyint unsigned NOT NULL DEFAULT '0',
  `logtraffic` tinyint(1) DEFAULT NULL,
  `balance` double DEFAULT '0',
  `username` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `coinsymbol` varchar(16) DEFAULT NULL,
  `swap_time` int unsigned DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `hostaddr` varchar(39) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `coin` (`coinid`),
  KEY `balance` (`balance`),
  KEY `earning` (`last_earning`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `algos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `profit` double DEFAULT NULL,
  `rent` double DEFAULT NULL,
  `factor` double DEFAULT NULL,
  `overflow` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;

INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(1, 'scrypt', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(2, 'scryptn', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(3, 'neoscrypt', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(4, 'quark', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(5, 'lyra2', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(6, 'x11', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(7, 'x13', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(8, 'x14', 0, 0, 1, 0);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(9, 'x15', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(10, 'fresh', 0, 0, 5, 0);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(11, 'sha256', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(12, 'qubit', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(13, 'skein', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(14, 'groestl', 0, 0, 1, 0);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(15, 'blake', 0, 0, 1, 0);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(16, 'keccak', 0, 0, 1, 0);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(17, 'nist5', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(18, 'zr5', 0, 0, 1, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(19, 'c11', 0, 0, 1, 0);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(20, 'drop', 0, 0, 1.5, 0);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(21, 'skein2', 0, 0, 1, 0);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(22, 'bmw', 0, 0, 100, 1);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(23, 'argon2', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(24, 'blake2s', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(25, 'decred', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(26, 'luffa', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(27, 'lyra2v2', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(28, 'penta', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(29, 'dmd-gr', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(30, 'myr-gr', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(31, 'm7m', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(32, 'sib', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(33, 'vanilla', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(34, 'velvet', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(35, 'yescrypt', 0, 0, 1, NULL);
INSERT INTO `algos` (`id`, `name`, `profit`, `rent`, `factor`, `overflow`) VALUES
	(36, 'whirlpool', 0, 0, 1, NULL);

CREATE TABLE IF NOT EXISTS `balances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `onsell` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

INSERT INTO `balances` (`id`, `name`, `balance`, `onsell`) VALUES
	(1, 'exbitron', 0, NULL);
INSERT INTO `balances` (`id`, `name`, `balance`, `onsell`) VALUES
	(2, 'nestex', 0, NULL);
INSERT INTO `balances` (`id`, `name`, `balance`, `onsell`) VALUES
	(3, 'nonkyc', 0, NULL);
INSERT INTO `balances` (`id`, `name`, `balance`, `onsell`) VALUES
	(4, 'safetrade', 0, NULL);

CREATE TABLE IF NOT EXISTS `balanceuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `pending` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `benchmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `algo` varchar(16) NOT NULL,
  `type` varchar(8) NOT NULL,
  `khps` double DEFAULT NULL,
  `device` varchar(80) DEFAULT NULL,
  `vendorid` varchar(12) DEFAULT NULL,
  `chip` varchar(32) DEFAULT NULL,
  `idchip` int DEFAULT NULL,
  `arch` varchar(8) DEFAULT NULL,
  `power` int unsigned DEFAULT NULL,
  `plimit` int unsigned DEFAULT NULL,
  `freq` int unsigned DEFAULT NULL,
  `realfreq` int unsigned DEFAULT NULL,
  `memf` int unsigned DEFAULT NULL,
  `realmemf` int unsigned DEFAULT NULL,
  `client` varchar(48) DEFAULT NULL,
  `os` varchar(8) DEFAULT NULL,
  `driver` varchar(32) DEFAULT NULL,
  `intensity` double DEFAULT NULL,
  `throughput` int unsigned DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `time` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bench_userid` (`userid`),
  KEY `ndx_type` (`type`),
  KEY `ndx_algo` (`algo`),
  KEY `ndx_time` (`time` DESC),
  KEY `ndx_chip` (`idchip`),
  CONSTRAINT `fk_bench_chip` FOREIGN KEY (`idchip`) REFERENCES `bench_chips` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `bench_chips` (
  `id` int NOT NULL AUTO_INCREMENT,
  `devicetype` varchar(8) DEFAULT NULL,
  `vendorid` varchar(12) DEFAULT NULL,
  `chip` varchar(32) DEFAULT NULL,
  `year` int unsigned DEFAULT NULL,
  `maxtdp` double DEFAULT NULL,
  `blake_rate` double DEFAULT NULL,
  `blake_power` double DEFAULT NULL,
  `x11_rate` double DEFAULT NULL,
  `x11_power` double DEFAULT NULL,
  `sha_rate` double DEFAULT NULL,
  `sha_power` double DEFAULT NULL,
  `scrypt_rate` double DEFAULT NULL,
  `scrypt_power` double DEFAULT NULL,
  `dag_rate` double DEFAULT NULL,
  `dag_power` double DEFAULT NULL,
  `lyra_rate` double DEFAULT NULL,
  `lyra_power` double DEFAULT NULL,
  `neo_rate` double DEFAULT NULL,
  `neo_power` double DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `features` varchar(255) DEFAULT NULL,
  `perfdata` text,
  PRIMARY KEY (`id`),
  KEY `ndx_chip_type` (`devicetype`),
  KEY `ndx_chip_name` (`chip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `bench_suffixes` (
  `vendorid` varchar(12) NOT NULL,
  `chip` varchar(32) DEFAULT NULL,
  `suffix` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`vendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `blocks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `coin_id` int DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `confirmations` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `workerid` int DEFAULT NULL,
  `difficulty_user` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `difficulty` double DEFAULT NULL,
  `category` varchar(16) DEFAULT NULL,
  `solo` tinyint(1) DEFAULT NULL,
  `effort` double DEFAULT NULL,
  `algo` varchar(16) DEFAULT 'scrypt',
  `blockhash` varchar(128) DEFAULT NULL,
  `txhash` varchar(128) DEFAULT NULL,
  `segwit` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `algo1` (`algo`),
  KEY `coin` (`coin_id`),
  KEY `category` (`category`),
  KEY `user1` (`userid`),
  KEY `height1` (`height`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Discovered blocks persisted from Litecoin Service';


CREATE TABLE IF NOT EXISTS `bookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idcoin` int NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `address` varchar(128) NOT NULL,
  `lastused` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookmarks_coin` (`idcoin`),
  CONSTRAINT `fk_bookmarks_coin` FOREIGN KEY (`idcoin`) REFERENCES `coins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `coins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `symbol` varchar(16) DEFAULT NULL,
  `symbol2` varchar(16) DEFAULT NULL,
  `algo` varchar(16) DEFAULT NULL,
  `version` varchar(32) DEFAULT NULL,
  `image` varchar(1024) DEFAULT NULL,
  `market` varchar(64) DEFAULT NULL,
  `marketid` int DEFAULT NULL,
  `master_wallet` varchar(1024) DEFAULT NULL,
  `charity_address` varchar(1024) DEFAULT NULL,
  `charity_amount` double DEFAULT NULL,
  `charity_percent` double DEFAULT NULL,
  `deposit_address` varchar(1024) DEFAULT NULL,
  `deposit_minimum` double DEFAULT '1',
  `sellonbid` tinyint(1) DEFAULT NULL,
  `dontsell` tinyint(1) DEFAULT '1',
  `block_explorer` varchar(1024) DEFAULT NULL,
  `index_avg` double DEFAULT NULL,
  `connections` int DEFAULT NULL,
  `errors` varchar(1024) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `immature` double DEFAULT NULL,
  `cleared` double DEFAULT NULL,
  `available` double DEFAULT NULL,
  `stake` double DEFAULT NULL,
  `mint` double DEFAULT NULL,
  `txfee` double DEFAULT NULL,
  `payout_min` double DEFAULT NULL,
  `payout_max` double DEFAULT NULL,
  `block_time` int DEFAULT NULL,
  `difficulty` double DEFAULT '1',
  `difficulty_pos` double DEFAULT NULL,
  `block_height` int DEFAULT NULL,
  `target_height` int DEFAULT NULL,
  `powend_height` int DEFAULT NULL,
  `network_hash` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `price2` double DEFAULT NULL,
  `reward` double DEFAULT '1',
  `reward_mul` double DEFAULT '1',
  `mature_blocks` int DEFAULT NULL,
  `enable` tinyint(1) DEFAULT '0',
  `auto_ready` tinyint(1) DEFAULT '0',
  `visible` tinyint(1) DEFAULT NULL,
  `no_explorer` tinyint unsigned NOT NULL DEFAULT '0',
  `max_miners` int DEFAULT NULL,
  `max_shares` int DEFAULT NULL,
  `created` int DEFAULT NULL,
  `action` int DEFAULT NULL,
  `conf_folder` varchar(128) DEFAULT NULL,
  `program` varchar(128) DEFAULT NULL,
  `rpcuser` varchar(128) DEFAULT NULL,
  `rpcpasswd` varchar(128) DEFAULT NULL,
  `serveruser` varchar(45) DEFAULT NULL,
  `rpchost` varchar(128) DEFAULT NULL,
  `rpcport` int DEFAULT NULL,
  `dedicatedport` int DEFAULT NULL,
  `rpccurl` tinyint(1) NOT NULL DEFAULT '0',
  `rpcssl` tinyint(1) NOT NULL DEFAULT '0',
  `rpccert` varchar(255) DEFAULT NULL,
  `rpcencoding` varchar(16) DEFAULT NULL,
  `account` varchar(64) NOT NULL DEFAULT '',
  `hasgetinfo` tinyint unsigned NOT NULL DEFAULT '1',
  `hassubmitblock` tinyint unsigned NOT NULL DEFAULT '1',
  `hasmasternodes` tinyint(1) NOT NULL DEFAULT '0',
  `usememorypool` tinyint(1) DEFAULT NULL,
  `usesegwit` tinyint unsigned NOT NULL DEFAULT '0',
  `txmessage` tinyint(1) DEFAULT NULL,
  `auxpow` tinyint(1) DEFAULT NULL,
  `multialgos` tinyint(1) NOT NULL DEFAULT '0',
  `lastblock` varchar(128) DEFAULT NULL,
  `network_ttf` int DEFAULT NULL,
  `actual_ttf` int DEFAULT NULL,
  `pool_ttf` int DEFAULT NULL,
  `last_network_found` int DEFAULT NULL,
  `installed` tinyint(1) DEFAULT NULL,
  `watch` tinyint(1) NOT NULL DEFAULT '0',
  `link_site` varchar(1024) DEFAULT NULL,
  `link_exchange` varchar(1024) DEFAULT NULL,
  `link_bitcointalk` varchar(1024) DEFAULT NULL,
  `link_github` varchar(1024) DEFAULT NULL,
  `link_explorer` varchar(1024) DEFAULT NULL,
  `link_twitter` varchar(1024) DEFAULT NULL,
  `link_discord` varchar(1024) DEFAULT NULL,
  `link_facebook` varchar(1024) DEFAULT NULL,
  `donation_address` varchar(1024) DEFAULT NULL,
  `usefaucet` tinyint unsigned NOT NULL DEFAULT '0',
  `specifications` blob,
  PRIMARY KEY (`id`),
  KEY `auto_ready` (`auto_ready`),
  KEY `enable` (`enable`),
  KEY `algo` (`algo`),
  KEY `symbol` (`symbol`),
  KEY `index_avg` (`index_avg`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

INSERT INTO `coins` (`id`, `name`, `symbol`, `symbol2`, `algo`, `version`, `image`, `market`, `marketid`, `master_wallet`, `charity_address`, `charity_amount`, `charity_percent`, `deposit_address`, `deposit_minimum`, `sellonbid`, `dontsell`, `block_explorer`, `index_avg`, `connections`, `errors`, `balance`, `immature`, `cleared`, `available`, `stake`, `mint`, `txfee`, `payout_min`, `payout_max`, `block_time`, `difficulty`, `difficulty_pos`, `block_height`, `target_height`, `powend_height`, `network_hash`, `price`, `price2`, `reward`, `reward_mul`, `mature_blocks`, `enable`, `auto_ready`, `visible`, `no_explorer`, `max_miners`, `max_shares`, `created`, `action`, `conf_folder`, `program`, `rpcuser`, `rpcpasswd`, `serveruser`, `rpchost`, `rpcport`, `dedicatedport`, `rpccurl`, `rpcssl`, `rpccert`, `rpcencoding`, `account`, `hasgetinfo`, `hassubmitblock`, `hasmasternodes`, `usememorypool`, `usesegwit`, `txmessage`, `auxpow`, `multialgos`, `lastblock`, `network_ttf`, `actual_ttf`, `pool_ttf`, `last_network_found`, `installed`, `watch`, `link_site`, `link_exchange`, `link_bitcointalk`, `link_github`, `link_explorer`, `link_twitter`, `link_discord`, `link_facebook`, `donation_address`, `usefaucet`, `specifications`) VALUES
	(6, 'Bitcoin', 'BTC', '', 'sha256', '109900', '/images/coin-6.png', '', 0, NULL, NULL, NULL, NULL, NULL, 0.005, 0, 1, '', 0.0000049361618444422, 0, 'This is a pre-release test build - use at your own risk - do not use for mining or merchant applications', 0, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 51076366303.482, NULL, 364900, 349481, NULL, 80.81, 1, 1, 25.21212105, 1, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, 'yaamp1', 10301, NULL, 0, 0, NULL, 'POW', '', 1, 1, 0, NULL, 0, 1, 0, 0, '00000000000000000da2a64a9a8e32623575ba19c3125077d1715c1ba2d3b90c', 2147483647, 596, 2147483647, 1436648004, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

CREATE TABLE IF NOT EXISTS `connections` (
  `id` int NOT NULL,
  `user` varchar(64) DEFAULT NULL,
  `host` varchar(64) DEFAULT NULL,
  `db` varchar(64) DEFAULT NULL,
  `created` int DEFAULT NULL,
  `idle` int DEFAULT NULL,
  `last` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `connections` (`id`, `user`, `host`, `db`, `created`, `idle`, `last`) VALUES
	(24634, 'root', 'localhost', 'yaamp', 1459693738, 239, 1459693758);
INSERT INTO `connections` (`id`, `user`, `host`, `db`, `created`, `idle`, `last`) VALUES
	(25098, 'root', 'localhost', 'yaamp', 1459693738, 308, 1459693758);
INSERT INTO `connections` (`id`, `user`, `host`, `db`, `created`, `idle`, `last`) VALUES
	(25099, 'root', 'localhost', 'yaamp', 1459693738, 301, 1459693758);
INSERT INTO `connections` (`id`, `user`, `host`, `db`, `created`, `idle`, `last`) VALUES
	(25100, 'root', 'localhost', 'yaamp', 1459693738, 308, 1459693758);
INSERT INTO `connections` (`id`, `user`, `host`, `db`, `created`, `idle`, `last`) VALUES
	(25101, 'root', 'localhost', 'yaamp', 1459693738, 240, 1459693758);
INSERT INTO `connections` (`id`, `user`, `host`, `db`, `created`, `idle`, `last`) VALUES
	(25102, 'root', 'localhost', 'yaamp', 1459693738, 300, 1459693758);
INSERT INTO `connections` (`id`, `user`, `host`, `db`, `created`, `idle`, `last`) VALUES
	(25103, 'root', 'localhost', 'yaamp', 1459693738, 242, 1459693758);
INSERT INTO `connections` (`id`, `user`, `host`, `db`, `created`, `idle`, `last`) VALUES
	(25104, 'root', 'localhost', 'yaamp', 1459693738, 303, 1459693758);
INSERT INTO `connections` (`id`, `user`, `host`, `db`, `created`, `idle`, `last`) VALUES
	(25186, 'root', 'localhost', 'yaamp', 1459693738, 10, 1459693738);
INSERT INTO `connections` (`id`, `user`, `host`, `db`, `created`, `idle`, `last`) VALUES
	(25187, 'root', 'localhost', 'yaamp', 1459693738, 0, 1459693738);
INSERT INTO `connections` (`id`, `user`, `host`, `db`, `created`, `idle`, `last`) VALUES
	(25189, 'root', 'localhost', 'yaamp', 1459693758, 0, 1459693758);

CREATE TABLE IF NOT EXISTS `earnings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `coinid` int DEFAULT NULL,
  `blockid` int DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` int DEFAULT NULL,
  `mature_time` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndx_user_block` (`userid`,`blockid`),
  KEY `user` (`userid`),
  KEY `coin` (`coinid`),
  KEY `block` (`blockid`),
  KEY `create1` (`create_time`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `exchange` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coinid` int DEFAULT NULL,
  `send_time` int DEFAULT NULL,
  `receive_time` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `price_estimate` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `market` varchar(16) DEFAULT NULL,
  `tx` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coinid` (`coinid`),
  KEY `status` (`status`),
  KEY `market` (`market`),
  KEY `send_time` (`send_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `hashrate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` int DEFAULT NULL,
  `hashrate` bigint DEFAULT NULL,
  `hashrate_bad` bigint DEFAULT NULL,
  `price` double DEFAULT NULL,
  `rent` double DEFAULT NULL,
  `earnings` double DEFAULT NULL,
  `difficulty` double DEFAULT NULL,
  `algo` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t1` (`time`),
  KEY `a1` (`algo`)
) ENGINE=InnoDB AUTO_INCREMENT=12607 DEFAULT CHARSET=utf8mb3;

INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12574, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'sha256');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12575, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'scrypt');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12576, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'scryptn');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12577, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'argon2');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12578, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'blake');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12579, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'blake2s');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12580, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'decred');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12581, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'keccak');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12582, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'luffa');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12583, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'lyra2');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12584, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'lyra2v2');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12585, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'neoscrypt');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12586, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'nist5');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12587, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'penta');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12588, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'quark');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12589, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'qubit');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12590, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'c11');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12591, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'x11');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12592, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'x13');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12593, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'x14');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12594, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'x15');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12595, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'groestl');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12596, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'dmd-gr');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12597, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'myr-gr');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12598, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'm7m');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12599, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'sib');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12600, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'skein');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12601, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'skein2');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12602, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'vanilla');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12603, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'velvet');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12604, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'yescrypt');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12605, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'whirlpool');
INSERT INTO `hashrate` (`id`, `time`, `hashrate`, `hashrate_bad`, `price`, `rent`, `earnings`, `difficulty`, `algo`) VALUES
	(12606, 1459692900, 0, NULL, 0, 0, NULL, NULL, 'zr5');

CREATE TABLE IF NOT EXISTS `hashrenter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `renterid` int DEFAULT NULL,
  `jobid` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  `hashrate` double DEFAULT NULL,
  `hashrate_bad` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `hashstats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` int DEFAULT NULL,
  `hashrate` bigint DEFAULT NULL,
  `earnings` double DEFAULT NULL,
  `algo` varchar(16) DEFAULT 'scrypt',
  PRIMARY KEY (`id`),
  KEY `algo1` (`algo`),
  KEY `time1` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `hashuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  `hashrate` bigint DEFAULT NULL,
  `hashrate_bad` bigint DEFAULT NULL,
  `algo` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `u1` (`userid`),
  KEY `t1` (`time`),
  KEY `a1` (`algo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `renterid` int DEFAULT NULL,
  `ready` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `time` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `speed` double DEFAULT NULL,
  `difficulty` double DEFAULT NULL,
  `algo` varchar(16) DEFAULT NULL,
  `host` varchar(1024) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `username` varchar(1024) DEFAULT NULL,
  `password` varchar(1024) DEFAULT NULL,
  `percent` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `renterid` (`renterid`),
  KEY `ready` (`ready`),
  KEY `active` (`active`),
  KEY `algo` (`algo`),
  KEY `price` (`price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `jobsubmits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobid` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `difficulty` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `algo` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `markets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coinid` int DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `marketid` int DEFAULT NULL,
  `priority` tinyint(1) NOT NULL DEFAULT '0',
  `lastsent` int DEFAULT NULL,
  `lasttraded` int DEFAULT '0',
  `balancetime` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `txfee` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `ontrade` double NOT NULL DEFAULT '0',
  `price` double DEFAULT NULL,
  `price2` double DEFAULT NULL,
  `pricetime` int DEFAULT NULL,
  `deposit_address` varchar(1024) DEFAULT NULL,
  `message` varchar(2048) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `base_coin` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coinid` (`coinid`),
  KEY `name` (`name`),
  KEY `lastsent` (`lastsent`),
  KEY `lasttraded` (`lasttraded`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `markets` (`id`, `coinid`, `disabled`, `marketid`, `priority`, `lastsent`, `lasttraded`, `balancetime`, `deleted`, `txfee`, `balance`, `ontrade`, `price`, `price2`, `pricetime`, `deposit_address`, `message`, `name`, `base_coin`) VALUES
	(1, 155, 0, NULL, 0, NULL, 0, NULL, 0, 0.002, NULL, 0, 0.020691404922548, 0.020814137099131, NULL, NULL, NULL, 'bittrex', NULL);

CREATE TABLE IF NOT EXISTS `market_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` int NOT NULL,
  `idcoin` int NOT NULL,
  `price` double DEFAULT NULL,
  `price2` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `idmarket` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcoin` (`idcoin`),
  KEY `idmarket` (`idmarket`),
  KEY `time` (`time` DESC),
  CONSTRAINT `fk_mh_coin` FOREIGN KEY (`idcoin`) REFERENCES `coins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mh_market` FOREIGN KEY (`idmarket`) REFERENCES `markets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `mining` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usdbtc` double DEFAULT NULL,
  `last_monitor_exchange` int DEFAULT NULL,
  `last_update_price` int DEFAULT NULL,
  `last_payout` int DEFAULT NULL,
  `stratumids` varchar(1024) DEFAULT NULL,
  `best_algo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `mining` (`id`, `usdbtc`, `last_monitor_exchange`, `last_update_price`, `last_payout`, `stratumids`, `best_algo`) VALUES
	(1, 418.82, 1422830048, 1422829644, 1459683363, '', 'lyra2');

CREATE TABLE IF NOT EXISTS `nicehash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT NULL,
  `orderid` int DEFAULT NULL,
  `last_decrease` int DEFAULT NULL,
  `algo` varchar(32) DEFAULT NULL,
  `btc` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `speed` double DEFAULT NULL,
  `workers` int DEFAULT NULL,
  `accepted` double DEFAULT NULL,
  `rejected` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

INSERT INTO `nicehash` (`id`, `active`, `orderid`, `last_decrease`, `algo`, `btc`, `price`, `speed`, `workers`, `accepted`, `rejected`) VALUES
	(1, 0, NULL, NULL, 'x11', NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `nicehash` (`id`, `active`, `orderid`, `last_decrease`, `algo`, `btc`, `price`, `speed`, `workers`, `accepted`, `rejected`) VALUES
	(2, 0, NULL, NULL, 'scrypt', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nicehash` (`id`, `active`, `orderid`, `last_decrease`, `algo`, `btc`, `price`, `speed`, `workers`, `accepted`, `rejected`) VALUES
	(3, 0, NULL, NULL, 'sha256', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nicehash` (`id`, `active`, `orderid`, `last_decrease`, `algo`, `btc`, `price`, `speed`, `workers`, `accepted`, `rejected`) VALUES
	(4, 0, NULL, NULL, 'scryptn', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nicehash` (`id`, `active`, `orderid`, `last_decrease`, `algo`, `btc`, `price`, `speed`, `workers`, `accepted`, `rejected`) VALUES
	(5, 0, NULL, NULL, 'x13', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nicehash` (`id`, `active`, `orderid`, `last_decrease`, `algo`, `btc`, `price`, `speed`, `workers`, `accepted`, `rejected`) VALUES
	(6, 0, NULL, NULL, 'x15', NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `nicehash` (`id`, `active`, `orderid`, `last_decrease`, `algo`, `btc`, `price`, `speed`, `workers`, `accepted`, `rejected`) VALUES
	(7, 0, NULL, NULL, 'nist5', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nicehash` (`id`, `active`, `orderid`, `last_decrease`, `algo`, `btc`, `price`, `speed`, `workers`, `accepted`, `rejected`) VALUES
	(8, 0, NULL, NULL, 'neoscrypt', NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `nicehash` (`id`, `active`, `orderid`, `last_decrease`, `algo`, `btc`, `price`, `speed`, `workers`, `accepted`, `rejected`) VALUES
	(9, 0, NULL, NULL, 'lyra2', NULL, NULL, NULL, 0, 0, 0);

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idcoin` int NOT NULL,
  `enabled` int NOT NULL DEFAULT '0',
  `description` varchar(128) DEFAULT NULL,
  `conditiontype` varchar(32) DEFAULT NULL,
  `conditionvalue` double DEFAULT NULL,
  `notifytype` varchar(32) DEFAULT NULL,
  `notifycmd` varchar(512) DEFAULT NULL,
  `lastchecked` int unsigned DEFAULT NULL,
  `lasttriggered` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notif_coin` (`idcoin`),
  KEY `notif_checked` (`lastchecked`),
  CONSTRAINT `fk_notif_coin` FOREIGN KEY (`idcoin`) REFERENCES `coins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coinid` int DEFAULT NULL,
  `created` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `ask` double DEFAULT NULL,
  `bid` double DEFAULT NULL,
  `market` varchar(16) DEFAULT NULL,
  `uuid` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coinid` (`coinid`),
  KEY `created` (`created`),
  KEY `market` (`market`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `payouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `idcoin` int DEFAULT NULL,
  `time` int NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `amount` double DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `tx` varchar(128) DEFAULT NULL,
  `memoid` varchar(128) DEFAULT NULL,
  `errmsg` text,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`,`completed`),
  KEY `payouts_coin` (`idcoin`),
  CONSTRAINT `fk_payouts_account` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_payouts_coin` FOREIGN KEY (`idcoin`) REFERENCES `coins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `rawcoins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `symbol` varchar(32) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `rawcoins` (`id`, `name`, `symbol`, `active`) VALUES
	(1, 'Bitcoin', 'BTC', 1);

CREATE TABLE IF NOT EXISTS `renters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` int DEFAULT NULL,
  `updated` int DEFAULT NULL,
  `address` varchar(1024) DEFAULT NULL,
  `email` varchar(1024) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `apikey` varbinary(1024) DEFAULT NULL,
  `received` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `unconfirmed` double DEFAULT NULL,
  `spent` double DEFAULT NULL,
  `custom_start` double DEFAULT NULL,
  `custom_balance` double DEFAULT NULL,
  `custom_accept` double DEFAULT NULL,
  `custom_reject` double DEFAULT NULL,
  `custom_address` varchar(1024) DEFAULT NULL,
  `custom_server` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `rentertxs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `renterid` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `address` varchar(1024) DEFAULT NULL,
  `tx` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `renterid` (`renterid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `servers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `maxcoins` int DEFAULT NULL,
  `uptime` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `algo` varchar(64) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `speed` bigint DEFAULT NULL,
  `custom_balance` double DEFAULT NULL,
  `custom_accept` double DEFAULT NULL,
  `custom_reject` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(1, 'Nicehash', 'scrypt', 0.0003646, 20628000000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(2, 'Nicehash', 'x11', 0.0004524, 15616000000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(3, 'Nicehash', 'x13', 0.0003273, 185100000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(4, 'Nicehash', 'x15', 0.0004079, 7200000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(5, 'Nicehash', 'nist5', 0.001, 21900000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(6, 'Nicehash', 'sha256', 0.0000098, 2310347791200000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(7, 'Nicehash', 'scryptn', 0.0005521, 1200000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(8, 'Nicehash', 'neoscrypt', 0.0073366, 13600000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(9, 'Nicehash', 'lyra2', 0.0006123, 181400000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(16, 'Nicehash', 'qubit', 0.0001968, 72200000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(17, 'Nicehash', 'quark', 0.0004536, 65978400000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(18, 'Nicehash', 'zr5', 0.0001, 61865000000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(19, 'Nicehash', 'c11', 0.0003403, 11823800000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(20, 'Nicehash', 'keccak', 0.0000027, 153200000, 0, 0, 0);
INSERT INTO `services` (`id`, `name`, `algo`, `price`, `speed`, `custom_balance`, `custom_accept`, `custom_reject`) VALUES
	(21, 'Nicehash', 'whirlx', 0.0000091, 1100700000, 0, 0, 0);

CREATE TABLE IF NOT EXISTS `settings` (
  `param` varchar(128) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `shares` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `workerid` int DEFAULT NULL,
  `coinid` int DEFAULT NULL,
  `jobid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  `error` int DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `extranonce1` tinyint(1) DEFAULT NULL,
  `difficulty` double NOT NULL DEFAULT '0',
  `share_diff` double NOT NULL DEFAULT '0',
  `algo` varchar(16) DEFAULT 'x11',
  `solo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `algo1` (`algo`),
  KEY `valid1` (`valid`),
  KEY `user1` (`userid`),
  KEY `worker1` (`workerid`),
  KEY `coin1` (`coinid`),
  KEY `jobid` (`jobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` int DEFAULT NULL,
  `profit` double DEFAULT NULL,
  `wallet` double DEFAULT NULL,
  `wallets` double DEFAULT NULL,
  `immature` double DEFAULT NULL,
  `margin` double DEFAULT NULL,
  `waiting` double DEFAULT NULL,
  `balances` double DEFAULT NULL,
  `onsell` double DEFAULT NULL,
  `renters` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8mb3;

INSERT INTO `stats` (`id`, `time`, `profit`, `wallet`, `wallets`, `immature`, `margin`, `waiting`, `balances`, `onsell`, `renters`) VALUES
	(382, 1459692900, 0, 0, NULL, NULL, 0, NULL, 0, NULL, NULL);

CREATE TABLE IF NOT EXISTS `stratums` (
  `pid` int NOT NULL,
  `time` int DEFAULT NULL,
  `started` int unsigned DEFAULT NULL,
  `algo` varchar(64) DEFAULT NULL,
  `workers` int unsigned NOT NULL DEFAULT '0',
  `port` int unsigned DEFAULT NULL,
  `symbol` varchar(16) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `fds` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `withdraws` (
  `id` int NOT NULL AUTO_INCREMENT,
  `market` varchar(1024) DEFAULT NULL,
  `address` varchar(1024) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `time` int DEFAULT NULL,
  `uuid` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `workers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT NULL,
  `difficulty` double DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL,
  `dns` varchar(1024) DEFAULT NULL,
  `name` varchar(52) DEFAULT NULL,
  `nonce1` varchar(64) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `worker` varchar(64) DEFAULT NULL,
  `algo` varchar(16) DEFAULT 'scrypt',
  PRIMARY KEY (`id`),
  KEY `algo1` (`algo`),
  KEY `name1` (`name`),
  KEY `userid` (`userid`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- ===== MIGRATION: 2024-03-18-add_aurum_algo.sql =====
INSERT INTO `algos` (`name`, `profit`, `rent`, `factor`) VALUES ('aurum', 0, 0, 1);


-- ===== MIGRATION: 2024-03-29-add_github_version.sql =====
ALTER TABLE `coins` ADD `version_github` VARCHAR(1024) NULL DEFAULT NULL AFTER `specifications`;
ALTER TABLE `coins` ADD `version_installed` VARCHAR(1024) NULL DEFAULT NULL AFTER `version_github`;


-- ===== MIGRATION: 2024-03-31-add_payout_threshold.sql =====
ALTER TABLE `accounts` ADD `payout_threshold` DOUBLE NULL DEFAULT NULL AFTER `hostaddr`;


-- ===== MIGRATION: 2024-04-01-add_auto_exchange.sql =====
ALTER TABLE `coins` ADD `auto_exchange` TINYINT(1) NOT NULL DEFAULT '0' AFTER `version_installed`;
ALTER TABLE `coins` ADD `enable_rpcdebug` TINYINT(1) NOT NULL DEFAULT '0' AFTER `auto_exchange`;


-- ===== MIGRATION: 2024-04-01-shares_blocknumber.sql =====
-- add blocknumber and blockrewarded to shares for real prop implementation

ALTER TABLE `shares` ADD `blocknumber` INT(10) NULL DEFAULT NULL AFTER `solo`;
ALTER TABLE `shares` ADD `blockrewarded` INT(10) NULL DEFAULT NULL AFTER `blocknumber`;


-- ===== MIGRATION: 2024-04-05-algos_port_color.sql =====
-- add certain config options to algo table

ALTER TABLE `algos` ADD `color` VARCHAR(32) NOT NULL DEFAULT '#ffffff' AFTER `overflow`;
ALTER TABLE `algos` ADD `speedfactor` DOUBLE NOT NULL DEFAULT '1' AFTER `color`;
ALTER TABLE `algos` ADD `port` INT(10) NOT NULL DEFAULT '3033' AFTER `speedfactor`;
ALTER TABLE `algos` ADD `visible` TINYINT(3) NOT NULL DEFAULT '0' AFTER `port`;
ALTER TABLE `algos` ADD `powlimit_bits` TINYINT(3) NULL DEFAULT NULL AFTER `visible`;

UPDATE `algos` SET `color` = '#aba0e0', `speedfactor` = 1, `port` = 8335, `visible` = 1 WHERE `name` = '0x10';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 1, `port` = 8633, `visible` = 1 WHERE `name` = 'a5a';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 3691, `visible` = 1 WHERE `name` = 'aergo';
UPDATE `algos` SET `color` = '#80a0d0', `speedfactor` = 1, `port` = 4443, `visible` = 1 WHERE `name` = 'allium';
UPDATE `algos` SET `color` = '#80a0d0', `speedfactor` = 1, `port` = 4230, `visible` = 1 WHERE `name` = 'anime';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 4234, `visible` = 1 WHERE `name` = 'argon2';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 4239, `visible` = 1 WHERE `name` = 'argon2d-dyn';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 4241, `visible` = 1 WHERE `name` = 'argon2d16000';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 4238, `visible` = 1 WHERE `name` = 'argon2d250';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 4240, `visible` = 1 WHERE `name` = 'argon2d4096';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 8640, `visible` = 1 WHERE `name` = 'astralhash';
UPDATE `algos` SET `color` = '#e2e81f', `speedfactor` = 1, `port` = 6434, `visible` = 1 WHERE `name` = 'aurum';
UPDATE `algos` SET `color` = '#e0b0b0', `speedfactor` = 1, `port` = 5100, `visible` = 1 WHERE `name` = 'balloon';
UPDATE `algos` SET `color` = '#e0b0b0', `speedfactor` = 1, `port` = 6433, `visible` = 1 WHERE `name` = 'bastion';
UPDATE `algos` SET `color` = '#ffd880', `speedfactor` = 1, `port` = 3643, `visible` = 1 WHERE `name` = 'bcd';
UPDATE `algos` SET `color` = '#f790c0', `speedfactor` = 1, `port` = 3556, `visible` = 1 WHERE `name` = 'bitcore';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 0.001, `port` = 5733, `visible` = 1 WHERE `name` = 'blake';
UPDATE `algos` SET `color` = '#f2c81f', `speedfactor` = 0.001, `port` = 5766, `visible` = 1 WHERE `name` = 'blake2s';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 0.001, `port` = 5743, `visible` = 1 WHERE `name` = 'blakecoin';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 1, `port` = 5787, `visible` = 1 WHERE `name` = 'bmw512';
UPDATE `algos` SET `color` = '#a0a0d0', `speedfactor` = 1, `port` = 3573, `visible` = 1 WHERE `name` = 'c11';
UPDATE `algos` SET `color` = '#a0a0d0', `speedfactor` = 1, `port` = 3574, `visible` = 1 WHERE `name` = 'cosa';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 4250, `visible` = 1 WHERE `name` = 'cpupower';
UPDATE `algos` SET `color` = '#d0a0a0', `speedfactor` = 1, `port` = 3343, `visible` = 1 WHERE `name` = 'curvehash';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 0.001, `port` = 3252, `visible` = 1 WHERE `name` = 'decred';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 1, `port` = 8833, `visible` = 1 WHERE `name` = 'dedal';
UPDATE `algos` SET `color` = '#e0ffff', `speedfactor` = 1, `port` = 3535, `visible` = 1 WHERE `name` = 'deep';
UPDATE `algos` SET `color` = '#a0c0f0', `speedfactor` = 1, `port` = 5333, `visible` = 1 WHERE `name` = 'dmd-gr';
UPDATE `algos` SET `color` = '#d0a0a0', `speedfactor` = 1, `port` = 3692, `visible` = 1 WHERE `name` = 'geek';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 8650, `visible` = 1 WHERE `name` = 'globalhash';
UPDATE `algos` SET `color` = '#80a0d0', `speedfactor` = 0.001, `port` = 7070, `visible` = 1 WHERE `name` = 'gr';
UPDATE `algos` SET `color` = '#d0a0a0', `speedfactor` = 1, `port` = 5333, `visible` = 1 WHERE `name` = 'groestl';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 1000, `port` = 5136, `visible` = 1 WHERE `name` = 'heavyhash';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 1, `port` = 5135, `visible` = 1 WHERE `name` = 'hex';
UPDATE `algos` SET `color` = '#ffa0a0', `speedfactor` = 1, `port` = 3747, `visible` = 1 WHERE `name` = 'hmq1725';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 1, `port` = 7777, `visible` = 1 WHERE `name` = 'honeycomb';
UPDATE `algos` SET `color` = '#aa70ff', `speedfactor` = 1, `port` = 7433, `visible` = 1 WHERE `name` = 'hsr';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 8660, `visible` = 1 WHERE `name` = 'jeonghash';
UPDATE `algos` SET `color` = '#a0d0c0', `speedfactor` = 1, `port` = 4633, `visible` = 1 WHERE `name` = 'jha';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 0.001, `port` = 5133, `visible` = 1 WHERE `name` = 'keccak';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 0.001, `port` = 5134, `visible` = 1 WHERE `name` = 'keccakc';
UPDATE `algos` SET `color` = '#809aef', `speedfactor` = 1, `port` = 5522, `visible` = 1 WHERE `name` = 'lbk3';
UPDATE `algos` SET `color` = '#b0d0e0', `speedfactor` = 0.001, `port` = 3334, `visible` = 1 WHERE `name` = 'lbry';
UPDATE `algos` SET `color` = '#a0c0c0', `speedfactor` = 1, `port` = 5933, `visible` = 1 WHERE `name` = 'luffa';
UPDATE `algos` SET `color` = '#80a0f0', `speedfactor` = 1, `port` = 4433, `visible` = 1 WHERE `name` = 'lyra2';
UPDATE `algos` SET `color` = '#80a0f0', `speedfactor` = 1, `port` = 4434, `visible` = 1 WHERE `name` = 'lyra2TDC';
UPDATE `algos` SET `color` = '#80c0f0', `speedfactor` = 1, `port` = 4533, `visible` = 1 WHERE `name` = 'lyra2v2';
UPDATE `algos` SET `color` = '#80c0f0', `speedfactor` = 1, `port` = 4550, `visible` = 1 WHERE `name` = 'lyra2v3';
UPDATE `algos` SET `color` = '#80c0f0', `speedfactor` = 1, `port` = 4563, `visible` = 1 WHERE `name` = 'lyra2vc0ban';
UPDATE `algos` SET `color` = '#80b0f0', `speedfactor` = 1, `port` = 4553, `visible` = 1 WHERE `name` = 'lyra2z';
UPDATE `algos` SET `color` = '#80b0f0', `speedfactor` = 1, `port` = 4555, `visible` = 1 WHERE `name` = 'lyra2z330';
UPDATE `algos` SET `color` = '#d0a0a0', `speedfactor` = 1, `port` = 6033, `visible` = 1 WHERE `name` = 'm7m';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7066, `visible` = 1 WHERE `name` = 'megabtx';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7067, `visible` = 1 WHERE `name` = 'megamec';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7020, `visible` = 1 WHERE `name` = 'memehash';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 0.001, `port` = 7079, `visible` = 1 WHERE `name` = 'mike';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7018, `visible` = 1 WHERE `name` = 'minotaur';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7019, `visible` = 1 WHERE `name` = 'minotaurx';
UPDATE `algos` SET `color` = '#a0c0f0', `speedfactor` = 1, `port` = 5433, `visible` = 1 WHERE `name` = 'myr-gr';
UPDATE `algos` SET `color` = '#a0d0f0', `speedfactor` = 1, `port` = 4233, `visible` = 1 WHERE `name` = 'neoscrypt';
UPDATE `algos` SET `color` = '#c0e0e0', `speedfactor` = 1, `port` = 3833, `visible` = 1 WHERE `name` = 'nist5';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 8670, `visible` = 1 WHERE `name` = 'padihash';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 8680, `visible` = 1 WHERE `name` = 'pawelhash';
UPDATE `algos` SET `color` = '#80c0c0', `speedfactor` = 1, `port` = 5833, `visible` = 1 WHERE `name` = 'penta';
UPDATE `algos` SET `color` = '#a0a0e0', `speedfactor` = 1, `port` = 8333, `visible` = 1 WHERE `name` = 'phi';
UPDATE `algos` SET `color` = '#a0a0e0', `speedfactor` = 1, `port` = 8332, `visible` = 1 WHERE `name` = 'phi2';
UPDATE `algos` SET `color` = '#aba0e0', `speedfactor` = 1, `port` = 8334, `visible` = 1 WHERE `name` = 'phi5';
UPDATE `algos` SET `color` = '#a0a0e0', `speedfactor` = 1, `port` = 9393, `visible` = 1 WHERE `name` = 'pipe';
UPDATE `algos` SET `color` = '#dedefe', `speedfactor` = 1, `port` = 8463, `visible` = 1 WHERE `name` = 'polytimos';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 0.001, `port` = 7445, `visible` = 1 WHERE `name` = 'power2b';
UPDATE `algos` SET `color` = '#c0c0c0', `speedfactor` = 1, `port` = 4033, `visible` = 1 WHERE `name` = 'quark';
UPDATE `algos` SET `color` = '#d0a0f0', `speedfactor` = 1, `port` = 4733, `visible` = 1 WHERE `name` = 'qubit';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7443, `visible` = 1 WHERE `name` = 'rainforest';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 5252, `visible` = 1 WHERE `name` = 'renesis';
UPDATE `algos` SET `color` = '#c0c0e0', `speedfactor` = 1, `port` = 3433, `visible` = 1 WHERE `name` = 'scrypt';
UPDATE `algos` SET `color` = '#d0d0d0', `speedfactor` = 1, `port` = 4333, `visible` = 1 WHERE `name` = 'scryptn';
UPDATE `algos` SET `color` = '#d0d0a0', `speedfactor` = 0.001, `port` = 3333, `visible` = 1 WHERE `name` = 'sha256';
UPDATE `algos` SET `color` = '#d0d0a0', `speedfactor` = 1, `port` = 3340, `visible` = 1 WHERE `name` = 'sha256csm';
UPDATE `algos` SET `color` = '#d0d0f0', `speedfactor` = 1, `port` = 3338, `visible` = 1 WHERE `name` = 'sha256dt';
UPDATE `algos` SET `color` = '#d0d0f0', `speedfactor` = 0.001, `port` = 3339, `visible` = 1 WHERE `name` = 'sha256t';
UPDATE `algos` SET `color` = '#d0d0f0', `speedfactor` = 1, `port` = 3335, `visible` = 1 WHERE `name` = 'sha3d';
UPDATE `algos` SET `color` = '#d0d0a0', `speedfactor` = 1000, `port` = 7086, `visible` = 1 WHERE `name` = 'sha512256d';
UPDATE `algos` SET `color` = '#a0a0c0', `speedfactor` = 1, `port` = 5033, `visible` = 1 WHERE `name` = 'sib';
UPDATE `algos` SET `color` = '#80a0a0', `speedfactor` = 1, `port` = 4933, `visible` = 1 WHERE `name` = 'skein';
UPDATE `algos` SET `color` = '#c8a060', `speedfactor` = 1, `port` = 5233, `visible` = 1 WHERE `name` = 'skein2';
UPDATE `algos` SET `color` = '#dedefe', `speedfactor` = 1, `port` = 8433, `visible` = 1 WHERE `name` = 'skunk';
UPDATE `algos` SET `color` = '#d0a0a0', `speedfactor` = 1, `port` = 7091, `visible` = 1 WHERE `name` = 'skydoge';
UPDATE `algos` SET `color` = '#c8a060', `speedfactor` = 1, `port` = 8733, `visible` = 1 WHERE `name` = 'sonoa';
UPDATE `algos` SET `color` = '#f0b0d0', `speedfactor` = 1, `port` = 3555, `visible` = 1 WHERE `name` = 'timetravel';
UPDATE `algos` SET `color` = '#c0d0d0', `speedfactor` = 1, `port` = 8533, `visible` = 1 WHERE `name` = 'tribus';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 1000, `port` = 5755, `visible` = 1 WHERE `name` = 'vanilla';
UPDATE `algos` SET `color` = '#ffffff', `speedfactor` = 1, `port` = 5034, `visible` = 1 WHERE `name` = 'veltor';
UPDATE `algos` SET `color` = '#aac0cc', `speedfactor` = 1, `port` = 6133, `visible` = 1 WHERE `name` = 'velvet';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 3233, `visible` = 1 WHERE `name` = 'vitalium';
UPDATE `algos` SET `color` = '#d0e0e0', `speedfactor` = 1, `port` = 4133, `visible` = 1 WHERE `name` = 'whirlpool';
UPDATE `algos` SET `color` = '#f0f0a0', `speedfactor` = 1, `port` = 3533, `visible` = 1 WHERE `name` = 'x11';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 1, `port` = 3553, `visible` = 1 WHERE `name` = 'x11evo';
UPDATE `algos` SET `color` = '#f0f0a0', `speedfactor` = 1, `port` = 3534, `visible` = 1 WHERE `name` = 'x11k';
UPDATE `algos` SET `color` = '#f0f0a0', `speedfactor` = 1, `port` = 3536, `visible` = 1 WHERE `name` = 'x11kvs';
UPDATE `algos` SET `color` = '#ffe090', `speedfactor` = 1, `port` = 3233, `visible` = 1 WHERE `name` = 'x12';
UPDATE `algos` SET `color` = '#ffd880', `speedfactor` = 1, `port` = 3633, `visible` = 1 WHERE `name` = 'x13';
UPDATE `algos` SET `color` = '#f0c080', `speedfactor` = 1, `port` = 3933, `visible` = 1 WHERE `name` = 'x14';
UPDATE `algos` SET `color` = '#f0b080', `speedfactor` = 1, `port` = 3733, `visible` = 1 WHERE `name` = 'x15';
UPDATE `algos` SET `color` = '#f0b080', `speedfactor` = 1, `port` = 3636, `visible` = 1 WHERE `name` = 'x16r';
UPDATE `algos` SET `color` = '#f0b080', `speedfactor` = 1, `port` = 7220, `visible` = 1 WHERE `name` = 'x16rt';
UPDATE `algos` SET `color` = '#f0b080', `speedfactor` = 1, `port` = 3637, `visible` = 1 WHERE `name` = 'x16rv2';
UPDATE `algos` SET `color` = '#f0b080', `speedfactor` = 1, `port` = 3663, `visible` = 1 WHERE `name` = 'x16s';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 3737, `visible` = 1 WHERE `name` = 'x17';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 3738, `visible` = 1 WHERE `name` = 'x18';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 4300, `visible` = 1 WHERE `name` = 'x20r';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 3323, `visible` = 1 WHERE `name` = 'x21s';
UPDATE `algos` SET `color` = '#f0f0a0', `speedfactor` = 1, `port` = 4200, `visible` = 1 WHERE `name` = 'x22i';
UPDATE `algos` SET `color` = '#f0f0a0', `speedfactor` = 1, `port` = 4210, `visible` = 1 WHERE `name` = 'x25x';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 3739, `visible` = 1 WHERE `name` = 'xevan';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 6233, `visible` = 1 WHERE `name` = 'yescrypt';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 6333, `visible` = 1 WHERE `name` = 'yescryptR16';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 6343, `visible` = 1 WHERE `name` = 'yescryptR32';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 6353, `visible` = 1 WHERE `name` = 'yescryptR8';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6234, `visible` = 1 WHERE `name` = 'yespower';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 0.001, `port` = 6245, `visible` = 1 WHERE `name` = 'yespowerARWN';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6235, `visible` = 1 WHERE `name` = 'yespowerIC';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6240, `visible` = 1 WHERE `name` = 'yespowerIOTS';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6242, `visible` = 1 WHERE `name` = 'yespowerLITB';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6241, `visible` = 1 WHERE `name` = 'yespowerLTNCG';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6244, `visible` = 1 WHERE `name` = 'yespowerMGPC';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6236, `visible` = 1 WHERE `name` = 'yespowerR16';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6237, `visible` = 1 WHERE `name` = 'yespowerRES';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6238, `visible` = 1 WHERE `name` = 'yespowerSUGAR';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6243, `visible` = 1 WHERE `name` = 'yespowerTIDE';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6239, `visible` = 1 WHERE `name` = 'yespowerURX';
UPDATE `algos` SET `color` = '#d0b0d0', `speedfactor` = 1, `port` = 5533, `visible` = 1 WHERE `name` = 'zr5';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 7092, `visible` = 1 WHERE `name` = 'xelisv2-pepew';

-- ===== MIGRATION: 2024-04-22-add_equihash_algos.sql =====
INSERT INTO `algos` (`name`, `factor`, `color`, `port`, `visible`) VALUES ('equihash', 1, '#d0b0d0', 2142, 1);
INSERT INTO `algos` (`name`, `factor`, `color`, `port`, `visible`) VALUES ('equihash125', 1, '#d0b0d0', 2150, 0.001);
INSERT INTO `algos` (`name`, `factor`, `color`, `port`, `visible`) VALUES ('equihash144', 1, '#d0b0d0', 2146, 0.001);
INSERT INTO `algos` (`name`, `factor`, `color`, `port`, `visible`) VALUES ('equihash192', 1, '#d0b0d0', 2144, 0.001);
INSERT INTO `algos` (`name`, `factor`, `color`, `port`, `visible`) VALUES ('equihash96', 1, '#d0b0d0', 2148, 0.001);

-- ===== MIGRATION: 2024-04-23-add_pers_string.sql =====
-- add equihash specific options to coin table
	
ALTER TABLE `coins` ADD `wallet_zaddress` VARCHAR(1024) NULL DEFAULT NULL AFTER `master_wallet`;

ALTER TABLE `coins` ADD `powlimit_bits` TINYINT(3) NULL DEFAULT NULL AFTER `enable_rpcdebug`;
ALTER TABLE `coins` ADD `personalization` VARCHAR(1024) NULL DEFAULT NULL AFTER `powlimit_bits`;


-- ===== MIGRATION: 2024-04-29-add_sellthreshold.sql =====

ALTER TABLE `coins` ADD `sellthreshold` DOUBLE NULL DEFAULT '10000' AFTER `dontsell`;


-- ===== MIGRATION: 2024-05-04-add_neoscrypt_xaya_algo.sql =====
INSERT INTO `algos` (`name`, `factor`, `color`, `port`, `visible`) VALUES ('neoscrypt-xaya', 1, '#a0d0f0', 4238, 1);

-- ===== MIGRATION: 2025-02-06-add_usemweb.sql =====
ALTER TABLE `coins` ADD `usemweb` TINYINT(1) NOT NULL DEFAULT '0' AFTER `usesegwit`;



-- ===== MIGRATION: 2025-02-13-add_xelisv2-pepew.sql =====
INSERT INTO `algos` (`name`, `color`, `speedfactor`, `port`, `visible`, `powlimit_bits`) VALUES
('xelisv2-pepew', '#e2d0d2', 1, 7092, 1, NULL);

-- ===== MIGRATION: 2025-02-23-add_algo_kawpow.sql =====
INSERT INTO `algos` (`name`, `color`, `speedfactor`, `port`, `visible`, `powlimit_bits`) VALUES
('kawpow', '#e2d0d2', 1, 3638, 1, NULL);

-- ===== MIGRATION: 2025-03-31-rename_table_exchange.sql =====
RENAME TABLE `exchange` TO `exchange_deposit`;

-- ===== MIGRATION: 2025-10-05-add_argon2d1000.sql =====
INSERT INTO `algos` (`name`, `color`, `speedfactor`, `port`, `visible`, `powlimit_bits`) VALUES
('argon2d1000', '#e2d0d2', 1, 4242, 1, NULL);

-- ===== MIGRATION: 2025-10-07-add_yespowerADVC.sql =====
INSERT INTO `algos` (`name`, `color`, `speedfactor`, `port`, `visible`, `powlimit_bits`) VALUES
('yespowerADVC', '#e2d0d2', 1, 6248, 1, NULL);

-- ===== MIGRATION: 2025-10-27-add_flex.sql =====
INSERT INTO `algos` (`name`, `color`, `speedfactor`, `port`, `visible`, `powlimit_bits`) VALUES
('flex', '#e2d0d2', 1, 3341, 1, NULL);

-- ===== MIGRATION: 2025-10-27-add_rinhash.sql =====
INSERT INTO `algos` (`name`, `color`, `speedfactor`, `port`, `visible`, `powlimit_bits`) VALUES
('rinhash', '#e2d0d2', 1, 7444, 1, NULL);

-- ===== MIGRATION: 2025-10-28-add_algo_phihash.sql =====
INSERT INTO `algos` (`name`, `color`, `speedfactor`, `port`, `visible`, `powlimit_bits`) VALUES
('phihash', '#e2d0d2', 1, 1329, 1, NULL);

-- ===== MIGRATION: 2025-11-19-add_algo_meowpow.sql =====
INSERT INTO `algos` (`name`, `color`, `speedfactor`, `port`, `visible`, `powlimit_bits`) VALUES
('meowpow', '#e2d0d2', 1, 4284, 1, NULL);

-- ===== MIGRATION: 2025-12-16-add_algo_soterg.sql =====
INSERT INTO `algos` (`name`, `color`, `speedfactor`, `port`, `visible`, `powlimit_bits`) VALUES
('soterg', '#e2d0d2', 1, 7156, 1, NULL);

-- ===== SYNC ALGOS FROM STRATUM =====
TRUNCATE TABLE `algos`;
INSERT INTO `algos` (`name`,`profit`,`rent`,`factor`,`overflow`,`color`,`speedfactor`,`port`,`visible`,`powlimit_bits`) VALUES
('0x10',0,0,1,0,'#ffffff',1,8335,1,NULL),
('a5a',0,0,1,0,'#ffffff',1,8633,1,NULL),
('aergo',0,0,1,0,'#ffffff',1,3691,1,NULL),
('allium',0,0,1,0,'#ffffff',1,4443,1,NULL),
('anime',0,0,1,0,'#ffffff',1,4230,1,NULL),
('argon2d250',0,0,1,0,'#ffffff',1,4238,1,NULL),
('argon2d500',0,0,1,0,'#ffffff',1,4239,1,NULL),
('argon2d1000',0,0,1,0,'#ffffff',1,4242,1,NULL),
('argon2d16000',0,0,1,0,'#ffffff',1,4241,1,NULL),
('astralhash',0,0,1,0,'#ffffff',1,8640,1,NULL),
('aurum',0,0,1,0,'#ffffff',1,6434,1,NULL),
('balloon',0,0,1,0,'#ffffff',1,5100,1,NULL),
('bastion',0,0,1,0,'#ffffff',1,6433,1,NULL),
('bcd',0,0,1,0,'#ffffff',1,3643,1,NULL),
('bitcore',0,0,1,0,'#ffffff',1,3556,1,NULL),
('blake',0,0,1,0,'#ffffff',1,5733,1,NULL),
('blake2s',0,0,1,0,'#ffffff',1,5766,1,NULL),
('blakecoin',0,0,1,0,'#ffffff',1,5743,1,NULL),
('bmw',0,0,1,0,'#ffffff',1,0,0,NULL),
('bmw512',0,0,1,0,'#ffffff',1,5787,1,NULL),
('c11',0,0,1,0,'#ffffff',1,3573,1,NULL),
('cosa',0,0,1,0,'#ffffff',1,3574,1,NULL),
('cpupower',0,0,1,0,'#ffffff',1,4250,1,NULL),
('curvehash',0,0,1,0,'#ffffff',1,3343,1,NULL),
('decred',0,0,1,0,'#ffffff',1,3252,1,NULL),
('dedal',0,0,1,0,'#ffffff',1,8833,1,NULL),
('deep',0,0,1,0,'#ffffff',1,3535,1,NULL),
('dmd-gr',0,0,1,0,'#ffffff',1,5333,1,NULL),
('equihash',0,0,1,0,'#ffffff',1,2142,1,NULL),
('equihash125',0,0,1,0,'#ffffff',1,2150,1,NULL),
('equihash144',0,0,1,0,'#ffffff',1,2146,1,NULL),
('equihash192',0,0,1,0,'#ffffff',1,2144,1,NULL),
('equihash96',0,0,1,0,'#ffffff',1,2148,1,NULL),
('firopow',0,0,1,0,'#ffffff',1,0,0,NULL),
('flex',0,0,1,0,'#ffffff',1,3341,1,NULL),
('fresh',0,0,1,0,'#ffffff',1,4144,1,NULL),
('geek',0,0,1,0,'#ffffff',1,3691,1,NULL),
('gr',0,0,1,0,'#ffffff',1,7070,1,NULL),
('groestl',0,0,1,0,'#ffffff',1,0,0,NULL),
('heavyhash',0,0,1,0,'#ffffff',1,5136,1,NULL),
('hex',0,0,1,0,'#ffffff',1,0,0,NULL),
('hive',0,0,1,0,'#ffffff',1,6033,1,NULL),
('hmq1725',0,0,1,0,'#ffffff',1,3747,1,NULL),
('honeycomb',0,0,1,0,'#ffffff',1,7777,1,NULL),
('hsr',0,0,1,0,'#ffffff',1,7433,1,NULL),
('interchained',0,0,1,0,'#ffffff',1,6250,1,NULL),
('jeonghash',0,0,1,0,'#ffffff',1,8660,1,NULL),
('jha',0,0,1,0,'#ffffff',1,4633,1,NULL),
('kawpow',0,0,1,0,'#ffffff',1,3638,1,NULL),
('keccak',0,0,1,0,'#ffffff',1,5133,1,NULL);

INSERT INTO `algos` (`name`,`profit`,`rent`,`factor`,`overflow`,`color`,`speedfactor`,`port`,`visible`,`powlimit_bits`) VALUES
('keccakc',0,0,1,0,'#ffffff',1,5134,1,NULL),
('lbk3',0,0,1,0,'#ffffff',1,5522,1,NULL),
('lbry',0,0,1,0,'#ffffff',1,3334,1,NULL),
('luffa',0,0,1,0,'#ffffff',1,5933,1,NULL),
('lyra2',0,0,1,0,'#ffffff',1,4433,1,NULL),
('lyra2v2',0,0,1,0,'#ffffff',1,4533,1,NULL),
('lyra2v3',0,0,1,0,'#ffffff',1,4550,1,NULL),
('lyra2vc0ban',0,0,1,0,'#ffffff',1,4563,1,NULL),
('lyra2z',0,0,1,0,'#ffffff',1,4553,1,NULL),
('lyra2z330',0,0,1,0,'#ffffff',1,4555,1,NULL),
('m7m',0,0,1,0,'#ffffff',1,6033,1,NULL),
('memehash',0,0,1,0,'#ffffff',1,7020,1,NULL),
('meowpow',0,0,1,0,'#ffffff',1,4284,1,NULL),
('megabtx',0,0,1,0,'#ffffff',1,7066,1,NULL),
('megamec',0,0,1,0,'#ffffff',1,7067,1,NULL),
('mike',0,0,1,0,'#ffffff',1,7079,1,NULL),
('minotaur',0,0,1,0,'#ffffff',1,7018,1,NULL),
('minotaurx',0,0,1,0,'#ffffff',1,7019,1,NULL),
('myr-gr',0,0,1,0,'#ffffff',1,5433,1,NULL),
('neoscrypt',0,0,1,0,'#ffffff',1,4233,1,NULL),
('neoscrypt-xaya',0,0,1,0,'#ffffff',1,4238,1,NULL),
('nist5',0,0,1,0,'#ffffff',1,3833,1,NULL),
('pawelhash',0,0,1,0,'#ffffff',1,8680,1,NULL),
('penta',0,0,1,0,'#ffffff',1,5833,1,NULL),
('phi',0,0,1,0,'#ffffff',1,8333,1,NULL),
('phi2',0,0,1,0,'#ffffff',1,8332,1,NULL),
('phi5',0,0,1,0,'#ffffff',1,8334,1,NULL),
('phihash',0,0,1,0,'#ffffff',1,1329,1,NULL),
('pipe',0,0,1,0,'#ffffff',1,9393,1,NULL),
('polytimos',0,0,1,0,'#ffffff',1,8463,1,NULL),
('power2b',0,0,1,0,'#ffffff',1,7445,1,NULL),
('quark',0,0,1,0,'#ffffff',1,4033,1,NULL),
('qubit',0,0,1,0,'#ffffff',1,4733,1,NULL),
('rainforest',0,0,1,0,'#ffffff',1,7443,1,NULL),
('renesis',0,0,1,0,'#ffffff',1,5252,1,NULL),
('rinhash',0,0,1,0,'#ffffff',1,7444,1,NULL),
('scrypt',0,0,1,0,'#ffffff',1,3433,1,NULL),
('scryptn',0,0,1,0,'#ffffff',1,4333,1,NULL),
('sha256',0,0,1,0,'#ffffff',1,3333,1,NULL),
('sha256d',0,0,1,0,'#ffffff',1,0,0,NULL),
('sha256dt',0,0,1,0,'#ffffff',1,3338,1,NULL),
('sha256csm',0,0,1,0,'#ffffff',1,0,0,NULL),
('sha256t',0,0,1,0,'#ffffff',1,3339,1,NULL),
('sha3d',0,0,1,0,'#ffffff',1,3335,1,NULL),
('sha512256d',0,0,1,0,'#ffffff',1,7086,1,NULL),
('sib',0,0,1,0,'#ffffff',1,5033,1,NULL),
('skydoge',0,0,1,0,'#ffffff',1,0,0,NULL),
('skein',0,0,1,0,'#ffffff',1,4933,1,NULL),
('skein2',0,0,1,0,'#ffffff',1,0,0,NULL),
('skunk',0,0,1,0,'#ffffff',1,8433,1,NULL);

INSERT INTO `algos` (`name`,`profit`,`rent`,`factor`,`overflow`,`color`,`speedfactor`,`port`,`visible`,`powlimit_bits`) VALUES
('sonoa',0,0,1,0,'#ffffff',1,8733,1,NULL),
('soterg',0,0,1,0,'#ffffff',1,7156,1,NULL),
('timetravel',0,0,1,0,'#ffffff',1,3555,1,NULL),
('tribus',0,0,1,0,'#ffffff',1,8533,1,NULL),
('vanilla',0,0,1,0,'#ffffff',1,5755,1,NULL),
('veltor',0,0,1,0,'#ffffff',1,5034,1,NULL),
('velvet',0,0,1,0,'#ffffff',1,6133,1,NULL),
('vitalium',0,0,1,0,'#ffffff',1,3233,1,NULL),
('x11',0,0,1,0,'#ffffff',1,3533,1,NULL),
('x11evo',0,0,1,0,'#ffffff',1,3553,1,NULL),
('x11k',0,0,1,0,'#ffffff',1,3534,1,NULL),
('x11kvs',0,0,1,0,'#ffffff',1,3536,1,NULL),
('x12',0,0,1,0,'#ffffff',1,3233,1,NULL),
('x13',0,0,1,0,'#ffffff',1,3633,1,NULL),
('x14',0,0,1,0,'#ffffff',1,3933,1,NULL),
('x15',0,0,1,0,'#ffffff',1,3733,1,NULL),
('x16r',0,0,1,0,'#ffffff',1,3636,1,NULL),
('x16rv2',0,0,1,0,'#ffffff',1,3637,1,NULL),
('x16rt',0,0,1,0,'#ffffff',1,7220,1,NULL),
('x16s',0,0,1,0,'#ffffff',1,3663,1,NULL),
('x17',0,0,1,0,'#ffffff',1,3737,1,NULL),
('x17r',0,0,1,0,'#ffffff',1,0,0,NULL),
('x18',0,0,1,0,'#ffffff',1,3738,1,NULL),
('x20r',0,0,1,0,'#ffffff',1,4300,1,NULL),
('x21s',0,0,1,0,'#ffffff',1,3323,1,NULL),
('x22',0,0,1,0,'#ffffff',1,0,0,NULL),
('x22i',0,0,1,0,'#ffffff',1,4200,1,NULL),
('x25x',0,0,1,0,'#ffffff',1,4210,1,NULL),
('xevan',0,0,1,0,'#ffffff',1,3739,1,NULL),
('xelisv2-pepew',0,0,1,0,'#ffffff',1,7092,1,NULL),
('yescrypt',0,0,1,0,'#ffffff',1,6233,1,NULL),
('yescryptR8',0,0,1,0,'#ffffff',1,6353,1,NULL),
('yescryptR16',0,0,1,0,'#ffffff',1,6333,1,NULL),
('yescryptR32',0,0,1,0,'#ffffff',1,6343,1,NULL),
('yespower',0,0,1,0,'#ffffff',1,6234,1,NULL),
('yespowerIC',0,0,1,0,'#ffffff',1,6235,1,NULL),
('yespowerIOTS',0,0,1,0,'#ffffff',1,6240,1,NULL),
('yespowerLITB',0,0,1,0,'#ffffff',1,6242,1,NULL),
('yespowerLTNCG',0,0,1,0,'#ffffff',1,6241,1,NULL),
('yespowerR16',0,0,1,0,'#ffffff',1,6236,1,NULL),
('yespowerRES',0,0,1,0,'#ffffff',1,0,0,NULL),
('yespowerSUGAR',0,0,1,0,'#ffffff',1,6238,1,NULL),
('yespowerTIDE',0,0,1,0,'#ffffff',1,6243,1,NULL),
('yespowerURX',0,0,1,0,'#ffffff',1,6239,1,NULL),
('yespowerMGPC',0,0,1,0,'#ffffff',1,6244,1,NULL),
('yespowerARWN',0,0,1,0,'#ffffff',1,6245,1,NULL),
('yespowerADVC',0,0,1,0,'#ffffff',1,6248,1,NULL),
('whirlcoin',0,0,1,0,'#ffffff',1,0,0,NULL),
('whirlpool',0,0,1,0,'#ffffff',1,4133,1,NULL),
('whirlpoolx',0,0,1,0,'#ffffff',1,0,0,NULL);

INSERT INTO `algos` (`name`,`profit`,`rent`,`factor`,`overflow`,`color`,`speedfactor`,`port`,`visible`,`powlimit_bits`) VALUES
('zr5',0,0,1,0,'#ffffff',1,0,0,NULL);

-- Helpful view to see coin->algo->port mapping in web UI
DROP VIEW IF EXISTS `coins_algo_ports`;
CREATE VIEW `coins_algo_ports` AS
SELECT c.id AS coinid, c.symbol, c.name AS coin_name, c.algo, a.port AS algo_port, a.visible AS algo_visible
FROM coins c
LEFT JOIN algos a ON a.name = c.algo;

-- Quick sanity checks (they don't modify data)
-- 1) coins using an algo that doesn't exist in algos table
SELECT c.id, c.symbol, c.algo
FROM coins c
LEFT JOIN algos a ON a.name = c.algo
WHERE c.algo IS NOT NULL AND c.algo <> '' AND a.id IS NULL;

-- 2) algos with port 0 (need you to assign port + create stratum config if you want to enable)
SELECT name FROM algos WHERE port=0 OR port IS NULL;

SET FOREIGN_KEY_CHECKS=1;
