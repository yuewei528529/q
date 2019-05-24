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

 Date: 24/05/2019 20:58:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for zijin
-- ----------------------------
DROP TABLE IF EXISTS `zijin`;
CREATE TABLE `zijin`  (
  `xmmc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `skdw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `yt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `htje` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `yif` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `yifbl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `yus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `jjqk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zftj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zzxqsy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sqrq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zijin
-- ----------------------------
INSERT INTO `zijin` VALUES ('平煤光伏', '天津正鑫瑞商贸有限公司', '转接件', '27,520.00 ', '8,256.00 ', '30%', '44', '70% 剩余货款', '紧急', 1, NULL, '1', NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('平煤光伏', '许继电气股份有限公司', '智能汇流箱', '3,399,000.00 ', '1,891,700.00 ', '56%', '3', '部分投运款', '紧急', 2, NULL, '1', NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('察右前旗风电', '许继电气股份有限公司', '25套塔筒', '271,130,000.00 ', '168,014,000.00 ', '62%', '1', '', '紧急', 10, NULL, '1', NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('汝州扶贫', '天津恒兴太阳能科技有限公司', '质保金', '4,420,000.00 ', '4,199,000.00 ', '95%', '12', '5%质保金', '一般', 9, NULL, '2', NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('汝州扶贫', '保定天威集团特变电气有限公司', '投运款', '2,350,000.00 ', '1,175,000.00 ', '50%', '2', '15%投运款', '紧急', 8, NULL, '2', NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('汝州扶贫', '阳光电源股份有限公司', '投运款', '3,243,600.00 ', '1,621,800.00 ', '50%', '1', '50.00%', '紧急', 7, NULL, '5', NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('平煤光伏', '河南天丰钢结构', NULL, '23,000,000.00 ', '20,050,000.00 ', '87%', '2', '剩余尾款', '紧急', 6, '厂家提出诉讼，为和解撤诉创造条件', '6', NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('平煤光伏', '湖北金卫律师事务所', '法律服务费', '85,000.00 ', '0.00 ', '0%', '42', '50%法律服务费', '紧急', 5, '平顶山易成新材料买卖合同纠纷仲裁反请求案件', '7', NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('平煤光伏', '平顶山常欣高压开关有限公司', '材料加工款', '81,588.00 ', '0.00 ', '0%', '2', '70%加工款', '紧急', 4, NULL, '8', NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('平煤光伏', '兰州众邦电线电缆集团有限公司', '材料采购款', '94,575,595.00 ', '85,118,036.00 ', '90%', '94', '10% 质保金', '一般', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('察右前旗风电', '呼和浩特市君畅汽车租赁有限责任公司', '车辆租赁', '42,000.00 ', '-   ', '0%', '21', '50.00%', '紧急', 11, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('察右前旗风电', '许继电气股份有限公司', '塔筒验收款', '271,130,000.00 ', '185,734,000.00 ', '69%', '2', '1.05%', '紧急', 12, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('察右前旗风电', '山东省隆晟风力发电有限公司', '', '1,078,000.00 ', '', '', '1', '', '紧急', 13, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('察右前旗风电', '中国能源建设集团西北电力建设甘肃工程有限公司', '施工签 证', '17,500,000.00 ', '768,000.00 ', '', '10', '', '一般', 14, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('察右前旗风电', '许继电气股份有限公司', '安装验收款', '271,130,000.00 ', '-   ', '0%', '219', '', '紧急', 15, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('察右前旗风电', '鄂尔多斯市金泰生路桥有限责任公司（原北京航天恒达新能源发展有限公司）', '补充协议', '9,476,000.00 ', '5,000,000.00 ', '53%', '4', '47.00%', '一般', 16, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('察右前旗风电', '中国富康国际租赁股份有限公司', '融资顾问费', '', '', '', '0', '', '', 17, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zijin` VALUES ('444444', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, '1', '支付条件', '资金需求事由', '2019/5/7');
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, '56', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, '23', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, '4', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, '8', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, '5', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, '1', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, '2', '支付条件', '资金需求事由', '2019/5/6');
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, '22', '22', '22', '22');
INSERT INTO `zijin` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, '22', '22', '22', '22');

SET FOREIGN_KEY_CHECKS = 1;
