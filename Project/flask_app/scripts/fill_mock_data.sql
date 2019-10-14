#
# TABLE STRUCTURE FOR: admin
#
set foreign_key_checks=0;

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_login` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` tinyblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_login` (`admin_login`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (1, 'desiree.bergstrom', 'ca00b7a252e5e0c4019ef6750436e359f590b9fd');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (2, 'rward', '847254847ebdcdc91ad019f0901cbed4cff62114');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (3, 'maggio.adrianna', 'be7bb7f58e8e0fd2b272b6d6a3b339954fd98a39');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (4, 'qjacobi', '84143b249ff079611964a0e5d791952165ba2ee5');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (5, 'auer.emilio', '506d77b8474dae6df2e419c03980665539727219');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (6, 'august.corkery', 'cdb040e5b7c6acb7f241058ceb011967e60ea9f3');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (7, 'larson.laurie', '0ec5ea97881907fb70bde58d63618c38029dced8');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (8, 'ikuhlman', '10c2b25c86f1b050f9a3db20922e96fb89f0148a');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (9, 'brown.jailyn', 'e0b9ac9e4a2c7f08141511323da0f7f9edf23b40');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (10, 'fjaskolski', '39b45aa4c86882eee035c240aa438116ab9cd543');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (11, 'steuber.johnnie', '208223cc69fe8ad9b4f56588b7b75ff05bebc2e1');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (12, 'kylie17', 'bb6aeb2e93f4f8641fe103f6d62b802ae40567a0');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (13, 'smoore', '605b4c3188276665746f5c3d816f3b505fa6b8e5');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (14, 'kody95', '7f26677ad6f4cee685b2ac468f38fe47c9ccea34');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (15, 'block.ramiro', '836cde62e1b390c156362bfeff07acf13b3a7400');


#
# TABLE STRUCTURE FOR: announcement
#

DROP TABLE IF EXISTS `announcement`;

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `title` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (1, '1982-01-06 06:15:17', 'Illo voluptate aut unde aperiam molestiae.', 'In sapiente quos earum nisi fugiat voluptatibus. Dolor voluptas aut aliquam excepturi modi quam. Sed atque doloribus et a aut nisi nesciunt. Rerum ad quia quae velit ut dignissimos. Sunt nisi neque iure provident accusantium optio nulla.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (2, '2014-04-24 05:16:58', 'Et tenetur est ab ad et.', 'Molestiae occaecati amet et doloribus dolorem rem expedita. Ut ad qui et ratione qui. Vel est tempore omnis perspiciatis.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (3, '2016-06-13 01:15:25', 'Ad rerum nulla voluptates ipsam rerum reprehenderit.', 'Et temporibus voluptate vel adipisci ea libero suscipit. Beatae laboriosam ipsa temporibus molestiae omnis voluptate. Aut qui nihil voluptatem dolores et qui natus aut.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (4, '1974-06-18 04:15:22', 'Sint et aspernatur sed et.', 'Consequatur qui in et. Atque quia qui dicta accusamus error dolorem ipsum earum. Et laudantium magnam cumque molestiae amet inventore assumenda. Vitae eaque quod dolorum ut quo mollitia.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (5, '2002-05-05 14:34:03', 'Repudiandae deserunt voluptas aut aspernatur.', 'Veritatis accusamus tempora doloribus non officiis. Delectus aut qui aperiam nobis. Molestiae quia ab nostrum voluptas ut voluptas praesentium. Facilis consequatur debitis minima id.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (6, '1972-08-09 10:30:52', 'Quibusdam sequi voluptatem quis molestias laboriosam.', 'Fugit commodi cum quis minima dolorum. Provident porro sint et tempora officiis. Molestiae est voluptatem et ex.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (7, '2017-09-28 21:22:31', 'Corrupti quis et doloribus tenetur vel esse laboriosam.', 'Est ducimus sint a mollitia occaecati rerum sed. Magnam vitae in inventore non. Sit occaecati voluptatum tempora qui deleniti incidunt tempore. Perspiciatis ipsa tempora molestiae possimus atque unde quisquam.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (8, '2017-09-07 00:07:07', 'Et culpa animi sunt non sit eius.', 'Id voluptates veniam illo debitis expedita. Velit voluptatem magni repellendus cupiditate impedit. Adipisci velit corrupti soluta laudantium.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (9, '1983-12-02 04:05:22', 'Suscipit quas harum amet iure ducimus est ipsam consectetur.', 'Quis et voluptates iure maiores. Ex repellendus commodi voluptatem voluptatem deserunt dignissimos similique. Quaerat libero nesciunt maiores et quaerat aliquam.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (10, '1985-07-12 17:50:44', 'Et nesciunt voluptas assumenda.', 'Neque natus sapiente voluptatem ea voluptas officia quae. Sit incidunt id voluptatem quae blanditiis quod. Et quam repellat maiores et aspernatur est tenetur. Amet voluptas eum nulla et nam sunt.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (11, '2013-06-24 16:10:24', 'Tempora eos soluta quia ex in qui.', 'Amet sapiente dolores doloremque. Quia ipsam sunt aspernatur facilis dolore est modi adipisci. Id neque quaerat dignissimos pariatur. Omnis impedit animi eos. Nihil suscipit nemo molestiae voluptatem enim.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (12, '2011-08-31 13:46:04', 'Aliquid et cumque et natus sint corrupti voluptatem.', 'Ipsam harum id occaecati vitae occaecati vel. Adipisci amet dolorum eum quia officiis quasi voluptas accusantium.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (13, '1988-10-18 01:16:57', 'Aut doloremque possimus odio consequuntur.', 'In deleniti optio nihil reiciendis. Dolorum ut repellat modi explicabo dolores quia aut. Ut voluptatem voluptatibus voluptate est excepturi.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (14, '1984-12-28 21:57:52', 'Exercitationem inventore reiciendis et sunt sit similique velit.', 'At incidunt cupiditate eligendi architecto dolores deleniti et. Sed beatae officia odit. Qui laborum aspernatur excepturi consequatur. Eum sequi voluptatibus mollitia ut.');
INSERT INTO `announcement` (`id`, `time`, `title`, `body`) VALUES (15, '2011-08-05 18:59:06', 'Quia omnis deserunt deserunt pariatur fugiat.', 'Nulla eos perspiciatis atque doloribus reprehenderit iure aut aut. Fuga quidem molestiae aperiam sapiente similique consequatur hic.');


#
# TABLE STRUCTURE FOR: comment
#

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (1, 'Unde consequuntur ea laborum incidunt porro facere. Explicabo et dolores ut officia. Dolor eveniet labore tempore consequatur. Enim at reiciendis qui enim.', '2012-08-28 04:58:49', 1, 1);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (2, 'Molestias tenetur culpa ex nisi sed ut expedita est. Optio consequuntur eum sed ad reiciendis. Eveniet accusantium cupiditate ullam ad. Voluptas omnis ipsum quas atque blanditiis corporis sapiente dolor.', '1985-11-03 23:28:54', 2, 2);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (3, 'Tempora autem molestias voluptatum facere enim non et. Doloremque sed dolorem sit odit.', '2009-11-02 09:27:55', 3, 3);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (4, 'Expedita quo odit dolores qui vero eum accusantium autem. Fuga nam nulla numquam. Tenetur et quis qui velit vero totam.', '1973-04-23 20:19:50', 4, 4);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (5, 'Est nulla sint eos soluta. Ut distinctio voluptatem quasi quo quia necessitatibus ipsa. Aliquam aut tenetur inventore magni. At pariatur at sit culpa dolor magni.', '2001-08-27 10:36:38', 5, 5);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (6, 'Quia omnis accusamus quia repellendus iure. Dolor minima possimus sit nulla ratione voluptatem illo. Id quae officiis cum qui voluptas vel sunt. Exercitationem sint porro nihil commodi odio neque qui.', '1996-11-25 08:42:00', 6, 6);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (7, 'Sit fuga et iste veritatis impedit. A dolorem sed natus. Quaerat occaecati iste voluptas itaque quibusdam. Est quae nulla et quas cum voluptate.', '2000-12-13 01:32:43', 7, 7);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (8, 'Qui impedit beatae velit et neque totam est. Molestias quia laudantium quis quam. Totam commodi temporibus culpa inventore id rerum asperiores. Reiciendis vitae odio nisi aut.', '2015-03-16 06:29:57', 8, 8);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (9, 'Odio odio delectus sit quibusdam iste autem. Voluptatem sed quam debitis veritatis esse. Molestias aut perferendis explicabo nisi reprehenderit inventore. Aliquid et velit veniam enim.', '1971-06-21 20:15:37', 9, 9);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (10, 'Fugit veritatis quia veniam. Ullam culpa quibusdam qui occaecati. Est tempora sit dolorum architecto.', '2015-10-22 19:22:21', 10, 10);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (11, 'Ut est nisi quis maiores beatae. Et quasi quo temporibus esse. Et quas autem quisquam sequi asperiores quidem. Suscipit architecto sunt esse labore perspiciatis deserunt.', '2000-07-10 00:08:24', 11, 11);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (12, 'In sint totam vero sit illo rerum aut. Aut adipisci eligendi cumque veniam minima. Illo perspiciatis expedita voluptatibus soluta esse consequatur. Aut et eum distinctio iste aut.', '1982-01-28 12:07:13', 12, 12);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (13, 'Aut a soluta magnam omnis corporis amet voluptates. Sed non sunt quia amet esse dignissimos tempore dolorem. A et non reprehenderit aut. Impedit dolor omnis nemo saepe incidunt facere sint.', '1987-07-28 13:34:53', 13, 13);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (14, 'Ea fugit velit veniam deserunt omnis. Ipsum veniam eveniet eos enim. Ratione fugiat et culpa quis consequatur maxime fugit.', '2011-08-19 00:31:53', 14, 14);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (15, 'Saepe et repellendus error odio quis. Aut rerum error aut asperiores itaque quia impedit impedit. Et recusandae odio vel itaque cumque reprehenderit magnam. Non excepturi explicabo laborum est esse quae.', '2015-02-26 16:56:25', 15, 15);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (16, 'Quas autem numquam placeat corrupti officia repellendus. Nostrum earum sunt ut voluptatem beatae. Consequuntur et vel aperiam maiores doloribus aliquam maxime. Perferendis nisi et vitae.', '1986-10-22 11:01:32', 1, 16);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (17, 'Quo sed non veritatis iure sapiente dolorem. Aut perspiciatis rerum voluptatibus id quia earum enim. At omnis asperiores et aut nesciunt.', '2005-08-01 06:20:33', 2, 17);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (18, 'Omnis tenetur est ratione. Enim doloremque provident dolor aut nesciunt voluptas. Commodi odit minus beatae.', '2014-01-04 01:13:27', 3, 18);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (19, 'Possimus id repellendus necessitatibus repellendus. Veritatis vero excepturi et ut quia.', '1987-09-21 05:34:46', 4, 19);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (20, 'Repellat aliquid inventore tempore fugit. Doloremque culpa cumque harum nobis quae. Tempora repellat quae velit voluptates non. Ut soluta autem eius consequuntur.', '1973-09-24 11:07:21', 5, 20);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (21, 'Sed alias sapiente dolore architecto odio. Molestiae voluptatum et et consequuntur rerum.', '1977-06-14 12:05:22', 6, 1);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (22, 'Et deleniti esse velit facilis. Beatae quis dicta reiciendis doloribus ipsum quia. Magni ullam ea nihil et fugit reiciendis.', '1976-03-13 21:10:14', 7, 2);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (23, 'Sit ratione aperiam omnis quia esse error. Doloribus alias suscipit optio dolor et sed perspiciatis accusantium. Nostrum laborum veniam aut rem est.', '1971-10-05 09:15:01', 8, 3);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (24, 'Sed consequatur facere est magnam. Placeat eum dicta consectetur impedit veniam a harum. Magnam necessitatibus quis nihil cum. Praesentium vitae fuga consequatur in.', '2015-12-17 03:06:37', 9, 4);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (25, 'Perspiciatis quisquam nulla quo assumenda magni est. Fugiat quo eos quia. Vel non omnis nemo vel. Voluptate voluptatem placeat cumque quia qui quis.', '1982-02-02 04:22:24', 10, 5);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (26, 'Praesentium odio libero cum soluta. Molestias est aliquid inventore ipsa nemo vel iusto. Consequatur aut voluptas sit inventore accusamus et ab veniam.', '2000-11-22 06:45:57', 11, 6);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (27, 'Illo culpa ut et voluptatibus inventore adipisci optio. Quidem et aliquid esse dignissimos temporibus necessitatibus voluptatem. Veniam ut asperiores omnis eum rem. Fugit blanditiis qui ut.', '2018-10-05 20:23:59', 12, 7);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (28, 'Error optio at maiores et omnis consequatur. Et quia cumque explicabo nihil. Ut aliquam rerum beatae veritatis dolore laboriosam.', '1980-02-04 23:57:07', 13, 8);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (29, 'Dicta dolore quia nostrum incidunt. Recusandae enim cupiditate quas. Mollitia error optio voluptas unde animi unde sit. Ex animi illo fugit quia.', '2009-01-06 14:32:34', 14, 9);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (30, 'Nobis et eligendi illum cumque modi et. Cum magni fuga quis magni voluptatem. Architecto quis tenetur quod adipisci ipsam facere voluptatem.', '1979-09-19 23:07:43', 15, 10);


#
# TABLE STRUCTURE FOR: email
#

DROP TABLE IF EXISTS `email`;

CREATE TABLE `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (1, 'lubowitz.gregorio@yahoo.com', 0, 1);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (2, 'trycia32@yahoo.com', 0, 2);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (3, 'kiera03@gmail.com', 0, 3);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (4, 'darryl70@gmail.com', 0, 4);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (5, 'ola.kirlin@gmail.com', 0, 5);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (6, 'wmarvin@framisauer.com', 0, 6);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (7, 'wisozk.ezequiel@treutel.com', 0, 7);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (8, 'dorn@shields.com', 0, 8);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (9, 'cheyenne95@hotmail.com', 0, 9);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (10, 'adriana.bartoletti@ullrichhahn.com', 0, 10);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (11, 'seth13@mertzschiller.com', 0, 11);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (12, 'fmosciski@gorczany.com', 0, 12);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (13, 'lbruen@yahoo.com', 0, 13);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (14, 'xstoltenberg@heathcote.info', 0, 14);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (15, 'ludie.satterfield@gmail.com', 0, 15);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (16, 'al14@langosh.com', 0, 1);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (17, 'coy.mills@nolan.com', 0, 2);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (18, 'novella68@dibbertromaguera.com', 0, 3);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (19, 'annalise.reynolds@gmail.com', 0, 4);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (20, 'enrico57@rath.com', 0, 5);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (21, 'brandyn.rogahn@hotmail.com', 0, 6);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (22, 'homenick.brisa@boehmlueilwitz.com', 0, 7);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (23, 'zoie93@yahoo.com', 0, 8);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (24, 'thelma.treutel@hotmail.com', 0, 9);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (25, 'melyssa.haag@gmail.com', 0, 10);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (26, 'alexane96@emard.com', 0, 11);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (27, 'zo\'connell@gmail.com', 0, 12);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (28, 'bjohnson@kovaceklemke.com', 0, 13);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (29, 'dorris42@yahoo.com', 0, 14);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (30, 'aliya.tillman@pfeffer.info', 0, 15);


#
# TABLE STRUCTURE FOR: product
#

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `product` (`id`, `name`, `url`) VALUES (1, 'Autem est magnam nobis deserunt.', 'http://lesch.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (2, 'Aut ut dolor blanditiis.', 'http://www.hicklefranecki.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (3, 'Aut est quas eveniet enim tenetur et amet ut.', 'http://raynor.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (4, 'Eius molestias perspiciatis non.', 'http://beer.info/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (5, 'Rerum aut omnis cum.', 'http://schimmel.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (6, 'Sit culpa magnam aut quas.', 'http://zieme.net/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (7, 'Aperiam nam quo explicabo ut.', 'http://williamson.biz/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (8, 'Et enim nostrum repellat totam.', 'http://brownkohler.info/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (9, 'Voluptatum aliquam neque dolore.', 'http://www.dare.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (10, 'Tenetur commodi alias officiis incidunt.', 'http://www.denesik.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (11, 'Quisquam debitis repellendus corporis sunt.', 'http://www.schadenhoeger.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (12, 'Rerum nam temporibus unde quis sit cum.', 'http://gerhold.biz/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (13, 'Tenetur quia officia amet velit adipisci nam.', 'http://www.smithamrunolfsson.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (14, 'Voluptatem harum omnis velit blanditiis.', 'http://pfeffercarter.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (15, 'Qui non minus qui voluptatem soluta qui.', 'http://ortiz.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (16, 'Non enim sed tenetur maiores error voluptatem molestias.', 'http://gutkowski.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (17, 'Vel perspiciatis ut mollitia debitis.', 'http://www.mante.biz/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (18, 'Et perspiciatis quisquam tenetur magnam.', 'http://feestgerhold.net/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (19, 'Dolorem non consequatur quas ut.', 'http://shieldssatterfield.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (20, 'Pariatur sit quibusdam ut doloribus.', 'http://muellerroob.com/');


#
# TABLE STRUCTURE FOR: product_sold_by_retailer
#

DROP TABLE IF EXISTS `product_sold_by_retailer`;

CREATE TABLE `product_sold_by_retailer` (
  `product_id` int(11) NOT NULL,
  `retailer_id` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`product_id`,`retailer_id`),
  KEY `retailer_id` (`retailer_id`),
  CONSTRAINT `product_sold_by_retailer_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_sold_by_retailer_ibfk_2` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (1, 1, '0.7902');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (2, 2, '20.0081');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (3, 3, '399150000');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (4, 4, '0');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (5, 5, '7099980');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (6, 6, '107.937');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (7, 7, '1240.37');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (8, 8, '8.01');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (9, 9, '0.422753');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (10, 10, '0');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (11, 11, '541915000');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (12, 12, '667.289');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (13, 13, '1.78');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (14, 14, '37150.9');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (15, 15, '51.2668');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (16, 16, '0');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (17, 17, '135091000');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (18, 18, '82661.6');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (19, 19, '2.19741');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (20, 20, '0');


#
# TABLE STRUCTURE FOR: product_tracked_by_user
#

DROP TABLE IF EXISTS `product_tracked_by_user`;

CREATE TABLE `product_tracked_by_user` (
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `desired_price` float NOT NULL,
  PRIMARY KEY (`product_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `product_tracked_by_user_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_tracked_by_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (1, 1, '6606.03');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (2, 2, '185638000');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (3, 3, '42711.7');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (4, 4, '434186');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (5, 5, '45');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (6, 6, '977.527');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (7, 7, '1023.51');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (8, 8, '4768.03');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (9, 9, '7165230');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (10, 10, '51.1099');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (11, 11, '0');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (12, 12, '2083.85');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (13, 13, '516.222');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (14, 14, '0');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (15, 15, '58803.2');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (16, 1, '7274.32');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (17, 2, '4602.38');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (18, 3, '1589.7');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (19, 4, '148748000');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (20, 5, '0');


#
# TABLE STRUCTURE FOR: retailer
#

DROP TABLE IF EXISTS `retailer`;

CREATE TABLE `retailer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `retailer` (`id`, `name`) VALUES (1, 'exercitationem');
INSERT INTO `retailer` (`id`, `name`) VALUES (2, 'non');
INSERT INTO `retailer` (`id`, `name`) VALUES (3, 'quia');
INSERT INTO `retailer` (`id`, `name`) VALUES (4, 'nam');
INSERT INTO `retailer` (`id`, `name`) VALUES (5, 'fugiat');
INSERT INTO `retailer` (`id`, `name`) VALUES (6, 'facere');
INSERT INTO `retailer` (`id`, `name`) VALUES (7, 'in');
INSERT INTO `retailer` (`id`, `name`) VALUES (8, 'ducimus');
INSERT INTO `retailer` (`id`, `name`) VALUES (9, 'aspernatur');
INSERT INTO `retailer` (`id`, `name`) VALUES (10, 'unde');
INSERT INTO `retailer` (`id`, `name`) VALUES (11, 'quisquam');
INSERT INTO `retailer` (`id`, `name`) VALUES (12, 'cupiditate');
INSERT INTO `retailer` (`id`, `name`) VALUES (13, 'omnis');
INSERT INTO `retailer` (`id`, `name`) VALUES (14, 'quae');
INSERT INTO `retailer` (`id`, `name`) VALUES (15, 'explicabo');
INSERT INTO `retailer` (`id`, `name`) VALUES (16, 'dicta');
INSERT INTO `retailer` (`id`, `name`) VALUES (17, 'amet');
INSERT INTO `retailer` (`id`, `name`) VALUES (18, 'vitae');
INSERT INTO `retailer` (`id`, `name`) VALUES (19, 'vel');
INSERT INTO `retailer` (`id`, `name`) VALUES (20, 'voluptas');


#
# TABLE STRUCTURE FOR: token_blacklist
#

DROP TABLE IF EXISTS `token_blacklist`;

CREATE TABLE `token_blacklist` (
  `jti` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `token_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`jti`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `token_blacklist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('080d9cbc-1bcf-3aa4-b2f9-8edcc26598fc', 'explicabo', '1996-08-15 01:00:52', 13);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('1d6d106b-7ef9-32fa-9aee-64dc44f0b126', 'atque', '1992-12-13 22:27:10', 2);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('1ee3f48f-e856-36d2-befe-835e145dc9bc', 'non', '1988-04-19 11:16:49', 13);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('1f62f640-8dfd-393e-b352-41bea6d4edb2', 'sed', '2018-09-19 03:51:21', 4);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('2025646e-9d26-3b6a-977f-909ee1b1de79', 'nemo', '1999-07-26 01:14:17', 7);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('2a1b3ad9-7186-31bc-9d3a-56522bb3fe4f', 'labore', '1995-03-04 03:59:31', 6);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('32317672-0061-3bee-954a-3e1c5c73724f', 'est', '1994-08-21 06:43:27', 9);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('4b881976-34ea-3953-aaa4-1373625f0015', 'accusamus', '1970-04-02 11:21:33', 14);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('50d7882d-db1d-32a3-9850-43d361ec8745', 'iure', '1983-07-05 20:36:10', 12);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('50f07b3d-a9ff-3194-ad10-c12e54739e51', 'eos', '2018-12-09 02:53:19', 2);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('53118b2f-fcec-3bc5-9154-28913a4542d8', 'voluptate', '1997-02-04 16:37:23', 5);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('5a636758-11ee-3740-ae7b-a2e6938deff7', 'veritatis', '2004-11-22 00:17:25', 3);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('5dd39cbe-899c-3f6a-aae2-11f33ad59483', 'voluptas', '2008-05-28 00:10:02', 15);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('5fc3ffb4-90a5-396f-bc3f-fedd62e521c2', 'voluptates', '1981-11-13 14:02:11', 8);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('606ae92c-ffa4-33e2-9380-245f1c34bf58', 'repellat', '1999-02-23 15:40:27', 14);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('613b5583-9724-37c3-b68f-7f86ebe0ee6e', 'facilis', '1986-11-13 11:17:00', 7);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('741169d3-96bc-389b-9087-9c2ddfcb2ef7', 'et', '1994-07-23 20:33:03', 1);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('77fc3731-45ab-3ff2-9973-72841892a0cd', 'est', '2014-04-06 04:58:36', 1);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('8438f4c3-82c3-325b-92c8-3140a8780eb7', 'quis', '1995-01-17 22:32:17', 10);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('860e815b-791a-3aa1-b6fb-69455c48f15b', 'consequunt', '2010-08-25 15:03:36', 8);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('c0de4a69-3b65-31f1-a929-75c267dc9f22', 'fuga', '1971-06-29 21:20:11', 11);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('c40c978a-3574-3d6e-a9a9-dcaee4a05256', 'porro', '1994-07-11 04:44:14', 12);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('c6b07bd8-c47c-3cb8-9405-a8246a49f262', 'quaerat', '2000-12-07 00:26:23', 11);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('e250e897-3913-3784-a6c8-091bc396163b', 'velit', '1986-07-02 11:04:56', 4);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('e797cd66-06de-3702-965e-9acc1d999bc2', 'quidem', '1999-08-01 07:05:33', 5);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('e888c26d-5b47-376d-a2e7-e9ecf0e6ec2d', 'quisquam', '2017-05-19 21:18:58', 9);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('eb37ddae-68e0-3a07-83c9-bb810b3a9fe7', 'hic', '2019-07-16 08:10:24', 6);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('ee6c9e45-9e77-300c-9faa-cdbebbe61132', 'porro', '2011-01-13 23:12:07', 10);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('ef765b25-5a57-3816-b04b-6f73e8c603c4', 'eius', '1999-09-26 02:32:17', 15);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('ffeb0bd3-2c67-3d1e-87b2-d8cc78b25c8a', 'deleniti', '1982-12-02 15:40:51', 3);


#
# TABLE STRUCTURE FOR: user
#

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` tinyblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`id`, `username`, `password`) VALUES (1, 'ihermiston', 'ea9d13a3c62fb6aa03560069219dc7255b28f24d');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (2, 'uharvey', '53d9abfb219df507121254132add67964c1e8895');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (3, 'xmraz', '61bbaddc8ae37da70ebb22b85f04438947ef7f43');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (4, 'dweber', '73db6775133584ae82b4cb3c080f217835442679');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (5, 'kane69', 'd0f7180894a0633de0b99dacbf53c9439c0bdc6f');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (6, 'francesca09', '20b9530155b13d8eb1da22100b208edfee7c5607');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (7, 'evert.wintheiser', '1d2c03bd151683e513e03f1f7503676c8071d9d5');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (8, 'jacobi.mariane', '14c54a10bf14b8e0f20b857b404dfe4afb406292');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (9, 'amurazik', '53037c0134c805024dfb34ef287ad326ef59df9b');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (10, 'morar.robb', 'ec2ee824c1d1ed2dad4407b8a1195ba472b90bf9');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (11, 'tia.jacobi', '7c039f57310006f4e817e67fc0381a33c7f8f1cb');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (12, 'ari10', 'eaea0f8fb4440787decc2dd93c2fa1318baba223');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (13, 'isadore05', '0e86438bc00bd36f94203e758e8126999807acb7');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (14, 'kali68', '6aae17fdb6a9eb97ce9f3e50977b232e81ee698c');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (15, 'xhand', '6b52727ade768286167e2058322de439320fcf41');


#
# TABLE STRUCTURE FOR: user_primary_email
#

DROP TABLE IF EXISTS `user_primary_email`;

CREATE TABLE `user_primary_email` (
  `user_id` int(11) NOT NULL,
  `email_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`email_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email_id` (`email_id`),
  CONSTRAINT `user_primary_email_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_primary_email_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `email` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (1, 1);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (2, 2);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (3, 3);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (4, 4);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (5, 5);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (6, 6);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (7, 7);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (8, 8);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (9, 9);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (10, 10);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (11, 11);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (12, 12);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (13, 13);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (14, 14);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (15, 15);

set foreign_key_checks=1;
