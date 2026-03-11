/*
 Navicat Premium Data Transfer

 Source Server         : yjh
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : wms_db

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 11/03/2026 16:30:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 系统用户', 6, 'add_user');
INSERT INTO `auth_permission` VALUES (22, 'Can change 系统用户', 6, 'change_user');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 系统用户', 6, 'delete_user');
INSERT INTO `auth_permission` VALUES (24, 'Can view 系统用户', 6, 'view_user');
INSERT INTO `auth_permission` VALUES (25, 'Can add 商品分类', 7, 'add_productcategory');
INSERT INTO `auth_permission` VALUES (26, 'Can change 商品分类', 7, 'change_productcategory');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 商品分类', 7, 'delete_productcategory');
INSERT INTO `auth_permission` VALUES (28, 'Can view 商品分类', 7, 'view_productcategory');
INSERT INTO `auth_permission` VALUES (29, 'Can add 库存', 8, 'add_inventory');
INSERT INTO `auth_permission` VALUES (30, 'Can change 库存', 8, 'change_inventory');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 库存', 8, 'delete_inventory');
INSERT INTO `auth_permission` VALUES (32, 'Can view 库存', 8, 'view_inventory');
INSERT INTO `auth_permission` VALUES (33, 'Can add 出入库单据', 9, 'add_order');
INSERT INTO `auth_permission` VALUES (34, 'Can change 出入库单据', 9, 'change_order');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 出入库单据', 9, 'delete_order');
INSERT INTO `auth_permission` VALUES (36, 'Can view 出入库单据', 9, 'view_order');
INSERT INTO `auth_permission` VALUES (37, 'Can add 仓库', 10, 'add_warehouse');
INSERT INTO `auth_permission` VALUES (38, 'Can change 仓库', 10, 'change_warehouse');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 仓库', 10, 'delete_warehouse');
INSERT INTO `auth_permission` VALUES (40, 'Can view 仓库', 10, 'view_warehouse');
INSERT INTO `auth_permission` VALUES (41, 'Can add 供应商', 11, 'add_supplier');
INSERT INTO `auth_permission` VALUES (42, 'Can change 供应商', 11, 'change_supplier');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 供应商', 11, 'delete_supplier');
INSERT INTO `auth_permission` VALUES (44, 'Can view 供应商', 11, 'view_supplier');
INSERT INTO `auth_permission` VALUES (45, 'Can add 储位', 12, 'add_storagelocation');
INSERT INTO `auth_permission` VALUES (46, 'Can change 储位', 12, 'change_storagelocation');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 储位', 12, 'delete_storagelocation');
INSERT INTO `auth_permission` VALUES (48, 'Can view 储位', 12, 'view_storagelocation');
INSERT INTO `auth_permission` VALUES (49, 'Can add 审计日志', 13, 'add_auditlog');
INSERT INTO `auth_permission` VALUES (50, 'Can change 审计日志', 13, 'change_auditlog');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 审计日志', 13, 'delete_auditlog');
INSERT INTO `auth_permission` VALUES (52, 'Can view 审计日志', 13, 'view_auditlog');
INSERT INTO `auth_permission` VALUES (53, 'Can add 单据明细', 14, 'add_orderitem');
INSERT INTO `auth_permission` VALUES (54, 'Can change 单据明细', 14, 'change_orderitem');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 单据明细', 14, 'delete_orderitem');
INSERT INTO `auth_permission` VALUES (56, 'Can view 单据明细', 14, 'view_orderitem');
INSERT INTO `auth_permission` VALUES (57, 'Can add 商品', 15, 'add_product');
INSERT INTO `auth_permission` VALUES (58, 'Can change 商品', 15, 'change_product');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 商品', 15, 'delete_product');
INSERT INTO `auth_permission` VALUES (60, 'Can view 商品', 15, 'view_product');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_wms_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_wms_user_id` FOREIGN KEY (`user_id`) REFERENCES `wms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2026-02-21 15:02:58.567618', '1', 'admin (系统管理员)', 2, '[{\"changed\": {\"fields\": [\"\\u7cfb\\u7edf\\u89d2\\u8272\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (2, '2026-02-21 15:40:48.309344', '1', '一号仓库 - A-01', 1, '[{\"added\": {}}]', 12, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (13, 'wms_api', 'auditlog');
INSERT INTO `django_content_type` VALUES (8, 'wms_api', 'inventory');
INSERT INTO `django_content_type` VALUES (9, 'wms_api', 'order');
INSERT INTO `django_content_type` VALUES (14, 'wms_api', 'orderitem');
INSERT INTO `django_content_type` VALUES (15, 'wms_api', 'product');
INSERT INTO `django_content_type` VALUES (7, 'wms_api', 'productcategory');
INSERT INTO `django_content_type` VALUES (12, 'wms_api', 'storagelocation');
INSERT INTO `django_content_type` VALUES (11, 'wms_api', 'supplier');
INSERT INTO `django_content_type` VALUES (6, 'wms_api', 'user');
INSERT INTO `django_content_type` VALUES (10, 'wms_api', 'warehouse');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2026-02-21 12:20:43.811550');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2026-02-21 12:20:43.883558');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2026-02-21 12:20:44.070315');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2026-02-21 12:20:44.118309');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2026-02-21 12:20:44.123308');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2026-02-21 12:20:44.127315');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2026-02-21 12:20:44.132315');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2026-02-21 12:20:44.134978');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2026-02-21 12:20:44.138977');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2026-02-21 12:20:44.142972');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2026-02-21 12:20:44.146985');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2026-02-21 12:20:44.155978');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2026-02-21 12:20:44.160978');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2026-02-21 12:20:44.165972');
INSERT INTO `django_migrations` VALUES (15, 'wms_api', '0001_initial', '2026-02-21 12:20:44.388794');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2026-02-21 12:20:44.499004');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2026-02-21 12:20:44.504007');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2026-02-21 12:20:44.510004');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2026-02-21 12:20:44.540004');
INSERT INTO `django_migrations` VALUES (20, 'wms_api', '0002_productcategory_storagelocation_supplier_warehouse_and_more', '2026-02-21 14:50:48.911445');
INSERT INTO `django_migrations` VALUES (21, 'wms_api', '0003_alter_user_role', '2026-02-22 04:34:35.928274');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('6gqa9nuowt1clgoukypzpu59mo6qjutj', '.eJxVjDsOwjAQBe_iGln-fyjpOYO19npxADlSnFSIu0OkFNC-mXkvlmBbW9pGXdKE7MwkO_1uGcqj9h3gHfpt5mXu6zJlviv8oINfZ6zPy-H-HTQY7VsLT05lG2ou1iqntPdkVQnGGWtBkY4YC6BGqdFFEjJ6CD4TGS8yac3eH81JN4Y:1vtoSu:N43f6-Gor2K8rrQXon_nCaLg3Fqp-8vOQFQOEx0Dutk', '2026-03-07 15:00:16.402742');
INSERT INTO `django_session` VALUES ('mcmefrzcbsj08er3gcehfz5iysu4rx1i', '.eJxVjMEOwiAQBf-FsyGwFAGP3vsNZIFFqgaS0p6M_64kPWje7c1kXszjvhW_d1r9ktiFSXb6_QLGB9UB0h3rrfHY6rYugQ-FH7TzuSV6Xg_3L1Cwl5ElAGGUSsJJK-w05aw0gEIn5NkSYAZFQFEGQxqUlgacA0dZIHzn2PsDp6I2oA:1vtm29:3t4Dg55NXPWzT5qohHN_fKaqd0PIAvBXkPMA9JZ2Idg', '2026-03-07 12:24:29.671621');

-- ----------------------------
-- Table structure for wms_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `wms_audit_log`;
CREATE TABLE `wms_audit_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wms_audit_log_user_id_ec2f433d_fk_wms_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `wms_audit_log_user_id_ec2f433d_fk_wms_user_id` FOREIGN KEY (`user_id`) REFERENCES `wms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_audit_log
-- ----------------------------

-- ----------------------------
-- Table structure for wms_category
-- ----------------------------
DROP TABLE IF EXISTS `wms_category`;
CREATE TABLE `wms_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_category
-- ----------------------------
INSERT INTO `wms_category` VALUES (1, '碳酸饮料', '碳酸类型的饮料');
INSERT INTO `wms_category` VALUES (2, '果茶系列', '果茶');
INSERT INTO `wms_category` VALUES (3, '功能性饮料', '功能性饮料');

-- ----------------------------
-- Table structure for wms_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory`;
CREATE TABLE `wms_inventory`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `storage_location_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `wms_inventory_product_id_storage_location_id_a3489853_uniq`(`product_id`, `storage_location_id`) USING BTREE,
  INDEX `wms_inventory_storage_location_id_dcccea6c_fk_wms_stora`(`storage_location_id`) USING BTREE,
  CONSTRAINT `wms_inventory_product_id_2529578f_fk_wms_product_id` FOREIGN KEY (`product_id`) REFERENCES `wms_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wms_inventory_storage_location_id_dcccea6c_fk_wms_stora` FOREIGN KEY (`storage_location_id`) REFERENCES `wms_storage_location` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory
-- ----------------------------
INSERT INTO `wms_inventory` VALUES (1, 50, '2026-02-21 16:11:37.126824', 1, 1);
INSERT INTO `wms_inventory` VALUES (2, 500, '2026-02-22 03:57:47.219267', 4, 2);

-- ----------------------------
-- Table structure for wms_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_order`;
CREATE TABLE `wms_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `finish_time` datetime(6) NULL DEFAULT NULL,
  `operator_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no`) USING BTREE,
  INDEX `wms_order_operator_id_8cc002d1_fk_wms_user_id`(`operator_id`) USING BTREE,
  CONSTRAINT `wms_order_operator_id_8cc002d1_fk_wms_user_id` FOREIGN KEY (`operator_id`) REFERENCES `wms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_order
-- ----------------------------
INSERT INTO `wms_order` VALUES (1, 'IN20260221154155', 'in', 'completed', '', '2026-02-21 15:41:55.658600', '2026-02-21 15:41:55.658600', 3);
INSERT INTO `wms_order` VALUES (2, 'OUT20260221155007', 'out', 'completed', '', '2026-02-21 15:50:07.294982', '2026-02-21 15:50:07.294982', 3);
INSERT INTO `wms_order` VALUES (3, 'OUT20260221161137', 'out', 'completed', '', '2026-02-21 16:11:37.123827', '2026-02-21 16:11:37.122830', 3);
INSERT INTO `wms_order` VALUES (4, 'IN20260222035747', 'in', 'completed', '', '2026-02-22 03:57:47.213266', '2026-02-22 03:57:47.213266', 3);

-- ----------------------------
-- Table structure for wms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `wms_order_item`;
CREATE TABLE `wms_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `storage_location_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wms_order_item_order_id_62c48b51_fk_wms_order_id`(`order_id`) USING BTREE,
  INDEX `wms_order_item_product_id_5c9b4c6a_fk_wms_product_id`(`product_id`) USING BTREE,
  INDEX `wms_order_item_storage_location_id_e732cc19_fk_wms_stora`(`storage_location_id`) USING BTREE,
  CONSTRAINT `wms_order_item_order_id_62c48b51_fk_wms_order_id` FOREIGN KEY (`order_id`) REFERENCES `wms_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wms_order_item_product_id_5c9b4c6a_fk_wms_product_id` FOREIGN KEY (`product_id`) REFERENCES `wms_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wms_order_item_storage_location_id_e732cc19_fk_wms_stora` FOREIGN KEY (`storage_location_id`) REFERENCES `wms_storage_location` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_order_item
-- ----------------------------
INSERT INTO `wms_order_item` VALUES (1, 550, 1, 1, 1);
INSERT INTO `wms_order_item` VALUES (2, 100, 2, 1, 1);
INSERT INTO `wms_order_item` VALUES (3, 400, 3, 1, 1);
INSERT INTO `wms_order_item` VALUES (4, 500, 4, 4, 2);

-- ----------------------------
-- Table structure for wms_product
-- ----------------------------
DROP TABLE IF EXISTS `wms_product`;
CREATE TABLE `wms_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_stock` int NOT NULL,
  `max_stock` int NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `category_id` bigint NULL DEFAULT NULL,
  `supplier_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `wms_product_category_id_8291e18b_fk_wms_category_id`(`category_id`) USING BTREE,
  INDEX `wms_product_supplier_id_b4c3a53e_fk_wms_supplier_id`(`supplier_id`) USING BTREE,
  CONSTRAINT `wms_product_category_id_8291e18b_fk_wms_category_id` FOREIGN KEY (`category_id`) REFERENCES `wms_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wms_product_supplier_id_b4c3a53e_fk_wms_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `wms_supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_product
-- ----------------------------
INSERT INTO `wms_product` VALUES (1, 'SKU-001', '可口可乐（500ml）', '个', 100, 1000, 1.56, 1, 1);
INSERT INTO `wms_product` VALUES (2, 'SKU-002', '蜜雪固饮（经典果茶550ml）', '个', 10, 1000, 2.70, 2, 2);
INSERT INTO `wms_product` VALUES (3, 'SKU-003', '可口可乐（330ml）', '个', 10, 1000, 1.00, 1, 1);
INSERT INTO `wms_product` VALUES (4, 'SKU-004', '红牛', '个', 100, 1000, 2.75, 3, 1);

-- ----------------------------
-- Table structure for wms_storage_location
-- ----------------------------
DROP TABLE IF EXISTS `wms_storage_location`;
CREATE TABLE `wms_storage_location`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `warehouse_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `wms_storage_location_warehouse_id_7a4d2f5d_fk_wms_warehouse_id`(`warehouse_id`) USING BTREE,
  CONSTRAINT `wms_storage_location_warehouse_id_7a4d2f5d_fk_wms_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `wms_warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_storage_location
-- ----------------------------
INSERT INTO `wms_storage_location` VALUES (1, 'A-01', '常温区碳酸类饮料', 1);
INSERT INTO `wms_storage_location` VALUES (2, 'A区-02', '常温功能型饮料', 1);

-- ----------------------------
-- Table structure for wms_supplier
-- ----------------------------
DROP TABLE IF EXISTS `wms_supplier`;
CREATE TABLE `wms_supplier`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_supplier
-- ----------------------------
INSERT INTO `wms_supplier` VALUES (1, '可口可乐', '可乐大王', '1008611', '艾欧尼亚', '2026-02-21 15:15:19.978365');
INSERT INTO `wms_supplier` VALUES (2, '蜜雪冰城', '杨洋', '1008612', '弗雷尔卓德', '2026-02-21 15:16:53.757479');

-- ----------------------------
-- Table structure for wms_user
-- ----------------------------
DROP TABLE IF EXISTS `wms_user`;
CREATE TABLE `wms_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_user
-- ----------------------------
INSERT INTO `wms_user` VALUES (1, 'pbkdf2_sha256$1000000$ULw66c8foc6iyBExQ60JML$n1BS5Rzi+Ut4ZJ7VGUy2CVYiStfX4BGq9XNltYNA/LA=', '2026-02-21 15:00:16.000000', 1, 'admin', '', '', '', 1, 1, '2026-02-21 12:21:04.000000', 'admin', 'admin');
INSERT INTO `wms_user` VALUES (2, 'pbkdf2_sha256$1000000$205y4CMQ6cQHskylEJWWmJ$UyafXO24+T/oGKXZ9ZxobOmEv/jU4wlPy52yZVxInIc=', NULL, 0, 'super', '', '', '', 1, 1, '2026-02-21 15:13:22.688380', 'supervisor', '李主管');
INSERT INTO `wms_user` VALUES (3, 'pbkdf2_sha256$1000000$aKoWVPGdsgBWVyTPOJoh2V$A2Yvklj7549/I1kH7Md16BjxsEtOshX3jlt/rjqLb84=', NULL, 0, 'opt', '', '', '', 1, 1, '2026-02-21 15:13:23.140854', 'operator', '王操作');

-- ----------------------------
-- Table structure for wms_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `wms_user_groups`;
CREATE TABLE `wms_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `wms_user_groups_user_id_group_id_98a211a8_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `wms_user_groups_group_id_c53e34ec_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `wms_user_groups_group_id_c53e34ec_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wms_user_groups_user_id_fd7116a3_fk_wms_user_id` FOREIGN KEY (`user_id`) REFERENCES `wms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for wms_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `wms_user_user_permissions`;
CREATE TABLE `wms_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `wms_user_user_permissions_user_id_permission_id_954c426c_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `wms_user_user_permis_permission_id_28f6455a_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `wms_user_user_permis_permission_id_28f6455a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wms_user_user_permissions_user_id_befdddfa_fk_wms_user_id` FOREIGN KEY (`user_id`) REFERENCES `wms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for wms_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `wms_warehouse`;
CREATE TABLE `wms_warehouse`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_warehouse
-- ----------------------------
INSERT INTO `wms_warehouse` VALUES (1, '一号仓库', '艾欧尼亚主城区');

SET FOREIGN_KEY_CHECKS = 1;
