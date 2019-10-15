#
# TABLE STRUCTURE FOR: admin
#
SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_login` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` tinyblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_login` (`admin_login`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (1, 'david33', '1c9ba3f300b1e51c50520b13c9bf0be2bf48bed1');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (2, 'mckayla65', 'ec927d6c82d09a4b145ba0c839e03234a98dc245');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (3, 'carter.chasity', '5bb53f6e339f70e59411443acc26a41230ae46ff');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (4, 'lebsack.greg', '26e8efad39468afd38763d28b7ce611aeb4d848a');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (5, 'lupe.kuhlman', '070fbf68f638be3fab05472d4b6cb52f42555045');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (6, 'freddy.shields', '2452b90309976be4d9f6a6c3e20d416932599cde');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (7, 'camryn75', 'c00da3d65e77c68fc70a1c34002e838778e89481');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (8, 'huel.obie', 'f2d599a8f7487b2fc3bbba3370648770ec093ecc');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (9, 'jimmy.flatley', 'c9200cac82397660d39e59f4411852ffd863c58d');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (10, 'mtillman', 'afd3b4cf0b0fdec34312cd6a77095361d0ba0c16');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (11, 'dulce.powlowski', 'edce264311403b9605191e0ed0d7c1b7d035e806');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (12, 'gerardo96', '1230619f584f636a1b88c5d62d5a5df639d3b1b3');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (13, 'idaniel', '3b0cdce063b0c21daa8efd815202ee31bce78894');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (14, 'mia.becker', 'c364011bc839708096522aefdfd747e51ab74b93');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (15, 'olubowitz', '3860c56e12182af55e534c4947c10eaf440c3503');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (16, 'dusty26', '36a925cfdf3ace1fc3cae77d6f97678a4ebd1095');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (17, 'althea.lueilwitz', 'a6bc5b4dfac901a32a33777d2dafbefa1499445c');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (18, 'nkutch', 'b6d20a27c9efd64b5a3d0a65de644e957776ea2e');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (19, 'melisa.predovic', '4aee0743065c0322be40e03945dd3d1e907f8501');
INSERT INTO `admin` (`id`, `admin_login`, `password`) VALUES (20, 'jheaney', 'c135a4b1f235103ed5ab9d7c398f13ac65f73d65');


#
# TABLE STRUCTURE FOR: announcement
#

DROP TABLE IF EXISTS `announcement`;

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `title` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (1, '2015-03-06 08:21:21', 'Earum quis odio minima.', 'Minus iusto ducimus nobis aut reiciendis praesentium placeat quo. Facere rerum facere quam aperiam esse non est. Unde dolores placeat atque eos delectus cum soluta. Id alias et adipisci.', 1);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (2, '1992-04-13 23:57:55', 'Esse eum id odio voluptatum.', 'Amet est sunt autem consectetur aut sunt fugiat. Earum labore eius repellat consequatur. Commodi debitis error minus et voluptatibus.', 2);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (3, '1975-01-17 00:09:00', 'Consequatur laboriosam minima voluptatum harum.', 'Rerum corrupti repellat debitis. Facere nemo libero aperiam ducimus voluptatibus. Repudiandae tempore ipsum vel sed perferendis eligendi voluptatibus.', 3);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (4, '1981-10-05 21:24:32', 'Qui id ipsam omnis officia.', 'Ratione et aliquid delectus eum. Dolore qui optio debitis nihil commodi dolores. Vero sint voluptatem aut rerum dicta vel voluptatum. Minima mollitia similique nihil odio voluptates et. Occaecati commodi et animi magni.', 4);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (5, '1973-08-08 15:21:06', 'Quo labore vero modi et.', 'Consequatur possimus omnis neque debitis. Iure quia facere et maiores distinctio. Quae harum corrupti quo dolorem. Quisquam necessitatibus quod ipsa harum.', 5);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (6, '2001-01-29 22:24:10', 'Voluptatum numquam velit aut sed et nisi rerum.', 'Voluptatem tenetur sit vel ea qui in qui. Suscipit quas quia dignissimos consequatur. Veritatis perspiciatis tempore aut asperiores dolor.', 6);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (7, '1987-11-24 13:24:16', 'Similique repellat vero eum odio voluptates qui provident.', 'Molestiae aut accusamus ipsum at omnis. Ipsa iusto corporis cum. Non voluptatem tenetur qui vitae sunt. Dolore et aspernatur non sed dolor quas est.', 7);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (8, '1986-03-08 08:27:44', 'Placeat autem occaecati minus modi nesciunt rerum necessitatibus at.', 'Maxime deleniti necessitatibus magnam voluptatem. Enim ut maxime fugit sequi. Quo soluta quia vel odit aut sit deleniti. Voluptatem adipisci et magni.', 8);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (9, '2013-10-24 12:31:12', 'Ut laborum quae iusto harum nobis officia.', 'Inventore incidunt sapiente qui at explicabo. Voluptate maiores pariatur dignissimos eveniet.', 9);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (10, '2012-05-05 16:27:40', 'Iste laudantium odit odio tempore quo necessitatibus voluptatibus.', 'Autem saepe et possimus. Autem itaque est illo dolorem. Rem qui quos illum fugit rerum quas quia. Nihil incidunt culpa omnis et consequatur.', 10);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (11, '1971-11-07 17:12:12', 'Voluptas officiis facere sequi distinctio.', 'Error omnis officia quis ab. Voluptas qui perspiciatis omnis quo. Autem magnam nemo voluptatem minima voluptas. Voluptas minima tempore sit rerum quo aliquid et.', 11);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (12, '1970-01-29 12:30:57', 'Numquam quo aliquam officia perferendis labore provident maiores.', 'Quam eaque et et molestiae voluptate. Nostrum doloremque quis enim dicta. Ad tempora praesentium voluptatem voluptas rerum qui. Sed quia ut sint odio corrupti.', 12);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (13, '1991-08-16 18:01:16', 'Officia autem fugiat ea quia aliquid quis illo.', 'Magni placeat ut minus ad est. Sint numquam natus qui quo est. Modi et voluptas earum fuga explicabo dolor. Commodi saepe et deserunt voluptas atque.', 13);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (14, '1979-07-12 09:07:05', 'Dolores natus incidunt laborum.', 'In autem soluta officiis aut iste odio eos. Accusantium id est at qui fuga qui. Consequatur sit corrupti rem aliquam quia. Consequatur alias sed est dignissimos dolorem omnis laborum.', 14);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (15, '1981-04-01 13:37:41', 'Distinctio temporibus fuga corrupti fugiat pariatur amet.', 'Placeat dolorum ipsa sit voluptatem et architecto quam eos. Modi ut similique corporis. Modi qui sit perspiciatis ut deleniti ut. Veniam vitae id officia ea officiis voluptates libero.', 15);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (16, '1987-01-23 17:47:01', 'Expedita optio laudantium tenetur odit.', 'Quis fugiat incidunt dolores adipisci eaque dolore cum. Nostrum quas non repellendus repudiandae et. Natus et et consequuntur sed cum consequuntur. Veritatis eos molestiae consequatur sed dolore nisi occaecati.', 16);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (17, '1974-10-23 23:50:16', 'Rerum vero debitis quis esse et nihil et.', 'Quod impedit voluptatem sunt natus doloremque magnam. Alias ducimus debitis error rem fugit eum exercitationem. Consequuntur earum quia qui accusamus quaerat. Asperiores atque illum omnis voluptatem et eius.', 17);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (18, '2015-10-15 03:45:06', 'Itaque quasi id est maiores.', 'Ea fugiat facere dolores et adipisci at et. Eaque voluptas et voluptas quae blanditiis enim. Recusandae dolores ab dolor iure eligendi tempore ipsum. Similique eos blanditiis sunt consectetur.', 18);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (19, '2008-09-24 02:53:27', 'Nesciunt animi nemo itaque et.', 'Nihil at culpa ut culpa dolor. Aspernatur et est est quis quis labore. Odit minus dolor illo laborum quibusdam quibusdam qui. Voluptatem quaerat accusamus dolor voluptatum.', 19);
INSERT INTO `announcement` (`id`, `time`, `title`, `body`, `admin_id`) VALUES (20, '1990-02-10 07:42:09', 'Dolor repellat et eum voluptatem dolores maiores ipsam.', 'Et repudiandae nihil in porro iure sed. Natus qui omnis maiores debitis consequatur dicta deserunt sapiente. Dolorem iste soluta nobis hic fugit aliquam et pariatur. Est enim voluptatem exercitationem voluptate molestiae in nostrum voluptatem. Repudiandae harum qui temporibus natus.', 20);


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

INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (1, 'Temporibus vitae autem consectetur nesciunt. Error quae dolor dicta. Rerum iste architecto voluptatem labore tempora expedita eos. Id est id provident eum ratione aut tempora dolor.', '1971-05-23 20:16:12', 1, 1);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (2, 'Non doloribus fuga consequatur nisi rem aspernatur quis. Odio iure exercitationem suscipit sapiente ipsa. Et ut et corporis voluptatem eum maiores.', '1997-07-06 18:10:54', 2, 2);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (3, 'Sit non delectus consectetur pariatur et illo atque aut. Quis minima et velit dolorem. Sunt aut ut dolores aspernatur natus. Eius est rerum ad. Tenetur facere est consequuntur quos.', '2009-02-27 03:36:51', 3, 3);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (4, 'Et et dolorum et delectus velit accusamus fuga. Eligendi sunt reprehenderit consectetur nobis quae. Nostrum distinctio ex dolores et animi sed nulla. Voluptates numquam autem odio non sed accusantium nam laborum.', '2001-01-09 10:37:26', 4, 4);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (5, 'Recusandae animi aspernatur magnam architecto omnis. Impedit ab rerum officiis. Ea consequatur sint exercitationem iusto. Minus et voluptate modi labore distinctio ut.', '1998-06-28 17:20:36', 5, 5);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (6, 'Sed aut consequatur repellat fugit tempora sint. Aut architecto sunt commodi explicabo hic sed. Et optio doloribus eligendi magni.', '2002-04-19 12:00:12', 6, 6);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (7, 'Dolorem hic fugiat amet repudiandae consequuntur et officiis. Quia quia distinctio aut occaecati praesentium sint. Quasi fugiat est quo inventore quibusdam quo impedit.', '1996-04-03 13:43:47', 7, 7);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (8, 'Dolor rerum aut et aliquid officiis quaerat. Laboriosam sunt molestiae illum eligendi tempore. Magni commodi id laborum inventore consequatur ipsam. Et sint praesentium minus iusto architecto ullam.', '1998-02-21 18:48:21', 8, 8);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (9, 'Ut corporis itaque voluptas eum. Dolores facilis repellat accusantium eum est cupiditate mollitia aspernatur. Rem ducimus totam totam qui eligendi blanditiis.', '2019-04-14 15:02:44', 9, 9);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (10, 'Id consectetur occaecati fugiat animi incidunt debitis. Illum nihil beatae dignissimos eum excepturi quasi sit. Incidunt autem molestiae ex dolores sit reiciendis reiciendis. Fugit ullam omnis maxime enim animi ullam.', '2001-06-13 10:34:25', 10, 10);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (11, 'Maxime et est a est explicabo doloribus. Inventore asperiores ullam sed placeat hic minima. Quo quis maiores voluptatibus. Ex maxime alias quo est aut ea in. Eius neque quos ut quod labore omnis rerum.', '2002-04-12 08:33:41', 11, 11);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (12, 'Adipisci qui itaque non totam velit. Nesciunt odio sit provident. Qui aliquam aspernatur sapiente voluptatem minima numquam. Vitae quasi omnis et pariatur nulla autem laudantium.', '1986-03-04 03:41:18', 12, 12);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (13, 'Deserunt libero illo omnis. Labore distinctio vel reprehenderit praesentium. Quia repellendus laborum ad unde molestiae aut. Est iusto numquam consequuntur.', '1989-07-14 11:41:33', 13, 13);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (14, 'Dolorem incidunt atque reprehenderit fuga ratione. Eum corrupti veritatis magni magni aliquid debitis. Consequatur vero quasi qui assumenda.', '1995-01-28 19:50:18', 14, 14);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (15, 'Exercitationem magni hic repudiandae itaque labore vel. Dolor accusantium ea excepturi voluptas deserunt. Quod dolorum error id et. Id iure rerum tempore qui soluta corrupti. Exercitationem ut ut quia praesentium id.', '1984-01-17 21:50:13', 15, 15);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (16, 'Et nesciunt cupiditate error omnis sunt. Pariatur id quia laudantium harum. Dolore autem ut quam praesentium accusantium optio.', '1978-09-21 04:40:27', 16, 16);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (17, 'Voluptatem nesciunt culpa ut aut sunt. Tempora velit quisquam magni nobis quia rem eaque voluptatum. Debitis quia cum qui exercitationem error nisi. Dolor eaque reprehenderit dolor aut magnam harum. Voluptates consequatur non magnam delectus culpa nostrum.', '1995-08-05 23:42:23', 17, 17);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (18, 'Ex occaecati facere porro. Rerum similique impedit praesentium commodi tenetur quibusdam unde.', '2003-04-05 22:50:23', 18, 18);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (19, 'Tenetur vel corrupti omnis libero non minus. Et officia dignissimos tenetur delectus natus. Optio explicabo possimus aperiam ea occaecati.', '1981-05-05 22:46:47', 19, 19);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (20, 'Quisquam et amet rerum consequatur quia. Voluptas laboriosam sed ea. Reprehenderit sequi sint qui aperiam. Corporis et saepe quo eos. Veniam non cupiditate et velit ut consequatur aut.', '1980-08-13 14:13:43', 20, 20);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (21, 'Sapiente quam nesciunt libero assumenda vel. Sint quis ratione ut maxime. Quam enim odio doloremque dicta. Id id nostrum voluptatem sint aliquam.', '1990-03-11 05:46:21', 1, 1);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (22, 'Amet quia corporis excepturi aut esse vel. Occaecati autem repellendus dolore dolores autem. Earum corporis fugiat quo labore repellendus.', '2013-01-06 07:17:01', 2, 2);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (23, 'Est cumque voluptas quae dolores delectus in deserunt. Enim quibusdam ea voluptates possimus asperiores et. Eum cumque distinctio voluptatem et qui beatae. Repellendus est quidem eos ab.', '1984-03-31 22:02:05', 3, 3);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (24, 'Repudiandae est reiciendis assumenda enim corporis enim tempora. Maiores ipsa temporibus nulla dolor. Reprehenderit voluptas aspernatur quaerat incidunt impedit beatae dolor. Aspernatur adipisci et officia quia qui voluptatem veritatis.', '1976-08-21 05:32:07', 4, 4);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (25, 'Vel vel explicabo recusandae aut est. Et hic nemo sit cum. Eligendi sed nisi consequatur consectetur deserunt consequatur. Corporis dolores aperiam quae quia.', '1986-01-25 04:07:52', 5, 5);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (26, 'Et deserunt aut incidunt. Corporis nobis praesentium nihil voluptatem assumenda ipsa ullam. Et ex nihil natus.', '1992-04-27 22:54:33', 6, 6);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (27, 'Provident dolores quam officiis inventore quidem. Laborum id vitae facere. Laborum sint et nesciunt enim. Suscipit et cum accusamus sunt exercitationem placeat assumenda quod.', '2012-09-26 08:01:13', 7, 7);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (28, 'Magnam ducimus est explicabo natus. Quia est non perspiciatis saepe maiores ex. Quisquam et nesciunt tempore optio.', '1983-04-13 08:13:03', 8, 8);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (29, 'Facere ipsum et molestiae aut animi. Qui sunt quaerat voluptatibus qui.', '2000-03-14 20:37:56', 9, 9);
INSERT INTO `comment` (`id`, `body`, `date`, `user_id`, `product_id`) VALUES (30, 'Libero nostrum delectus quisquam sunt debitis. Quisquam nihil at quisquam rem non nulla velit.', '1990-11-30 06:30:41', 10, 10);


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

INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (1, 'tremblay.solon@rempel.com', 0, 1);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (2, 'herman.hauck@starkmayer.com', 0, 2);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (3, 'bailee76@schowalter.com', 0, 3);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (4, 'kuvalis.kiara@schadenkuvalis.com', 1, 4);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (5, 'ondricka.daphnee@nienow.com', 1, 5);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (6, 'jaskolski.giovanna@fadel.com', 1, 6);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (7, 'zita09@gmail.com', 0, 7);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (8, 'rosenbaum.britney@gmail.com', 0, 8);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (9, 'luigi25@bartoletti.info', 0, 9);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (10, 'xcummings@gmail.com', 0, 10);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (11, 'schoen.brenden@yahoo.com', 0, 11);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (12, 'qbernier@sanfordpouros.com', 1, 12);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (13, 'brenda90@bosco.com', 0, 13);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (14, 'heidenreich.jamaal@hauckratke.com', 1, 14);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (15, 'leuschke.mazie@hotmail.com', 1, 15);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (16, 'dana41@kassulkedamore.biz', 0, 16);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (17, 'geovanny72@conroy.info', 0, 17);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (18, 'kerluke.sonny@yahoo.com', 0, 18);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (19, 'hessel.angel@gmail.com', 1, 19);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (20, 'walsh.manuela@gislason.com', 1, 20);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (21, 'stark.kyler@gmail.com', 1, 1);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (22, 'cecile.terry@yahoo.com', 1, 2);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (23, 'arnoldo01@yahoo.com', 1, 3);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (24, 'harris.alice@hotmail.com', 0, 4);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (25, 'selmer26@hotmail.com', 1, 5);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (26, 'skihn@hotmail.com', 1, 6);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (27, 'lafayette81@thompson.net', 0, 7);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (28, 'electa.runolfsdottir@gmail.com', 0, 8);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (29, 'rae36@hotmail.com', 1, 9);
INSERT INTO `email` (`id`, `address`, `confirmed`, `user_id`) VALUES (30, 'kellen00@larkin.com', 0, 10);


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

INSERT INTO `product` (`id`, `name`, `url`) VALUES (1, 'Aspernatur enim voluptas blanditiis laboriosam repellat commodi eveniet sed.', 'http://www.hansen.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (2, 'Aliquid qui provident debitis deserunt vero dolore quas.', 'http://www.little.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (3, 'Nemo tempore quis rerum dolores.', 'http://graham.org/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (4, 'Minima rerum odit ut similique consectetur aliquid.', 'http://www.langworth.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (5, 'Veniam minus rerum soluta totam molestiae quia.', 'http://www.wilkinsonrunolfsdottir.info/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (6, 'Perferendis neque nam harum amet ut sed assumenda.', 'http://friesengerlach.biz/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (7, 'Consequatur aut excepturi perferendis qui.', 'http://www.wilkinsoncasper.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (8, 'Expedita qui quam velit.', 'http://www.bode.org/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (9, 'Eos debitis consequatur sed quam est perferendis non.', 'http://fisher.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (10, 'Dolores omnis nulla et cum nulla.', 'http://www.dickinson.net/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (11, 'Consectetur dolor qui quia numquam voluptate.', 'http://www.zboncak.info/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (12, 'Sed aliquid et facere odit aliquam.', 'http://aufderharromaguera.org/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (13, 'Molestiae saepe facilis nulla et.', 'http://gottlieb.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (14, 'Perspiciatis minus velit tempore libero cumque perspiciatis.', 'http://spencer.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (15, 'Deserunt voluptatem pariatur quaerat voluptatum aperiam est.', 'http://maggiodickens.biz/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (16, 'Itaque et quia ratione eaque assumenda.', 'http://kessler.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (17, 'Cupiditate aut fugiat cumque.', 'http://www.nolanschuster.com/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (18, 'Mollitia exercitationem libero in minus.', 'http://www.leschroob.org/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (19, 'Et magnam quis quod odio et deleniti.', 'http://www.sawaynwolff.info/');
INSERT INTO `product` (`id`, `name`, `url`) VALUES (20, 'Temporibus ea et inventore ex.', 'http://herman.com/');


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

INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (1, 1, '65.6');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (2, 2, '567.218');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (3, 3, '11.467');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (4, 4, '18913.6');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (5, 5, '5.13326');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (6, 6, '0.6613');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (7, 7, '710917');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (8, 8, '322.009');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (9, 9, '0');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (10, 10, '0');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (11, 11, '13.3');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (12, 12, '1344.82');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (13, 13, '357.156');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (14, 14, '3.2');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (15, 15, '9780460');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (16, 16, '362687');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (17, 17, '0');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (18, 18, '11407400');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (19, 19, '428.703');
INSERT INTO `product_sold_by_retailer` (`product_id`, `retailer_id`, `price`) VALUES (20, 20, '67948100');


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

INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (1, 1, '0');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (2, 2, '4.49669');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (3, 3, '807.401');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (4, 4, '25547600');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (5, 5, '488729');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (6, 6, '0');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (7, 7, '457.68');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (8, 8, '4399740');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (9, 9, '52614.5');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (10, 10, '19284.5');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (11, 11, '32.3629');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (12, 12, '44');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (13, 13, '0.6');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (14, 14, '216.848');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (15, 15, '17416.6');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (16, 16, '2660.65');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (17, 17, '13964.7');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (18, 18, '3');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (19, 19, '749427');
INSERT INTO `product_tracked_by_user` (`product_id`, `user_id`, `desired_price`) VALUES (20, 20, '1462.18');


#
# TABLE STRUCTURE FOR: retailer
#

DROP TABLE IF EXISTS `retailer`;

CREATE TABLE `retailer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `retailer` (`id`, `name`) VALUES (1, 'molestias');
INSERT INTO `retailer` (`id`, `name`) VALUES (2, 'autem');
INSERT INTO `retailer` (`id`, `name`) VALUES (3, 'ut');
INSERT INTO `retailer` (`id`, `name`) VALUES (4, 'delectus');
INSERT INTO `retailer` (`id`, `name`) VALUES (5, 'cupiditate');
INSERT INTO `retailer` (`id`, `name`) VALUES (6, 'nemo');
INSERT INTO `retailer` (`id`, `name`) VALUES (7, 'qui');
INSERT INTO `retailer` (`id`, `name`) VALUES (8, 'similique');
INSERT INTO `retailer` (`id`, `name`) VALUES (9, 'ipsa');
INSERT INTO `retailer` (`id`, `name`) VALUES (10, 'corrupti');
INSERT INTO `retailer` (`id`, `name`) VALUES (11, 'non');
INSERT INTO `retailer` (`id`, `name`) VALUES (12, 'aut');
INSERT INTO `retailer` (`id`, `name`) VALUES (13, 'nostrum');
INSERT INTO `retailer` (`id`, `name`) VALUES (14, 'velit');
INSERT INTO `retailer` (`id`, `name`) VALUES (15, 'nam');
INSERT INTO `retailer` (`id`, `name`) VALUES (16, 'odit');
INSERT INTO `retailer` (`id`, `name`) VALUES (17, 'aut');
INSERT INTO `retailer` (`id`, `name`) VALUES (18, 'et');
INSERT INTO `retailer` (`id`, `name`) VALUES (19, 'aspernatur');
INSERT INTO `retailer` (`id`, `name`) VALUES (20, 'architecto');


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

INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('23c6bed5-32a4-3b16-9d88-cdf2cf9a09ab', 'impedit', '1970-01-14 19:04:24', 20);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('26256de1-6ea4-3a7d-97e5-a46d89158429', 'ex', '1985-09-12 07:27:04', 14);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('27169427-7ea1-3eb1-8bb2-93ebbbfccffd', 'occaecati', '2017-05-24 21:55:52', 2);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('2fb34fae-2aad-39b5-b866-6f73d14f2761', 'corporis', '2009-12-17 07:22:30', 8);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('44aec57a-3845-3eb7-b1f2-3cc220ba697b', 'adipisci', '1984-09-20 13:35:20', 6);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('4cc660d7-7ef7-3a1e-a32e-f2579432faa1', 'eum', '2007-03-20 20:40:43', 15);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('4d3e458b-0294-340a-97bb-f1a33f9b7fbc', 'voluptate', '2015-03-30 20:25:53', 19);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('6002667b-a8f7-3199-8c36-1f7dc8b94401', 'distinctio', '2011-10-09 15:59:01', 4);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('75553e61-1e11-33f5-ba60-7d21b9be476c', 'commodi', '1997-10-16 03:18:52', 10);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('7ca4711e-4250-3111-9fdf-e675eaf64dcc', 'nisi', '2012-08-18 08:05:46', 2);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('7f3ad6f8-53f4-31bf-b91e-76a43c693866', 'modi', '1970-10-09 18:59:18', 9);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('7fae25c3-9dd2-3870-90dd-f13f787ecdbd', 'voluptatem', '2016-06-07 13:40:45', 8);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('858a33da-e4b2-3c39-977f-8bc64a1adbe0', 'cumque', '1987-12-11 12:54:21', 10);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('88193c38-f5eb-3c79-bda8-55ebc2690540', 'quis', '2015-05-14 16:03:36', 18);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('93713e1b-12d5-3b22-a7da-e05980684d03', 'et', '1982-04-21 20:47:25', 9);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('a23e39cb-7dd7-3764-a802-65778cbb98ca', 'est', '2009-06-24 13:45:40', 7);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('a291adcf-c1f8-3066-bade-712f52da8106', 'quod', '2013-02-12 22:40:27', 1);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('a3642a5d-65be-369f-8b5f-cdc708398515', 'dicta', '1985-09-10 09:34:54', 3);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('a7e214f2-922d-3c9b-bcca-1a9288a895ed', 'et', '1986-04-17 15:00:43', 6);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('b8d0ce17-ab0e-3e9b-853c-062c02ddc04f', 'nulla', '2017-01-29 05:54:50', 13);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('b94ab3b3-311b-3a21-96ce-90e172fa21fc', 'eius', '2015-05-13 21:46:56', 7);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('d0338469-3b0a-358b-aa89-ee7d5a9d18dd', 'veritatis', '1985-03-16 15:23:54', 1);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('dd3c6365-a503-3281-be04-528d2dff9366', 'deleniti', '2000-05-05 22:10:47', 11);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('deecc955-6d68-330f-9be5-b47bf7224c59', 'impedit', '2016-06-29 02:44:07', 5);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('e138f57e-6690-36bb-867b-0bf5682766ca', 'et', '1980-03-26 23:55:48', 4);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('e403cf35-484f-35d2-8cd4-74248265b953', 'et', '1990-11-30 01:14:36', 16);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('e9ae7986-0d92-3904-bfe6-77e42168d6d6', 'aut', '1997-07-03 04:54:03', 3);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('e9c5073d-9d96-37fe-ab11-3b054356f809', 'voluptate', '2012-05-31 05:58:50', 5);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('eb20a44e-d3d6-3c10-bc6e-d465c4106dee', 'voluptatem', '1983-05-26 11:02:10', 12);
INSERT INTO `token_blacklist` (`jti`, `token_type`, `expires`, `user_id`) VALUES ('fc649a09-2b72-3cb9-9b21-b0be40dc0d2e', 'nulla', '2019-01-12 19:59:17', 17);


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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`id`, `username`, `password`) VALUES (1, 'vlind', '942139898d76f527fb5e533139ebe176da3c20c3');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (2, 'milo.conroy', '0a82b487818b430c6e4a193209e8f9443c97576f');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (3, 'gerson33', 'e9714f6fc159f65a7d5ab0d8bee389b0d747b68b');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (4, 'eladio09', '24769d95b983be9802a7c4d49676f5492847956c');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (5, 'goodwin.lacy', 'f51d481692f00d782a2015a96d922e4f5d96e91a');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (6, 'bradtke.trystan', '7f7923f1d79392f8a66310dd46566698aec88cd0');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (7, 'wrowe', '5ee4a176abd9ee25fc0f415401f200ee1ec48dca');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (8, 'mwolff', '66733efe7f5df1b69898a30f898e771c8889065e');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (9, 'qkoch', '2fabaa5ec54e81a95bf0c41da1ae74baee21341e');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (10, 'norval07', '952ba421862013e22264cfd847cf4a2fe58eb7d5');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (11, 'estanton', '3933c3da5af2ff4f0b303ad0e6cd9f661f1b61f3');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (12, 'jade.bruen', '73cbdc009f3385ae59cc72488546b4d3d9096d4e');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (13, 'ines.skiles', '8a00bd514bf1830118e5e6d551c293692d1f52dc');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (14, 'wbailey', '09e30ed7af78a5c4bc0c876289b4e5334139ac4a');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (15, 'xstrosin', 'a9e6dfba977ac6cf0feb1a01257fa1d82ab226f9');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (16, 'chelsea72', 'd5bf5c0020808eea7fd8c2040c86ef44cb385dfb');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (17, 'thurman79', 'd18c4c332e8265195aa7f81ea966a55e55325e96');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (18, 'proberts', 'cbbf4678b6484c07a88fa4722d2eb4be29093ad2');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (19, 'cassin.hosea', '0e08f3a4313efac3a2af61ccf907a972b953e004');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (20, 'kariane.vandervort', '98f7d921a528258a2a275392cd6fcbe2e0d086fd');


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
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (16, 16);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (17, 17);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (18, 18);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (19, 19);
INSERT INTO `user_primary_email` (`user_id`, `email_id`) VALUES (20, 20);

SET foreign_key_checks = 1;
