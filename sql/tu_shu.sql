/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : tu_shu

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 22/12/2021 09:02:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '1', 'admin');
INSERT INTO `admin` VALUES (3, '121', '12');

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info`  (
  `book_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ISBN` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `language` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `pub_date` date NOT NULL,
  `class_id` int(0) NULL DEFAULT NULL,
  `number` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `book_info` VALUES (5, 'Java程序设计 第2版第二版 ', '张三 ', '清华出版社', '9787508647357', '《北京大学信息技术系列教材：Java程序设计（第2版）》详细介绍了Java程序设计的基本环境、概念、方法和应用。', '英文', 68.00, '2021-04-13', 11, 2);
INSERT INTO `book_info` VALUES (7, 'Java程序设计 第4版第4版 ', '唐大仕', '机械工业出版社', '9787111126768', '第三部分是Java的应用，包括工具类与算法、线程、文件、AWT及Swing图形用户界面，以及Java在网络、多媒体、数据库等方面的应用。', '英文', 88.00, '2021-04-14', 6, 2);
INSERT INTO `book_info` VALUES (8, 'Java程序设计 第5版第5版 ', '唐大仕', '清华出版社', '9787020125265', '对JDK7及JDK8中的新内容也进行了介绍。', '中文', 99.80, '2021-04-14', 9, 5);
INSERT INTO `book_info` VALUES (9, 'Java程序设计 第6版第6版 ', '唐大仕', '清华出版社公司', '9787550265608', '内容详尽，循序渐进，在介绍编程技术的同时，还着重讲解了有关面向对象程序设计的基本概念和方法。书中提供了丰富的典型实例，具有可操作性，便于读者的学习与推广应用。各章附有习题，便于读者思考和复习。', '中文', 60.00, '2021-04-14', 9, 1);
INSERT INTO `book_info` VALUES (10, 'Java程序设计 第7版第7版 ', '唐大仕', '清华出版社', '9787530216859', '内容和组织方式立足于高校教学教材的要求，同时可作为计算机技术的培训教材', '中文', 39.50, '2021-04-14', 9, 5);
INSERT INTO `book_info` VALUES (11, 'Java程序设计 第8版第8版 ', '唐大仕', '中国人民出版社', '9787513325745', '也适用于作者在coursera上开设的慕课（MOOC）“Java程序设计”。', '中文', 35.00, '2020-05-01', 9, 6);
INSERT INTO `book_info` VALUES (13, 'Java程序设计 第10版第10版 ', '李四', '中国人民出版社', '9787501162734', 'Head First 编程之旅:Python语言描述 埃里克·弗里曼 Python编程语言教程书籍 python核心编程 计算机科学 数据结构 存储抽象递归', '中文', 12.00, '2021-04-07', 9, 6);
INSERT INTO `book_info` VALUES (14, 'Java程序设计 第11版第11版 ', '李四', '中国人民出版社', '9787550252585', '欢迎来到秘密花园！ 在这个笔墨编织出的美丽世界中漫步吧 涂上你喜爱的颜色，为花园带来生机和活力 发现隐藏其中的各类小生物，与它们共舞 激活创造力，描绘那些未完成的仙踪秘境 各个年龄段的艺术家和“园丁”都可以来尝试喔！', '中文', 42.00, '2021-04-07', 9, 9);
INSERT INTO `book_info` VALUES (15, 'Java程序设计 第11版第11版 ', '李四', '中国人民出版社', '9787550252585', '欢迎来到秘密花园！ 在这个笔墨编织出的美丽世界中漫步吧 涂上你喜爱的颜色，为花园带来生机和活力 发现隐藏其中的各类小生物，与它们共舞 激活创造力，描绘那些未完成的仙踪秘境 各个年龄段的艺术家和“园丁”都可以来尝试喔！', '中文', 42.00, '2021-04-07', 9, 8);
INSERT INTO `book_info` VALUES (16, 'Java程序设计 第11版第11版 ', '李四', '中国人民出版社', '9787550252585', '欢迎来到秘密花园！ 在这个笔墨编织出的美丽世界中漫步吧 涂上你喜爱的颜色，为花园带来生机和活力 发现隐藏其中的各类小生物，与它们共舞 激活创造力，描绘那些未完成的仙踪秘境 各个年龄段的艺术家和“园丁”都可以来尝试喔！', '中文', 42.00, '2021-04-07', 9, 9);
INSERT INTO `book_info` VALUES (17, 'Java程序设计 第11版第11版 ', '李四', '中国人民出版社', '9787550252585', '欢迎来到秘密花园！ 在这个笔墨编织出的美丽世界中漫步吧 涂上你喜爱的颜色，为花园带来生机和活力 发现隐藏其中的各类小生物，与它们共舞 激活创造力，描绘那些未完成的仙踪秘境 各个年龄段的艺术家和“园丁”都可以来尝试喔！', '中文', 42.00, '2021-04-07', 9, 9);
INSERT INTO `book_info` VALUES (18, 'Java程序设计 第11版第11版 ', '李四', '中国人民出版社', '9787550252585', '欢迎来到秘密花园！ 在这个笔墨编织出的美丽世界中漫步吧 涂上你喜爱的颜色，为花园带来生机和活力 发现隐藏其中的各类小生物，与它们共舞 激活创造力，描绘那些未完成的仙踪秘境 各个年龄段的艺术家和“园丁”都可以来尝试喔！', '中文', 42.00, '2021-04-07', 9, 9);
INSERT INTO `book_info` VALUES (19, 'Java程序设计 第11版第11版 ', '李四', '中国人民出版社', '9787550252585', '欢迎来到秘密花园！ 在这个笔墨编织出的美丽世界中漫步吧 涂上你喜爱的颜色，为花园带来生机和活力 发现隐藏其中的各类小生物，与它们共舞 激活创造力，描绘那些未完成的仙踪秘境 各个年龄段的艺术家和“园丁”都可以来尝试喔！', '中文', 42.00, '2021-04-07', 9, 8);

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info`  (
  `class_id` int(0) NOT NULL,
  `class_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES (1, '马克思主义');
INSERT INTO `class_info` VALUES (2, '哲学');
INSERT INTO `class_info` VALUES (3, '社会科学总论');
INSERT INTO `class_info` VALUES (4, '政治法律');
INSERT INTO `class_info` VALUES (5, '军事');
INSERT INTO `class_info` VALUES (6, '经济');
INSERT INTO `class_info` VALUES (7, '文化');
INSERT INTO `class_info` VALUES (8, '语言');
INSERT INTO `class_info` VALUES (9, '文学');
INSERT INTO `class_info` VALUES (10, '艺术');
INSERT INTO `class_info` VALUES (11, '历史地理');
INSERT INTO `class_info` VALUES (12, '自然科学总论');
INSERT INTO `class_info` VALUES (13, ' 数理科学和化学');
INSERT INTO `class_info` VALUES (14, '天文学、地球科学');
INSERT INTO `class_info` VALUES (15, '生物科学');
INSERT INTO `class_info` VALUES (16, '医药、卫生');
INSERT INTO `class_info` VALUES (17, '农业科学');
INSERT INTO `class_info` VALUES (18, '工业技术');
INSERT INTO `class_info` VALUES (19, '交通运输');
INSERT INTO `class_info` VALUES (20, '航空、航天');
INSERT INTO `class_info` VALUES (21, '环境科学');
INSERT INTO `class_info` VALUES (22, '综合');

-- ----------------------------
-- Table structure for lend_list
-- ----------------------------
DROP TABLE IF EXISTS `lend_list`;
CREATE TABLE `lend_list`  (
  `ser_num` bigint(0) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(0) NOT NULL,
  `reader_id` bigint(0) NOT NULL,
  `lend_date` date NULL DEFAULT NULL,
  `back_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`ser_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lend_list
-- ----------------------------
INSERT INTO `lend_list` VALUES (1, 1, 10000, '2020-03-03', '2021-04-05');
INSERT INTO `lend_list` VALUES (2, 2, 10001, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (3, 3, 10003, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (4, 4, 10000, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (6, 6, 10000, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (7, 1, 10001, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (8, 3, 10000, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (9, 6, 10000, '2020-03-17', '2020-05-14');
INSERT INTO `lend_list` VALUES (10, 5, 10001, '2020-05-03', '2020-05-03');
INSERT INTO `lend_list` VALUES (11, 18, 10001, '2020-05-03', '2020-05-03');
INSERT INTO `lend_list` VALUES (12, 10, 10000, '2020-05-14', '2020-05-03');
INSERT INTO `lend_list` VALUES (13, 7, 10000, '2020-05-14', '2020-05-03');
INSERT INTO `lend_list` VALUES (14, 3, 10000, '2021-01-21', '2021-01-21');
INSERT INTO `lend_list` VALUES (15, 3, 10000, '2021-04-07', '2021-04-07');
INSERT INTO `lend_list` VALUES (16, 3, 10000, '2021-12-21', '2021-12-21');
INSERT INTO `lend_list` VALUES (17, 3, 10000, '2021-12-21', NULL);
INSERT INTO `lend_list` VALUES (18, 5, 10000, '2021-12-21', NULL);
INSERT INTO `lend_list` VALUES (19, 19, 10005, '2021-12-21', '2021-12-21');
INSERT INTO `lend_list` VALUES (30, 5, 10005, '2021-12-21', '2021-12-21');
INSERT INTO `lend_list` VALUES (31, 12, 10005, '2021-12-03', '2021-12-21');
INSERT INTO `lend_list` VALUES (32, 11, 10005, '2021-12-03', '2021-12-21');
INSERT INTO `lend_list` VALUES (33, 10, 10005, '2021-12-03', '2021-12-21');
INSERT INTO `lend_list` VALUES (34, 8, 10005, '2021-12-21', NULL);
INSERT INTO `lend_list` VALUES (35, 13, 10005, '2021-12-10', '2021-12-21');
INSERT INTO `lend_list` VALUES (36, 11, 10005, '2021-12-21', NULL);
INSERT INTO `lend_list` VALUES (37, 19, 10005, '2021-12-21', NULL);
INSERT INTO `lend_list` VALUES (38, 5, 10005, '2021-12-21', NULL);
INSERT INTO `lend_list` VALUES (39, 7, 10005, '2021-12-21', NULL);
INSERT INTO `lend_list` VALUES (40, 9, 10005, '2021-12-21', NULL);
INSERT INTO `lend_list` VALUES (41, 10, 10005, '2021-12-21', NULL);
INSERT INTO `lend_list` VALUES (42, 14, 10005, '2021-12-12', '2021-12-21');
INSERT INTO `lend_list` VALUES (43, 15, 10005, '2021-12-21', NULL);
INSERT INTO `lend_list` VALUES (44, 13, 10005, '2021-12-21', NULL);

-- ----------------------------
-- Table structure for reader_card
-- ----------------------------
DROP TABLE IF EXISTS `reader_card`;
CREATE TABLE `reader_card`  (
  `reader_id` bigint(0) NOT NULL,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`reader_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reader_card
-- ----------------------------
INSERT INTO `reader_card` VALUES (10000, '张三', '123456');
INSERT INTO `reader_card` VALUES (10001, '李四', '123456');
INSERT INTO `reader_card` VALUES (10002, '王五', '123456');
INSERT INTO `reader_card` VALUES (10005, '呵呵', '123456');
INSERT INTO `reader_card` VALUES (10007, 'test11111', '1234567');
INSERT INTO `reader_card` VALUES (10008, 'aaabbb', '123456789');

-- ----------------------------
-- Table structure for reader_info
-- ----------------------------
DROP TABLE IF EXISTS `reader_info`;
CREATE TABLE `reader_info`  (
  `reader_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birth` date NOT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`reader_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10007 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reader_info
-- ----------------------------
INSERT INTO `reader_info` VALUES (10000, '张三', '女', '1999-09-09', '北京', '12345678900');
INSERT INTO `reader_info` VALUES (10001, '李四', '男', '1996-02-01', '北京市', '12345678909');
INSERT INTO `reader_info` VALUES (10002, '王五', '女', '1995-04-15', '浙江省杭州市', '12345678908');
INSERT INTO `reader_info` VALUES (10005, '呵呵', '男', '2021-12-21', '北京', '1234567');
INSERT INTO `reader_info` VALUES (10007, 'test11111', '男', '2021-12-21', '121212', '12134567321');
INSERT INTO `reader_info` VALUES (10008, 'aaabbb', '男', '2021-12-14', '2345678', '12345678998');
INSERT INTO `reader_info` VALUES (10009, 'qwert', '男', '2021-12-07', '121212', '12345678998');
INSERT INTO `reader_info` VALUES (10010, 'qwert', '男', '2021-12-21', '121212', '12345678998');

SET FOREIGN_KEY_CHECKS = 1;
