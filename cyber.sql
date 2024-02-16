/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.5.20-log : Database - cyberbullying
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cyberbullying` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cyberbullying`;

/*Table structure for table `bullying` */

DROP TABLE IF EXISTS `bullying`;

CREATE TABLE `bullying` (
  `l_id` int(11) DEFAULT NULL COMMENT 'contains the login id',
  `bull_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'contains the bullying id',
  `bull_word` varchar(100) DEFAULT NULL COMMENT 'contains the bullying word',
  `date` date DEFAULT NULL COMMENT 'contains the date',
  PRIMARY KEY (`bull_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `bullying` */

insert  into `bullying`(`l_id`,`bull_id`,`bull_word`,`date`) values 
(1,1,'shame','2021-05-18'),
(1,3,'toxic','2021-05-28'),
(1,4,'ugly','2021-05-28'),
(1,5,'gross','2021-05-28'),
(5,6,'bad','2021-05-28');

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'contains  chat id',
  `f_id` int(11) DEFAULT NULL COMMENT 'contains from id',
  `t_id` int(11) DEFAULT NULL COMMENT 'contains the to id',
  `msg` text COMMENT 'contains the message',
  `date` date DEFAULT NULL COMMENT 'contains the date',
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

insert  into `chat`(`chat_id`,`f_id`,`t_id`,`msg`,`date`) values 
(1,5,4,'hi','2021-05-27'),
(2,5,4,'how are you?','2021-05-27'),
(3,5,4,'need help?','2021-05-27'),
(4,4,5,'i am  good\r\n','2021-05-27'),
(5,4,5,'thanks for asking','2021-05-27');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'contains the comment id',
  `post_id` int(11) DEFAULT NULL COMMENT 'contains the post id',
  `user_id` int(11) DEFAULT NULL COMMENT 'contains the user id',
  `comment` varchar(100) DEFAULT NULL COMMENT 'contains the comment',
  `date` date DEFAULT NULL COMMENT 'contains the date',
  `status` varchar(100) DEFAULT NULL COMMENT 'contains the status',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `comment` */

insert  into `comment`(`c_id`,`post_id`,`user_id`,`comment`,`date`,`status`) values 
(1,3,4,'woww','2021-05-20','pending'),
(2,3,4,'nice','2021-05-24','pending'),
(3,2,5,'great','2021-05-24','pending'),
(4,3,4,'hi','2021-05-24','pending'),
(5,3,4,'shamus','2021-05-24','pending'),
(6,3,4,'shamely','2021-05-24','pending'),
(7,3,4,'sweet','2021-05-28','pending'),
(8,3,4,'beautiful pic','2021-05-28','pending'),
(9,3,4,'beautiful pic.you are great','2021-05-28','pending');

/*Table structure for table `good` */

DROP TABLE IF EXISTS `good`;

CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) NOT NULL,
  `word` varchar(500) NOT NULL,
  `date` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `good` */

insert  into `good`(`id`,`lid`,`word`,`date`) values 
(2,1,'great','2021-05-28'),
(3,1,'beautiful','2021-05-28'),
(4,1,'love','2021-05-28'),
(5,1,'best','2021-05-28'),
(6,1,'sweet','2021-05-28'),
(7,1,'romantic','2021-05-28'),
(8,1,'lovely','2021-05-28'),
(9,1,'brave','2021-05-28'),
(10,1,'congrats','2021-05-28'),
(11,1,'splendid','2021-05-28');

/*Table structure for table `likke` */

DROP TABLE IF EXISTS `likke`;

CREATE TABLE `likke` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) DEFAULT NULL,
  `like` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `likke` */

insert  into `likke`(`lid`,`postid`,`like`,`date`,`from_id`) values 
(3,3,1,'2021-05-24',4),
(4,2,1,'2021-05-24',5),
(5,0,NULL,NULL,NULL);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'contains the login id',
  `user_name` varchar(100) DEFAULT NULL COMMENT 'contains the name of users',
  `password` varchar(50) DEFAULT NULL COMMENT 'contains the password',
  `usertype` varchar(50) NOT NULL COMMENT 'contains the usertype',
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`l_id`,`user_name`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(4,'haritha','haritha','user'),
(5,'amrutha','amrutha','user'),
(6,'ysh','ysh','user');

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'contains post id',
  `l_id` int(11) DEFAULT NULL COMMENT 'contains login id',
  `post` varchar(100) DEFAULT NULL COMMENT 'contains post',
  `caption` varchar(100) DEFAULT NULL COMMENT 'contains caption',
  `date` date DEFAULT NULL COMMENT 'contains',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `post` */

insert  into `post`(`post_id`,`l_id`,`post`,`caption`,`date`) values 
(2,4,'b5b533179374f3f2f592c862dfdc895569c5edc1.jpeg','woow','2021-05-19'),
(3,5,'stock-photo-medical-technology-concept-remote-medicine-electronic-medical-record-1530386483.jpg','super','2021-05-20'),
(4,4,'oVxIy3.jpg','Helen keller','2021-05-24');

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_id` int(11) DEFAULT NULL,
  `post_id` varchar(11) DEFAULT NULL,
  `comment` text,
  `date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `report` */

insert  into `report`(`report_id`,`l_id`,`post_id`,`comment`,`date`,`status`) values 
(1,5,'4','shame','2021-05-24','Comment'),
(2,4,'3','gross picture','2021-05-28','Comment'),
(3,4,'3','ugly gross toxic shame','2021-05-28','Comment'),
(4,4,'3','ugly gross toxic shame','2021-05-28','Comment'),
(5,4,'3','toxic','2021-05-28','Comment'),
(6,4,'3','shame on you','2021-05-28','Comment'),
(7,4,'3','ugly picture. shame on you.','2021-05-28','Comment'),
(8,4,'3','bad post.ugly and shame','2021-05-28','Comment'),
(9,4,'3','bad post.ugly and shame','2021-05-28','Comment'),
(10,4,'post','gross picture','2021-05-28','Post'),
(11,5,'4','bad post.ugly pic','2021-05-28','Comment');

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert  into `request`(`request_id`,`from_id`,`to_id`,`date`,`status`) values 
(1,4,5,'2021-05-20','Accepted'),
(2,6,4,'2021-05-19','Accepted');

/*Table structure for table `share` */

DROP TABLE IF EXISTS `share`;

CREATE TABLE `share` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `fromid` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `share` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `l_id` int(11) DEFAULT NULL COMMENT 'contains the id of login',
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'contains the id of user',
  `f_name` varchar(100) DEFAULT NULL COMMENT 'contains the first name',
  `l_name` varchar(100) DEFAULT NULL COMMENT 'contains the last name',
  `gender` varchar(100) DEFAULT NULL COMMENT 'contains the gender',
  `d_o_b` varchar(100) DEFAULT NULL COMMENT 'contains the date of birth',
  `phone_number` bigint(100) DEFAULT NULL COMMENT 'contains the phone number',
  `photo` varchar(100) DEFAULT NULL COMMENT 'contains photo',
  `bio` varchar(100) DEFAULT NULL COMMENT 'contains the bio',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`l_id`,`user_id`,`f_name`,`l_name`,`gender`,`d_o_b`,`phone_number`,`photo`,`bio`) values 
(4,1,'Haritha','Rajan','Female','1996-01-21',9547483828,'dreamstime_s_94227818.jpg','qwerty'),
(5,2,'Amrutha','Hareesh','Female','1995-04-23',9447386473,'b5b533179374f3f2f592c862dfdc895569c5edc1.jpeg','dreamy girl'),
(6,3,'ysh','yshj','Male','2021-05-19',9847586969,'4VUI8y.jpg','lkjlkh');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
