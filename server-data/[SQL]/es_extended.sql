-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.32-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64 (AMD64)
-- HeidiSQL Versione:            12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database es_extended
CREATE DATABASE IF NOT EXISTS `es_extended` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `es_extended`;

-- Dump della struttura di tabella es_extended.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.addon_account: ~16 rows (circa)
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Savings account', 0),
	('caution', 'caution', 0),
	('society_ambulance', 'EMS', 1),
	('society_ammu', 'Ammu', 1),
	('society_baker', 'Baker', 1),
	('society_ballas', 'Ballas', 1),
	('society_banker', 'Bank', 1),
	('society_bennys', 'Bennys', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_governament', 'Governo', 1),
	('society_import', 'Import', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('society_tridente', 'Tridente', 1),
	('society_unicorn', 'Unicorn', 1);

-- Dump della struttura di tabella es_extended.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.addon_account_data: ~16 rows (circa)
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_mechanic', 0, NULL),
	(2, 'society_ambulance', 0, NULL),
	(3, 'society_ammu', 0, NULL),
	(4, 'society_baker', 0, NULL),
	(5, 'society_ballas', 0, NULL),
	(6, 'society_banker', 0, NULL),
	(7, 'society_cardealer', 0, NULL),
	(8, 'society_import', 0, NULL),
	(9, 'society_police', 0, NULL),
	(10, 'society_taxi', 0, NULL),
	(11, 'society_unicorn', 0, NULL),
	(12, 'caution', 0, ''),
	(13, 'bank_savings', 0, ''),
	(14, 'society_bennys', 0, NULL),
	(15, 'society_governament', 0, NULL),
	(16, 'society_tridente', 0, NULL);

-- Dump della struttura di tabella es_extended.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.addon_inventory: ~13 rows (circa)
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1),
	('society_ammu', 'Ammu', 1),
	('society_baker', 'Baker', 1),
	('society_ballas', 'Ballas', 1),
	('society_bennys', 'Bennys', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_governament', 'Governo', 1),
	('society_import', 'Import', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('society_tridente', 'Tridente', 1),
	('society_unicorn', 'Unicorn', 1);

-- Dump della struttura di tabella es_extended.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.addon_inventory_items: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.afk_kick_log
CREATE TABLE IF NOT EXISTS `afk_kick_log` (
  `steam_id` varchar(50) NOT NULL,
  `kick_count` int(11) DEFAULT 0,
  `last_kick` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.afk_kick_log: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.banking
CREATE TABLE IF NOT EXISTS `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=671 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.banking: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.banned_players
CREATE TABLE IF NOT EXISTS `banned_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `steam_id` varchar(50) NOT NULL,
  `discord_id` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `reason` text NOT NULL,
  `banned_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.banned_players: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.bpt_doorlock
CREATE TABLE IF NOT EXISTS `bpt_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.bpt_doorlock: ~23 rows (circa)
INSERT INTO `bpt_doorlock` (`id`, `name`, `data`) VALUES
	(2, 'vec3(434.744446, -981.916870, 30.815304)', '{"state":1,"groups":{"police":0},"maxDistance":2,"doors":[{"heading":270,"coords":{"x":434.74444580078127,"y":-980.7555541992188,"z":30.81530380249023},"model":-1547307588},{"heading":90,"coords":{"x":434.74444580078127,"y":-983.078125,"z":30.81530380249023},"model":-1547307588}],"coords":{"x":434.74444580078127,"y":-981.9168701171875,"z":30.81530380249023}}'),
	(4, 'vec3(441.900482, -998.746216, 30.815304)', '{"state":0,"groups":{"police":0},"maxDistance":2,"doors":[{"heading":0,"coords":{"x":440.73919677734377,"y":-998.7462158203125,"z":30.81530380249023},"model":-1547307588},{"heading":180,"coords":{"x":443.061767578125,"y":-998.7462158203125,"z":30.81530380249023},"model":-1547307588}],"coords":{"x":441.9004821777344,"y":-998.7462158203125,"z":30.81530380249023}}'),
	(5, 'vec3(457.047455, -972.254272, 30.815308)', '{"state":0,"groups":{"police":0},"maxDistance":2,"doors":[{"heading":180,"coords":{"x":458.208740234375,"y":-972.2542724609375,"z":30.8153076171875},"model":-1547307588},{"heading":0,"coords":{"x":455.88616943359377,"y":-972.2542724609375,"z":30.8153076171875},"model":-1547307588}],"coords":{"x":457.0474548339844,"y":-972.2542724609375,"z":30.8153076171875}}'),
	(6, 'vec3(468.571442, -1014.406006, 26.483816)', '{"state":0,"groups":{"police":0},"maxDistance":2,"doors":[{"heading":180,"coords":{"x":469.7742614746094,"y":-1014.406005859375,"z":26.48381614685058},"model":-692649124},{"heading":0,"coords":{"x":467.3686218261719,"y":-1014.406005859375,"z":26.48381614685058},"model":-692649124}],"coords":{"x":468.5714416503906,"y":-1014.406005859375,"z":26.48381614685058}}'),
	(7, 'vec3(476.615692, -1008.875427, 26.480055)', '{"model":-53345114,"heading":270,"groups":{"police":0},"maxDistance":2,"doors":false,"state":0,"coords":{"x":476.6156921386719,"y":-1008.8754272460938,"z":26.48005485534668},"holdOpen":true}'),
	(8, 'vec3(477.912598, -1012.188660, 26.480055)', '{"model":-53345114,"heading":0,"groups":{"police":0},"maxDistance":2,"doors":false,"state":0,"coords":{"x":477.91259765625,"y":-1012.1886596679688,"z":26.48005485534668},"holdOpen":true}'),
	(9, 'vec3(480.912811, -1012.188660, 26.480055)', '{"model":-53345114,"heading":0,"groups":{"police":0},"maxDistance":2,"doors":false,"state":0,"coords":{"x":480.9128112792969,"y":-1012.1886596679688,"z":26.48005485534668},"holdOpen":true}'),
	(10, 'vec3(483.912720, -1012.188660, 26.480055)', '{"model":-53345114,"heading":0,"groups":{"police":0},"maxDistance":2,"doors":false,"state":0,"coords":{"x":483.9127197265625,"y":-1012.1886596679688,"z":26.48005485534668},"holdOpen":true}'),
	(11, 'vec3(486.913116, -1012.188660, 26.480055)', '{"model":-53345114,"heading":0,"groups":{"police":0},"maxDistance":2,"doors":false,"state":0,"coords":{"x":486.9131164550781,"y":-1012.1886596679688,"z":26.48005485534668},"holdOpen":true}'),
	(12, 'vec3(484.176422, -1007.734375, 26.480055)', '{"model":-53345114,"heading":180,"groups":{"police":0},"maxDistance":2,"doors":false,"state":0,"coords":{"x":484.1764221191406,"y":-1007.734375,"z":26.48005485534668},"holdOpen":true}'),
	(13, 'vec3(481.008362, -1004.117981, 26.480055)', '{"model":-53345114,"heading":180,"groups":{"police":0},"maxDistance":2,"doors":false,"state":0,"coords":{"x":481.00836181640627,"y":-1004.1179809570313,"z":26.48005485534668},"holdOpen":true}'),
	(14, 'vec3(458.654327, -990.649780, 30.823193)', '{"model":-96679321,"heading":270,"groups":{"police":4},"maxDistance":2,"doors":false,"state":0,"coords":{"x":458.6543273925781,"y":-990.6497802734375,"z":30.82319259643554},"holdOpen":true}'),
	(15, 'vec3(464.308563, -984.528442, 43.771240)', '{"model":-692649124,"heading":90,"groups":{"police":0},"maxDistance":2,"doors":false,"state":0,"coords":{"x":464.3085632324219,"y":-984.5284423828125,"z":43.771240234375},"holdOpen":true}'),
	(16, 'vec3(479.750732, -999.629028, 30.789167)', '{"model":-692649124,"heading":90,"groups":{"police":0},"maxDistance":2,"doors":false,"state":0,"coords":{"x":479.750732421875,"y":-999.6290283203125,"z":30.7891674041748},"holdOpen":true}'),
	(17, 'vec3(487.437836, -1000.189270, 30.786972)', '{"model":-692649124,"heading":181,"groups":{"police":0},"maxDistance":2,"doors":false,"state":0,"coords":{"x":487.4378356933594,"y":-1000.1892700195313,"z":30.78697204589843},"holdOpen":true}'),
	(18, 'vec3(-334.745819, -155.533310, 43.598030)', '{"state":0,"groups":{"mechanic":0},"maxDistance":2,"doors":[{"heading":83,"coords":{"x":-334.8790283203125,"y":-156.7007598876953,"z":43.59878540039062},"model":1142444161},{"heading":264,"coords":{"x":-334.61260986328127,"y":-154.36585998535157,"z":43.59727096557617},"model":1142444161}],"coords":{"x":-334.7458190917969,"y":-155.53330993652345,"z":43.59803009033203}}'),
	(19, 'vec3(-33.809895, -1107.578735, 26.572254)', '{"groups":{"cardealer":3},"coords":{"x":-33.80989456176758,"y":-1107.5787353515626,"z":26.5722541809082},"heading":70,"doors":false,"maxDistance":2,"model":-2051651622,"state":1}'),
	(20, 'vec3(127.955238, -1298.503418, 29.419622)', '{"groups":{"unicorn":0},"coords":{"x":127.95523834228516,"y":-1298.50341796875,"z":29.41962242126465},"heading":30,"doors":false,"maxDistance":2,"model":-1116041313,"state":1}'),
	(21, 'vec3(-205.682831, -1310.682617, 30.295719)', '{"model":-427498890,"heading":0,"maxDistance":2,"doors":false,"groups":{"bennys":0},"holdOpen":true,"coords":{"x":-205.68283081054688,"y":-1310.6826171875,"z":30.29571914672851},"auto":true,"state":1}'),
	(22, 'vec3(811.877075, -2148.282227, 29.724934)', '{"maxDistance":2,"coords":{"x":811.8770751953125,"y":-2148.2822265625,"z":29.72493362426757},"doors":[{"coords":{"x":813.16796875,"y":-2148.26953125,"z":29.72493362426757},"heading":181,"model":-816468097},{"coords":{"x":810.5861206054688,"y":-2148.295166015625,"z":29.72493362426757},"heading":181,"model":-2112350883}],"groups":{"ammu":0},"state":1}'),
	(23, 'vec3(814.958984, -2162.975342, 29.768448)', '{"heading":270,"maxDistance":2,"coords":{"x":814.958984375,"y":-2162.975341796875,"z":29.76844787597656},"model":452874391,"doors":false,"groups":{"ammu":0},"state":1}'),
	(24, 'vec3(827.538391, -2160.493164, 29.768448)', '{"model":452874391,"heading":0,"passcode":"empire","doors":false,"maxDistance":2,"state":1,"coords":{"x":827.5383911132813,"y":-2160.4931640625,"z":29.76844787597656}}'),
	(28, 'vec3(307.118195, -569.568970, 43.433910)', '{"groups":{"ambulance":3},"heading":340,"lockpick":true,"doors":false,"model":854291622,"maxDistance":2,"holdOpen":true,"coords":{"x":307.1181945800781,"y":-569.5689697265625,"z":43.43391036987305},"state":1}');

-- Dump della struttura di tabella es_extended.bpt_items
CREATE TABLE IF NOT EXISTS `bpt_items` (
  `name` text DEFAULT NULL,
  `label` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.bpt_items: ~73 rows (circa)
INSERT INTO `bpt_items` (`name`, `label`) VALUES
	('bandage', 'bandage'),
	('cottonforbandages', 'cottonforbandages'),
	('cotton', 'cotton'),
	('ironsheet', 'ironsheet'),
	('steelsheet', 'steelsheet'),
	('garbage', 'garbage'),
	('WEAPON_APPISTOL', 'WEAPON APPISTOL'),
	('iron', 'iron'),
	('hammer', 'hammer'),
	('wood', 'Legna'),
	('fixkit', 'fixkit'),
	('almondmilk', 'almondmilk'),
	('ice', 'ice'),
	('water', 'water'),
	('almonds', 'almonds'),
	('chips', 'chips'),
	('fries', 'fries'),
	('potato', 'patato'),
	('trash_can', 'trash can'),
	('recycled_paper', 'recycled paper'),
	('paper', 'paper'),
	('newspaper', 'newspaper'),
	('trash_burgershot', 'trash burgershot'),
	('cigarette_paper', 'cigarette paper'),
	('cigarrette_opium', 'cigarrette opium'),
	('opium', 'opium'),
	('copper', 'copper'),
	('gold', 'gold'),
	('gunpowder', 'gunpowder'),
	('ammo-sniper', '7.62 NATO'),
	('grain', 'grain'),
	('flour', 'flour'),
	('bread', 'empty sandwich'),
	('ammo-9', '9mm'),
	('WEAPON_KNIFE', 'Knife'),
	('WEAPON_KNUCKLE', 'KNUCKLE'),
	('steel', 'steel'),
	('plastic_bag', 'Plastic bag'),
	('recycled_plastic', 'Recycled plastic'),
	('WEAPON_NIGHTSTICK', 'NIGHTSTICK'),
	('WEAPON_PISTOL', 'Pistol'),
	('marijuana', 'marijuana'),
	('cannabis', 'Cannabis'),
	('diamond_tip', 'Diamond tip'),
	('diamond', 'Diamond'),
	('marijuana_extract', 'Marijuana extract'),
	('medikit', 'Medikit'),
	('armour', 'armour'),
	('WEAPON_FLASHLIGHT', 'WEAPON FLASHLIGHT'),
	('contract', 'Contract'),
	('at_suppressor_light', 'Suppressor'),
	('WEAPON_COMBATSHOTGUN', 'WEAPON COMBATSHOTGUN'),
	('ammo-shotgun', 'ammo shotgun'),
	('salmon', 'Salmon'),
	('fry_oil', 'Fry oil'),
	('grilled_salmon', 'grilled salmon'),
	('WEAPON_PISTOL_MK2', 'WEAPON PISTOL MK2'),
	('at_skin_luxe', 'Tint Gold'),
	('grilled_trout', 'Grilled trout'),
	('trout', 'Trout'),
	('at_flashlight', 'Flashlight'),
	('tuna_sandwich', 'Tuna sandwich'),
	('tuna', 'Tuna'),
	('appledrink', 'Appledrink'),
	('apple', 'Apple'),
	('diamond_hammer', 'Diamond hammer'),
	('stone_mortar', 'Stone mortar'),
	('stone', 'Stone'),
	('WEAPON_SNIPERRIFLE', 'SNIPERRIFLE'),
	('WEAPON_STUNGUN', 'STUNGUN'),
	('kitchen_knife', 'kitchen knife'),
	('WEAPON_TECPISTOL', 'WEAPON TECPISTOL'),
	('mixed_fried_fish', 'mixed fried fish');

-- Dump della struttura di tabella es_extended.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.cardealer_vehicles: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.car_parking
CREATE TABLE IF NOT EXISTS `car_parking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `parking` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dump dei dati della tabella es_extended.car_parking: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.datastore: ~17 rows (circa)
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_ammu', 'Ammu', 1),
	('society_baker', 'Baker', 1),
	('society_ballas', 'Ballas', 1),
	('society_bennys', 'Bennys', 1),
	('society_governament', 'Governo', 1),
	('society_import', 'Import', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('society_tridente', 'Tridente', 1),
	('society_unicorn', 'Unicorn', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Dump della struttura di tabella es_extended.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=778 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.datastore_data: ~437 rows (circa)
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(3, 'society_mechanic', NULL, '{"garage":[]}'),
	(5, 'property', NULL, '{}'),
	(6, 'society_ambulance', NULL, '\'{}\''),
	(7, 'society_ammu', NULL, '\'{}\''),
	(8, 'society_baker', NULL, '\'{}\''),
	(9, 'society_ballas', NULL, '\'{}\''),
	(12, 'society_import', NULL, '\'{}\''),
	(13, 'society_police', NULL, '\'{}\''),
	(14, 'society_taxi', NULL, '\'{}\''),
	(15, 'society_unicorn', NULL, '\'{}\''),
	(16, 'property', NULL, '{}'),
	(17, 'property', NULL, '{}'),
	(18, 'user_mask', '', '{}'),
	(19, 'user_ears', '', '{}'),
	(20, 'user_glasses', '', '{}'),
	(21, 'user_helmet', '', '{}'),
	(22, 'property', '', '{}'),
	(23, 'property', NULL, '{}'),
	(24, 'property', NULL, '{}'),
	(25, 'property', NULL, '{}'),
	(26, 'property', NULL, '{}'),
	(27, 'property', NULL, '{}'),
	(28, 'property', NULL, '{}'),
	(29, 'property', NULL, '{}'),
	(30, 'property', NULL, '{}'),
	(31, 'property', NULL, '{}'),
	(32, 'property', NULL, '{}'),
	(33, 'property', NULL, '{}'),
	(34, 'property', NULL, '{}'),
	(35, 'property', NULL, '{}'),
	(46, 'property', NULL, '{}'),
	(47, 'property', NULL, '{}'),
	(48, 'property', NULL, '{}'),
	(49, 'property', NULL, '{}'),
	(55, 'property', NULL, '{}'),
	(56, 'property', NULL, '{}'),
	(57, 'property', NULL, '{}'),
	(63, 'property', NULL, '{}'),
	(64, 'property', NULL, '{}'),
	(65, 'property', NULL, '{}'),
	(66, 'property', NULL, '{}'),
	(67, 'property', NULL, '{}'),
	(68, 'property', NULL, '{}'),
	(69, 'property', NULL, '{}'),
	(75, 'property', NULL, '{}'),
	(76, 'property', NULL, '{}'),
	(82, 'property', NULL, '{}'),
	(83, 'property', NULL, '{}'),
	(84, 'property', NULL, '{}'),
	(85, 'property', NULL, '{}'),
	(86, 'property', NULL, '{}'),
	(87, 'property', NULL, '{}'),
	(88, 'property', NULL, '{}'),
	(94, 'property', NULL, '{}'),
	(100, 'property', NULL, '{}'),
	(101, 'property', NULL, '{}'),
	(102, 'property', NULL, '{}'),
	(103, 'property', NULL, '{}'),
	(104, 'property', NULL, '{}'),
	(105, 'property', NULL, '{}'),
	(106, 'property', NULL, '{}'),
	(112, 'property', NULL, '{}'),
	(113, 'property', NULL, '{}'),
	(114, 'property', NULL, '{}'),
	(120, 'property', NULL, '{}'),
	(121, 'property', NULL, '{}'),
	(122, 'property', NULL, '{}'),
	(123, 'property', NULL, '{}'),
	(124, 'property', NULL, '{}'),
	(125, 'property', NULL, '{}'),
	(126, 'property', NULL, '{}'),
	(127, 'property', NULL, '{}'),
	(133, 'property', NULL, '{}'),
	(134, 'property', NULL, '{}'),
	(135, 'property', NULL, '{}'),
	(136, 'property', NULL, '{}'),
	(137, 'property', NULL, '{}'),
	(143, 'property', NULL, '{}'),
	(144, 'property', NULL, '{}'),
	(145, 'property', NULL, '{}'),
	(146, 'property', NULL, '{}'),
	(147, 'property', NULL, '{}'),
	(158, 'property', NULL, '{}'),
	(159, 'property', NULL, '{}'),
	(160, 'property', NULL, '{}'),
	(166, 'property', NULL, '{}'),
	(167, 'property', NULL, '{}'),
	(168, 'property', NULL, '{}'),
	(174, 'property', NULL, '{}'),
	(175, 'property', NULL, '{}'),
	(176, 'property', NULL, '{}'),
	(177, 'property', NULL, '{}'),
	(178, 'property', NULL, '{}'),
	(179, 'property', NULL, '{}'),
	(180, 'property', NULL, '{}'),
	(181, 'property', NULL, '{}'),
	(187, 'property', NULL, '{}'),
	(208, 'property', NULL, '{}'),
	(209, 'property', NULL, '{}'),
	(215, 'property', NULL, '{}'),
	(221, 'property', NULL, '{}'),
	(227, 'property', NULL, '{}'),
	(228, 'property', NULL, '{}'),
	(234, 'property', NULL, '{}'),
	(235, 'property', NULL, '{}'),
	(236, 'property', NULL, '{}'),
	(237, 'property', NULL, '{}'),
	(238, 'property', NULL, '{}'),
	(239, 'property', NULL, '{}'),
	(240, 'property', NULL, '{}'),
	(251, 'property', NULL, '{}'),
	(252, 'property', NULL, '{}'),
	(253, 'property', NULL, '{}'),
	(254, 'property', NULL, '{}'),
	(255, 'property', NULL, '{}'),
	(256, 'property', NULL, '{}'),
	(257, 'property', NULL, '{}'),
	(258, 'property', NULL, '{}'),
	(264, 'property', NULL, '{}'),
	(265, 'property', NULL, '{}'),
	(266, 'property', NULL, '{}'),
	(267, 'property', NULL, '{}'),
	(268, 'property', NULL, '{}'),
	(269, 'property', NULL, '{}'),
	(270, 'property', NULL, '{}'),
	(271, 'property', NULL, '{}'),
	(272, 'property', NULL, '{}'),
	(273, 'property', NULL, '{}'),
	(279, 'property', NULL, '{}'),
	(280, 'property', NULL, '{}'),
	(281, 'property', NULL, '{}'),
	(282, 'property', NULL, '{}'),
	(283, 'property', NULL, '{}'),
	(284, 'property', NULL, '{}'),
	(290, 'property', NULL, '{}'),
	(291, 'property', NULL, '{}'),
	(292, 'property', NULL, '{}'),
	(293, 'property', NULL, '{}'),
	(294, 'property', NULL, '{}'),
	(295, 'property', NULL, '{}'),
	(296, 'property', NULL, '{}'),
	(297, 'property', NULL, '{}'),
	(298, 'property', NULL, '{}'),
	(309, 'property', NULL, '{}'),
	(310, 'property', NULL, '{}'),
	(316, 'property', NULL, '{}'),
	(317, 'property', NULL, '{}'),
	(318, 'property', NULL, '{}'),
	(319, 'property', NULL, '{}'),
	(320, 'property', NULL, '{}'),
	(321, 'property', NULL, '{}'),
	(322, 'property', NULL, '{}'),
	(323, 'property', NULL, '{}'),
	(329, 'property', NULL, '{}'),
	(330, 'property', NULL, '{}'),
	(331, 'property', NULL, '{}'),
	(332, 'property', NULL, '{}'),
	(333, 'property', NULL, '{}'),
	(334, 'property', NULL, '{}'),
	(340, 'property', NULL, '{}'),
	(341, 'property', NULL, '{}'),
	(347, 'property', NULL, '{}'),
	(348, 'property', NULL, '{}'),
	(349, 'property', NULL, '{}'),
	(350, 'property', NULL, '{}'),
	(356, 'property', NULL, '{}'),
	(357, 'property', NULL, '{}'),
	(358, 'property', NULL, '{}'),
	(369, 'property', NULL, '{}'),
	(370, 'property', NULL, '{}'),
	(371, 'property', NULL, '{}'),
	(372, 'property', NULL, '{}'),
	(373, 'property', NULL, '{}'),
	(374, 'property', NULL, '{}'),
	(375, 'property', NULL, '{}'),
	(381, 'property', NULL, '{}'),
	(382, 'property', NULL, '{}'),
	(383, 'property', NULL, '{}'),
	(384, 'property', NULL, '{}'),
	(385, 'property', NULL, '{}'),
	(391, 'property', NULL, '{}'),
	(392, 'property', NULL, '{}'),
	(393, 'property', NULL, '{}'),
	(394, 'property', NULL, '{}'),
	(405, 'property', NULL, '{}'),
	(411, 'property', NULL, '{}'),
	(412, 'property', NULL, '{}'),
	(413, 'property', NULL, '{}'),
	(414, 'property', NULL, '{}'),
	(415, 'property', NULL, '{}'),
	(416, 'property', NULL, '{}'),
	(417, 'property', NULL, '{}'),
	(418, 'property', NULL, '{}'),
	(419, 'property', NULL, '{}'),
	(420, 'property', NULL, '{}'),
	(421, 'property', NULL, '{}'),
	(422, 'property', NULL, '{}'),
	(423, 'property', NULL, '{}'),
	(424, 'property', NULL, '{}'),
	(425, 'property', NULL, '{}'),
	(426, 'property', NULL, '{}'),
	(427, 'property', NULL, '{}'),
	(428, 'property', NULL, '{}'),
	(429, 'property', NULL, '{}'),
	(430, 'property', NULL, '{}'),
	(431, 'property', NULL, '{}'),
	(437, 'property', NULL, '{}'),
	(438, 'property', NULL, '{}'),
	(444, 'property', NULL, '{}'),
	(450, 'property', NULL, '{}'),
	(451, 'property', NULL, '{}'),
	(457, 'property', NULL, '{}'),
	(458, 'property', NULL, '{}'),
	(459, 'property', NULL, '{}'),
	(460, 'property', NULL, '{}'),
	(461, 'property', NULL, '{}'),
	(462, 'property', NULL, '{}'),
	(468, 'property', NULL, '{}'),
	(474, 'property', NULL, '{}'),
	(475, 'property', NULL, '{}'),
	(476, 'property', NULL, '{}'),
	(477, 'property', NULL, '{}'),
	(478, 'property', NULL, '{}'),
	(479, 'property', NULL, '{}'),
	(480, 'property', NULL, '{}'),
	(481, 'property', NULL, '{}'),
	(482, 'property', NULL, '{}'),
	(483, 'property', NULL, '{}'),
	(484, 'property', NULL, '{}'),
	(485, 'property', NULL, '{}'),
	(486, 'property', NULL, '{}'),
	(487, 'property', NULL, '{}'),
	(488, 'property', NULL, '{}'),
	(489, 'property', NULL, '{}'),
	(490, 'property', NULL, '{}'),
	(491, 'property', NULL, '{}'),
	(492, 'property', NULL, '{}'),
	(493, 'property', NULL, '{}'),
	(494, 'property', NULL, '{}'),
	(495, 'property', NULL, '{}'),
	(501, 'property', NULL, '{}'),
	(507, 'property', NULL, '{}'),
	(508, 'property', NULL, '{}'),
	(509, 'property', NULL, '{}'),
	(510, 'property', NULL, '{}'),
	(511, 'property', NULL, '{}'),
	(512, 'property', NULL, '{}'),
	(513, 'property', NULL, '{}'),
	(519, 'property', NULL, '{}'),
	(520, 'property', NULL, '{}'),
	(521, 'property', NULL, '{}'),
	(537, 'property', NULL, '{}'),
	(538, 'property', NULL, '{}'),
	(544, 'property', NULL, '{}'),
	(545, 'property', NULL, '{}'),
	(546, 'property', NULL, '{}'),
	(547, 'property', NULL, '{}'),
	(548, 'property', NULL, '{}'),
	(549, 'property', NULL, '{}'),
	(550, 'property', NULL, '{}'),
	(551, 'property', NULL, '{}'),
	(552, 'property', NULL, '{}'),
	(553, 'property', NULL, '{}'),
	(554, 'property', NULL, '{}'),
	(555, 'property', NULL, '{}'),
	(556, 'property', NULL, '{}'),
	(567, 'property', NULL, '{}'),
	(568, 'property', NULL, '{}'),
	(569, 'property', NULL, '{}'),
	(575, 'property', NULL, '{}'),
	(576, 'property', NULL, '{}'),
	(577, 'property', NULL, '{}'),
	(578, 'property', NULL, '{}'),
	(579, 'property', NULL, '{}'),
	(580, 'property', NULL, '{}'),
	(581, 'property', NULL, '{}'),
	(582, 'property', NULL, '{}'),
	(583, 'property', NULL, '{}'),
	(584, 'property', NULL, '{}'),
	(585, 'property', NULL, '{}'),
	(586, 'property', NULL, '{}'),
	(587, 'property', NULL, '{}'),
	(588, 'property', NULL, '{}'),
	(589, 'property', NULL, '{}'),
	(590, 'property', NULL, '{}'),
	(591, 'property', NULL, '{}'),
	(592, 'property', NULL, '{}'),
	(593, 'property', NULL, '{}'),
	(594, 'property', NULL, '{}'),
	(595, 'property', NULL, '{}'),
	(596, 'property', NULL, '{}'),
	(597, 'property', NULL, '{}'),
	(598, 'property', NULL, '{}'),
	(599, 'property', NULL, '{}'),
	(600, 'property', NULL, '{}'),
	(601, 'property', NULL, '{}'),
	(602, 'property', NULL, '{}'),
	(603, 'property', NULL, '{}'),
	(604, 'property', NULL, '{}'),
	(605, 'property', NULL, '{}'),
	(606, 'property', NULL, '{}'),
	(607, 'property', NULL, '{}'),
	(608, 'property', NULL, '{}'),
	(609, 'property', NULL, '{}'),
	(610, 'property', NULL, '{}'),
	(611, 'property', NULL, '{}'),
	(612, 'property', NULL, '{}'),
	(613, 'property', NULL, '{}'),
	(614, 'property', NULL, '{}'),
	(615, 'property', NULL, '{}'),
	(616, 'property', NULL, '{}'),
	(617, 'property', NULL, '{}'),
	(618, 'property', NULL, '{}'),
	(619, 'property', NULL, '{}'),
	(620, 'property', NULL, '{}'),
	(621, 'property', NULL, '{}'),
	(622, 'property', NULL, '{}'),
	(623, 'property', NULL, '{}'),
	(624, 'property', NULL, '{}'),
	(630, 'property', NULL, '{}'),
	(631, 'property', NULL, '{}'),
	(632, 'property', NULL, '{}'),
	(633, 'property', NULL, '{}'),
	(634, 'property', NULL, '{}'),
	(635, 'property', NULL, '{}'),
	(636, 'property', NULL, '{}'),
	(637, 'property', NULL, '{}'),
	(638, 'property', NULL, '{}'),
	(639, 'property', NULL, '{}'),
	(640, 'property', NULL, '{}'),
	(641, 'property', NULL, '{}'),
	(642, 'property', NULL, '{}'),
	(643, 'property', NULL, '{}'),
	(644, 'property', NULL, '{}'),
	(645, 'property', NULL, '{}'),
	(651, 'property', NULL, '{}'),
	(652, 'property', NULL, '{}'),
	(653, 'property', NULL, '{}'),
	(654, 'property', NULL, '{}'),
	(655, 'property', NULL, '{}'),
	(656, 'property', NULL, '{}'),
	(657, 'property', NULL, '{}'),
	(663, 'property', NULL, '{}'),
	(664, 'property', NULL, '{}'),
	(665, 'property', NULL, '{}'),
	(666, 'property', NULL, '{}'),
	(667, 'property', NULL, '{}'),
	(668, 'property', NULL, '{}'),
	(674, 'property', NULL, '{}'),
	(675, 'property', NULL, '{}'),
	(676, 'property', NULL, '{}'),
	(677, 'property', NULL, '{}'),
	(678, 'property', NULL, '{}'),
	(679, 'society_bennys', NULL, '\'{}\''),
	(680, 'property', NULL, '{}'),
	(686, 'property', NULL, '{}'),
	(687, 'property', NULL, '{}'),
	(688, 'property', NULL, '{}'),
	(689, 'property', NULL, '{}'),
	(690, 'property', NULL, '{}'),
	(691, 'property', NULL, '{}'),
	(692, 'society_governament', NULL, '\'{}\''),
	(693, 'property', NULL, '{}'),
	(694, 'property', NULL, '{}'),
	(695, 'property', NULL, '{}'),
	(696, 'property', NULL, '{}'),
	(697, 'property', NULL, '{}'),
	(698, 'property', NULL, '{}'),
	(699, 'property', NULL, '{}'),
	(700, 'property', NULL, '{}'),
	(706, 'property', NULL, '{}'),
	(712, 'property', NULL, '{}'),
	(713, 'property', NULL, '{}'),
	(714, 'property', NULL, '{}'),
	(715, 'property', NULL, '{}'),
	(716, 'property', NULL, '{}'),
	(717, 'property', NULL, '{}'),
	(718, 'property', NULL, '{}'),
	(719, 'property', NULL, '{}'),
	(720, 'property', NULL, '{}'),
	(721, 'property', NULL, '{}'),
	(722, 'property', NULL, '{}'),
	(723, 'property', NULL, '{}'),
	(724, 'property', NULL, '{}'),
	(725, 'property', NULL, '{}'),
	(726, 'property', NULL, '{}'),
	(727, 'property', NULL, '{}'),
	(728, 'property', NULL, '{}'),
	(729, 'property', NULL, '{}'),
	(730, 'property', NULL, '{}'),
	(731, 'property', NULL, '{}'),
	(732, 'society_tridente', NULL, '\'{}\''),
	(733, 'property', NULL, '{}'),
	(734, 'property', NULL, '{}'),
	(735, 'property', NULL, '{}'),
	(736, 'property', NULL, '{}'),
	(737, 'property', NULL, '{}'),
	(738, 'property', NULL, '{}'),
	(739, 'property', NULL, '{}'),
	(740, 'property', NULL, '{}'),
	(741, 'property', NULL, '{}'),
	(742, 'property', NULL, '{}'),
	(743, 'property', NULL, '{}'),
	(744, 'property', NULL, '{}'),
	(745, 'property', NULL, '{}'),
	(746, 'property', NULL, '{}'),
	(747, 'property', NULL, '{}'),
	(748, 'property', NULL, '{}'),
	(749, 'property', NULL, '{}'),
	(750, 'property', NULL, '{}'),
	(751, 'property', NULL, '{}'),
	(752, 'property', NULL, '{}'),
	(753, 'property', NULL, '{}'),
	(754, 'property', NULL, '{}'),
	(755, 'property', NULL, '{}'),
	(756, 'property', NULL, '{}'),
	(757, 'property', NULL, '{}'),
	(758, 'property', NULL, '{}'),
	(759, 'property', NULL, '{}'),
	(760, 'property', NULL, '{}'),
	(761, 'property', NULL, '{}'),
	(762, 'property', NULL, '{}'),
	(763, 'property', NULL, '{}'),
	(764, 'property', NULL, '{}'),
	(765, 'property', NULL, '{}'),
	(766, 'property', NULL, '{}'),
	(767, 'property', NULL, '{}'),
	(768, 'property', NULL, '{}'),
	(769, 'property', NULL, '{}'),
	(770, 'property', NULL, '{}'),
	(771, 'property', NULL, '{}'),
	(772, 'property', NULL, '{}'),
	(773, 'property', NULL, '{}'),
	(774, 'property', NULL, '{}'),
	(775, 'property', NULL, '{}'),
	(776, 'property', NULL, '{}'),
	(777, 'property', NULL, '{}');

-- Dump della struttura di tabella es_extended.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.fine_types: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.items: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.jobs: ~15 rows (circa)
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 1),
	('ammu', 'Armeria', 1),
	('baker', 'Panettiere', 1),
	('ballas', 'Ballas', 1),
	('bennys', 'Bennys', 1),
	('cardealer', 'Cardealer', 1),
	('delivery', 'Delivery', 0),
	('governament', 'Governo', 1),
	('import', 'Import', 1),
	('mechanic', 'Mechanic', 1),
	('police', 'Police', 1),
	('taxi', 'Taxi', 0),
	('tridente', 'Tridente', 1),
	('unemployed', 'Unemployed', 0),
	('unicorn', 'Unicorn', 1);

-- Dump della struttura di tabella es_extended.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.job_grades: ~65 rows (circa)
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
	(41, 'ammu', 0, 'apprentice', 'Apprentice', 20, '{}', '{}'),
	(42, 'ammu', 1, 'gunsmith', 'Gunsmith', 40, '{}', '{}'),
	(43, 'ammu', 2, 'armorychief', 'Armory Chief', 60, '{}', '{}'),
	(44, 'ammu', 3, 'deputydirector', 'Deputy Director', 85, '{}', '{}'),
	(45, 'ammu', 4, 'boss', 'Boss', 100, '{}', '{}'),
	(46, 'baker', 0, 'apprentice', 'Apprentice', 20, '{}', '{}'),
	(47, 'baker', 1, 'baker', 'Baker', 40, '{}', '{}'),
	(48, 'baker', 2, 'chief', 'Chief', 60, '{}', '{}'),
	(49, 'baker', 3, 'deputydirector', 'Deputy Director', 85, '{}', '{}'),
	(50, 'baker', 4, 'boss', 'Boss', 100, '{}', '{}'),
	(51, 'ballas', 0, 'little', 'Little', 12, '{}', '{}'),
	(52, 'ballas', 1, 'henchman', 'Henchman', 24, '{}', '{}'),
	(53, 'ballas', 2, 'trustedman', 'Trusted man', 36, '{}', '{}'),
	(54, 'ballas', 3, 'adviser', 'Adviser', 48, '{}', '{}'),
	(55, 'ballas', 4, 'boss', 'Boss', 2000, '{}', '{}'),
	(56, 'delivery', 0, 'delivery', 'Delivery', 500, '{}', '{}'),
	(67, 'import', 0, 'ontrial', 'Dipendente in prova', 500, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(68, 'import', 1, 'employee', 'Dipendente', 1000, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(69, 'import', 2, 'driver', 'Autista', 1250, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(70, 'import', 3, 'responsible', 'Responsible', 1500, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(71, 'import', 4, 'boss', 'Direttore', 1, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(72, 'unicorn', 0, 'ontrial', 'Dipendente in Prova', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(73, 'unicorn', 1, 'employee', 'Dipendente', 500, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(74, 'unicorn', 2, 'driver', 'Autista', 250, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(75, 'unicorn', 3, 'responsible', 'Responsabile', 750, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(76, 'unicorn', 4, 'boss', 'Dirigente', 1, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(77, 'ambulance', 0, 'ambulance', 'Infermiere', 1, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(78, 'ambulance', 1, 'doctor', 'Dottore', 1, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(79, 'ambulance', 2, 'chief_doctor', 'Primario', 1, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(80, 'ambulance', 3, 'boss', 'Direttore sanitario', 1, '{"tshirt_2\\":0,\\"hair_color_1\\":5,\\"glasses_2\\":3,\\"shoes\\":9,\\"torso_2\\":3,\\"hair_color_2\\":0,\\"pants_1\\":24,\\"glasses_1\\":4,\\"hair_1\\":2,\\"sex\\":0,\\"decals_2\\":0,\\"tshirt_1\\":15,\\"helmet_1\\":8,\\"helmet_2\\":0,\\"arms\\":92,\\"face\\":19,\\"decals_1\\":60,\\"torso_1\\":13,\\"hair_2\\":0,\\"skin\\":34,\\"pants_2\\":5}\',\'{\\"tshirt_2\\":3,\\"decals_2\\":0,\\"glasses\\":0,\\"hair_1\\":2,\\"torso_1\\":73,\\"shoes\\":1,\\"hair_color_2\\":0,\\"glasses_1\\":19,\\"skin\\":13,\\"face\\":6,\\"pants_2\\":5,\\"tshirt_1\\":75,\\"pants_1\\":37,\\"helmet_1\\":57,\\"torso_2\\":0,\\"arms\\":14,\\"sex\\":1,\\"glasses_2\\":0,\\"decals_1\\":0,\\"hair_2\\":0,\\"helmet_2\\":0,\\"hair_color_1\\":0}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(81, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
	(82, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
	(83, 'mechanic', 2, 'experimente', 'Experienced', 36, '{}', '{}'),
	(84, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
	(85, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}'),
	(86, 'police', 0, 'recruit', 'Recruit', 20, '{}', '{}'),
	(87, 'police', 1, 'officer', 'Officer', 40, '{}', '{}'),
	(88, 'police', 2, 'sergeant', 'Sergeant', 60, '{}', '{}'),
	(89, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
	(90, 'police', 4, 'boss', 'Chief', 100, '{}', '{}'),
	(91, 'taxi', 0, 'recrue', 'Recluta', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(92, 'taxi', 1, 'novice', 'Novizio', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(93, 'taxi', 2, 'experimente', 'Tassista', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(94, 'taxi', 3, 'uber', 'Tassista Esperto', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(95, 'taxi', 4, 'boss', 'Direttore', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(96, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
	(97, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(98, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
	(99, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(100, 'bennys', 0, 'apprentice', 'Apprentice', 20, '{}', '{}'),
	(101, 'bennys', 1, 'gunsmith', 'Gunsmith', 40, '{}', '{}'),
	(102, 'bennys', 2, 'bennyschief', 'Bennys Chief', 60, '{}', '{}'),
	(103, 'bennys', 3, 'deputydirector', 'Deputy Director', 85, '{}', '{}'),
	(104, 'bennys', 4, 'boss', 'Boss', 900, '{}', '{}'),
	(105, 'governament', 0, 'apprentice', 'Agente EPU', 20, '{}', '{}'),
	(106, 'governament', 1, 'gunsmith', 'Giudice', 40, '{}', '{}'),
	(107, 'governament', 2, 'governamentchief', 'Giudice Capo', 60, '{}', '{}'),
	(108, 'governament', 3, 'deputydirector', 'Sindaco', 85, '{}', '{}'),
	(109, 'governament', 4, 'boss', 'Governatore', 100, '{}', '{}'),
	(110, 'tridente', 0, 'apprentice', 'Picciotto', 0, '{}', '{}'),
	(111, 'tridente', 1, 'gunsmith', 'Soldato', 0, '{}', '{}'),
	(112, 'tridente', 2, 'tridentechief', 'Sottocapo', 0, '{}', '{}'),
	(113, 'tridente', 3, 'deputydirector', 'Consigliere', 0, '{}', '{}'),
	(114, 'tridente', 4, 'boss', 'Vertice', 0, '{}', '{}');

-- Dump della struttura di tabella es_extended.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.licenses: ~6 rows (circa)
INSERT INTO `licenses` (`type`, `label`) VALUES
	('boat', 'Boat License'),
	('dmv', 'Driving Permit'),
	('drive', 'Drivers License'),
	('drive_bike', 'Motorcycle License'),
	('drive_truck', 'Commercial Drivers License'),
	('weapon', 'Weapon License');

-- Dump della struttura di tabella es_extended.money_laundry
CREATE TABLE IF NOT EXISTS `money_laundry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `ready_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.money_laundry: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.multicharacter_slots
CREATE TABLE IF NOT EXISTS `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.multicharacter_slots: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_calls
CREATE TABLE IF NOT EXISTS `npwd_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_calls: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_darkchat_channels
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_identifier` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_darkchat_channels: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_darkchat_channel_members
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_darkchat_channel_members: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_darkchat_messages
CREATE TABLE IF NOT EXISTS `npwd_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_image` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_darkchat_messages: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_marketplace_listings
CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_marketplace_listings: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_match_profiles
CREATE TABLE IF NOT EXISTS `npwd_match_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `voiceMessage` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_match_profiles: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_match_views
CREATE TABLE IF NOT EXISTS `npwd_match_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_profile_idx` (`profile`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_match_views: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_messages
CREATE TABLE IF NOT EXISTS `npwd_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL,
  `user_identifier` varchar(48) NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_identifier` (`user_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_messages: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_messages_conversations
CREATE TABLE IF NOT EXISTS `npwd_messages_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_list` varchar(225) NOT NULL,
  `label` varchar(60) DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_messages_conversations: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_messages_participants
CREATE TABLE IF NOT EXISTS `npwd_messages_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) NOT NULL,
  `unread_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
  CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_messages_participants: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_notes
CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_notes: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_phone_contacts
CREATE TABLE IF NOT EXISTS `npwd_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_phone_contacts: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_phone_gallery
CREATE TABLE IF NOT EXISTS `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_phone_gallery: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_twitter_likes
CREATE TABLE IF NOT EXISTS `npwd_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_twitter_likes: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_twitter_profiles
CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.file.glass/QrEvq.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_twitter_profiles: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_twitter_reports
CREATE TABLE IF NOT EXISTS `npwd_twitter_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_twitter_reports: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.npwd_twitter_tweets
CREATE TABLE IF NOT EXISTS `npwd_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(46) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
  CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.npwd_twitter_tweets: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.outfits
CREATE TABLE IF NOT EXISTS `outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `ped` longtext DEFAULT NULL,
  `components` longtext DEFAULT NULL,
  `props` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dump dei dati della tabella es_extended.outfits: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `blocked_for_fine` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `peopleWithKeys` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.owned_vehicles: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.ox_inventory: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.radiocar
CREATE TABLE IF NOT EXISTS `radiocar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `url` varchar(256) NOT NULL,
  `spz` varchar(32) NOT NULL,
  `index_music` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella es_extended.radiocar: ~4 rows (circa)
INSERT INTO `radiocar` (`id`, `label`, `url`, `spz`, `index_music`) VALUES
	(1, 'Higher', 'https://www.youtube.com/watch?v=HlITBQPicbM', 'OOU 434 ', 0),
	(2, '2 grams', 'https://www.youtube.com/watch?v=Izd1qi_CDFI', 'OOU 434 ', 1),
	(3, 'dog food', 'https://www.youtube.com/watch?v=IkYvD1Fof_0', 'OOU 434 ', 2),
	(4, 'maybach', 'https://www.youtube.com/watch?v=gVGRIBWy6ig', 'OOU 434 ', 3);

-- Dump della struttura di tabella es_extended.radiocar_owned
CREATE TABLE IF NOT EXISTS `radiocar_owned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spz` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella es_extended.radiocar_owned: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.rented_vehicles: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `crafting_level` int(11) NOT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT current_timestamp(),
  `play_time` int(11) DEFAULT 0,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.users: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.user_licenses: ~0 rows (circa)

-- Dump della struttura di tabella es_extended.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.vehicles: ~232 rows (circa)
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 1200000, 'super'),
	('Akuma', 'AKUMA', 1050000, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1050000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');

-- Dump della struttura di tabella es_extended.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.vehicle_categories: ~11 rows (circa)
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'CoupÃƒÆ’Ã‚Â©s'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');

-- Dump della struttura di tabella es_extended.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella es_extended.vehicle_sold: ~0 rows (circa)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
