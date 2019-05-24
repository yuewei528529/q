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

 Date: 24/05/2019 20:59:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for zijin1
-- ----------------------------
DROP TABLE IF EXISTS `zijin1`;
CREATE TABLE `zijin1`  (
  `xmmc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `skdw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `yt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `htje` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `yif` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `yifbl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `yus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `jjqk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id` int(11) NOT NULL DEFAULT 0,
  `bz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zftj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zzxqsy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sqrq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zijin1
-- ----------------------------
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '平煤神马建工集团有限公司', '施工', '704.5038', '104.500000 ', '95.00%', '44', '70% 剩余货款', '紧急', 1, NULL, '1', NULL, NULL, NULL);
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '平煤神马建工集团有限公司', '施工', '704.5038', '104.500000 ', '95.00%', '3', '部分投运款', '紧急', 2, NULL, '1', NULL, NULL, NULL);
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '平煤神马建工集团有限公司', '施工', '704.5038', '104.500000 ', '95.00%', '1', '', '紧急', 10, NULL, '1', NULL, NULL, NULL);
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '平煤神马建工集团有限公司', '施工', '︽', '16.647698 ', '95.00%', '12', '5%质保金', '一般', 9, NULL, '2', NULL, NULL, NULL);
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '平煤神马建工集团有限公司', '施工', '︽', '16.647698 ', '95.00%', '2', '15%投运款', '紧急', 8, NULL, '2', NULL, NULL, NULL);
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '浙江共顺电气有限公司', 'GCS', '︽', '︽', '100.00%', '1', '50.00%', '紧急', 7, NULL, '5', NULL, NULL, NULL);
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '浙江共顺电气有限公司', 'GGD', '︽', '︽', '100.00%', '2', '剩余尾款', '紧急', 6, '厂家提出诉讼，为和解撤诉创造条件', '6', NULL, NULL, NULL);
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '华为技术有限公司', '并网逆变器', '︽', ' 49.290000 ', '100.00%', '42', '50%法律服务费', '紧急', 5, '平顶山易成新材料买卖合同纠纷仲裁反请求案件', '7', NULL, NULL, NULL);
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '核工业第五研究设计院', '设计', '︽', '13.800000 ', '100.00%', '2', '70%加工款', '紧急', 4, NULL, '8', NULL, NULL, NULL);
INSERT INTO `zijin1` VALUES ('大唐青灰岭', '河南平高电气股份有限公司 ', '专用工器具和仪器仪表', '︽', '︽', '︽', NULL, NULL, NULL, 91, NULL, '23', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '浙江共顺电气有限公司', '汇流箱', '︽', '20.685000 ', '100.00%', NULL, NULL, NULL, 89, NULL, '4', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '核工业第五研究设计院', '设计', '︽', '13.800000 ', '100.00%', NULL, NULL, NULL, 88, NULL, '8', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '浙江共顺电气有限公司', 'GCS', '︽', '︽', '100.00%', NULL, NULL, NULL, 87, NULL, '5', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '平煤神马建工集团有限公司', '施工', '704.5038', '104.500000 ', '95.00%', NULL, NULL, NULL, 86, NULL, '1', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin1` VALUES ('马鞍山万兆', '平煤神马建工集团有限公司', '施工', '︽', '16.647698 ', '95.00%', NULL, NULL, NULL, 85, NULL, '2', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin1` VALUES ('大唐青灰岭', '河南平高电气股份有限公司 ', '通讯设备', '︽', '︽', '︽', NULL, NULL, NULL, 84, NULL, '22', '22', '22', '22');
INSERT INTO `zijin1` VALUES ('大唐青灰岭', '河南平高电气股份有限公司 ', '通讯设备', '︽', '︽', '︽', NULL, NULL, NULL, 83, NULL, '22', '22', '22', '22');

SET FOREIGN_KEY_CHECKS = 1;
