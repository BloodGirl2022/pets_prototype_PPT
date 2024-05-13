/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : pet_home

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 02/05/2024 20:58:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `account_number` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` INT NULL DEFAULT NULL,
  `telephone` VARCHAR(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`, `account_number`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for baike
-- ----------------------------
DROP TABLE IF EXISTS `baike`;
CREATE TABLE `baike`  (
  `baike_id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `classification` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`baike_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of baike
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `reply_id` INT NULL DEFAULT NULL COMMENT '本评论是对reply_id这个评论的回复',
  `release_time` DATETIME NOT NULL,
  `like_number` INT NOT NULL,
  `content` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_again` INT NOT NULL DEFAULT 0 COMMENT '该评论是否有回复，0表示没有，1表示有',
  `level` INT NOT NULL COMMENT '评论等级，1表示对帖子的评论，2表示对评论的评论',
  PRIMARY KEY (`comment_id`, `post_id`, `user_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `title` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作者',
  `content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `classification` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_time` DATETIME NOT NULL,
  `update_time` DATETIME NOT NULL,
  `view_number` INT NOT NULL DEFAULT 0,
  `like_number` INT NOT NULL DEFAULT 0,
  `collection_number` INT NOT NULL DEFAULT 0,
  `comment_number` INT NOT NULL DEFAULT 0,
  `status` INT NOT NULL COMMENT '-1：审核未通过，0：审核中，1：审核通过，2：草稿',
  PRIMARY KEY (`post_id`, `user_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for postcol
-- ----------------------------
DROP TABLE IF EXISTS `postcol`;
CREATE TABLE `postcol`  (
  `postcol_id` INT NOT NULL AUTO_INCREMENT COMMENT '帖子收藏表',
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`postcol_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户的帖子收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of postcol
-- ----------------------------

-- ----------------------------
-- Table structure for space
-- ----------------------------
DROP TABLE IF EXISTS `space`;
CREATE TABLE `space`  (
  `space_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `post_number` INT NOT NULL,
  `fans_number` INT NOT NULL COMMENT '粉丝数',
  `like_number` INT NOT NULL,
  `follow_number` INT NOT NULL COMMENT '关注数',
  `profile` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`space_id`, `user_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of space
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `account_number` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` INT NULL DEFAULT NULL,
  `telephone` VARCHAR(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `space_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `account_number`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for usercol
-- ----------------------------
DROP TABLE IF EXISTS `usercol`;
CREATE TABLE `usercol`  (
  `usercol_id` INT NOT NULL AUTO_INCREMENT COMMENT '用户关注表',
  `user_id` INT NOT NULL,
  `follow_id` INT NOT NULL COMMENT '关注的人id',
  PRIMARY KEY (`usercol_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;
`admin``baike`
-- ----------------------------
-- Records of usercol
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
