DROP TABLE IF EXISTS `gct_newspaper`;
CREATE TABLE `gct_newspaper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;