/*
 Navicat Premium Data Transfer

 Source Server         : 111
 Source Server Type    : MySQL
 Source Server Version : 50146
 Source Host           : localhost:3309
 Source Schema         : redmoonoa

 Target Server Type    : MySQL
 Target Server Version : 50146
 File Encoding         : 65001

 Date: 24/05/2019 20:58:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for kemu1
-- ----------------------------
DROP TABLE IF EXISTS `kemu1`;
CREATE TABLE `kemu1`  (
  `hetongh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `leibie` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `xmjc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `xmjl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `htje` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hkbl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gys` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hwmc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `danw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shul` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `danj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `htze` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kprq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kpje` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `jhq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `jhqk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `htzt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fkfs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id` int(255) NOT NULL DEFAULT 0,
  `zk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `yif` double DEFAULT NULL,
  `yue` double DEFAULT NULL,
  `id1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fkbl` double DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kemu1
-- ----------------------------
INSERT INTO `kemu1` VALUES ('2015DLE006', 'EPC', '马鞍山万兆', '项目小组', '704.5038', '65.65%', '平煤神马建工集团有限公司', '施工', '项', '1', '110.000000 ', '110.000000 ', '', '110.000000 ', '', '', '', '', '', 1, '', 48, 62, '1', 0.436363636363636);
INSERT INTO `kemu1` VALUES ('2015DLE006', 'EPC', '马鞍山万兆', '项目小组', '︽', '︽', '平煤神马建工集团有限公司', '施工', '项', '1', '17.523893 ', '17.523893 ', '', '17.523893 ', '', '', '', '', '', 2, '', 14, 3.523893, '2', 0.798909237804636);
INSERT INTO `kemu1` VALUES ('2015DLE006', 'EPC', '马鞍山万兆', '项目小组', '︽', '︽', '浙江共顺电气有限公司', 'GCS', '面', '3', '3.786', '︽', '', '︽', '', '', '', '', '', 5, '', 1, -1, '5', NULL);
INSERT INTO `kemu1` VALUES ('2015DLE006', 'EPC', '马鞍山万兆', '项目小组', '︽', '︽', '浙江共顺电气有限公司', 'GGD', '面', '1', '5.502', '︽', '', '︽', '', '', '', '', '', 6, '', 2, -2, '6', NULL);
INSERT INTO `kemu1` VALUES ('2015DLE006', 'EPC', '马鞍山万兆', '项目小组', '︽', '︽', '华为技术有限公司', '并网逆变器', '台', '31', '1.59', '49.290000 ', '', '49.290000', '', '', '', '', '', 7, '', 42, 7.29, '7', 0.852099817407182);
INSERT INTO `kemu1` VALUES ('2015DLE006', 'EPC', '马鞍山万兆', '项目小组', '︽', '︽', '核工业第五研究设计院', '设计', '项', '1', '13.800000 ', '13.800000 ', '', '13.800000 ', '', '已发货', '', '', '', 8, '', 2, 11.8, '8', 0.144927536231884);

SET FOREIGN_KEY_CHECKS = 1;
