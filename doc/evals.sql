/*
Navicat MySQL Data Transfer

Source Server         : lab
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : evals

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2017-03-08 11:14:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for eval_attachment
-- ----------------------------
DROP TABLE IF EXISTS `eval_attachment`;
CREATE TABLE `eval_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filesid` int(11) DEFAULT NULL COMMENT '本题对应的附件',
  `group_eval_question_id` int(11) DEFAULT NULL COMMENT '评测题目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评分任务分组表';

-- ----------------------------
-- Records of eval_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for eval_check_item
-- ----------------------------
DROP TABLE IF EXISTS `eval_check_item`;
CREATE TABLE `eval_check_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail` varchar(255) DEFAULT NULL COMMENT '得分标准',
  `score` float DEFAULT NULL COMMENT '该项所占分数',
  `parent_item_id` int(11) DEFAULT NULL COMMENT '父标准',
  `group_eval_question_id` int(11) DEFAULT NULL COMMENT '评测题目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评分任务分组表';

-- ----------------------------
-- Records of eval_check_item
-- ----------------------------

-- ----------------------------
-- Table structure for eval_check_task
-- ----------------------------
DROP TABLE IF EXISTS `eval_check_task`;
CREATE TABLE `eval_check_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eval_group_id` int(11) DEFAULT NULL COMMENT '被评论组',
  `status` int(1) DEFAULT NULL COMMENT '状态',
  `eval_comment_id` int(11) DEFAULT NULL COMMENT '评论信息',
  `eval_student` int(11) DEFAULT NULL COMMENT '评分人员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评分任务分组表';

-- ----------------------------
-- Records of eval_check_task
-- ----------------------------

-- ----------------------------
-- Table structure for eval_comment
-- ----------------------------
DROP TABLE IF EXISTS `eval_comment`;
CREATE TABLE `eval_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `score` float DEFAULT NULL COMMENT '总分',
  `comment_time` datetime DEFAULT NULL COMMENT '评论时间',
  `commenter_id` int(11) DEFAULT NULL COMMENT '评论的人',
  `eval_group_id` int(11) DEFAULT NULL COMMENT '评论所属小组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群体评论打分表';

-- ----------------------------
-- Records of eval_comment
-- ----------------------------

-- ----------------------------
-- Table structure for eval_comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `eval_comment_reply`;
CREATE TABLE `eval_comment_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eval_comment_id` int(11) DEFAULT NULL COMMENT '对评论进行回复',
  `replyer_id` int(11) DEFAULT NULL COMMENT '回复者',
  `reply_detail` varchar(255) DEFAULT NULL COMMENT '回复详情',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `comment_reply_id` int(11) DEFAULT NULL COMMENT '对那个回复进行回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群体评论回复表';

-- ----------------------------
-- Records of eval_comment_reply
-- ----------------------------

-- ----------------------------
-- Table structure for eval_group
-- ----------------------------
DROP TABLE IF EXISTS `eval_group`;
CREATE TABLE `eval_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_eval_id` int(11) DEFAULT NULL COMMENT '群体评测',
  `group_num` int(2) DEFAULT NULL COMMENT '小组编号',
  `score` float DEFAULT NULL COMMENT '得分',
  `group_name` varchar(50) DEFAULT NULL COMMENT '组名',
  `status` int(3) DEFAULT NULL COMMENT '是否评论的状态',
  `teacher_score` float DEFAULT NULL COMMENT '老师打的分',
  `student_score` float DEFAULT NULL COMMENT '学生打的分',
  `teacher_perscent` float DEFAULT NULL COMMENT '教师打分占得比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每项的得分表';

-- ----------------------------
-- Records of eval_group
-- ----------------------------

-- ----------------------------
-- Table structure for eval_score_item
-- ----------------------------
DROP TABLE IF EXISTS `eval_score_item`;
CREATE TABLE `eval_score_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eval_check_item_id` int(11) DEFAULT NULL COMMENT '被打分项',
  `score` float DEFAULT NULL COMMENT '得分',
  `eval_comment_id` int(11) DEFAULT NULL COMMENT '所属评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每项的得分表';

-- ----------------------------
-- Records of eval_score_item
-- ----------------------------

-- ----------------------------
-- Table structure for eval_student
-- ----------------------------
DROP TABLE IF EXISTS `eval_student`;
CREATE TABLE `eval_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL COMMENT '评测中的学生',
  `eval_group_id` int(11) DEFAULT NULL COMMENT '所属的评测小组',
  `is_leader` tinyint(1) DEFAULT NULL COMMENT '是否是组长',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评测学生表';

-- ----------------------------
-- Records of eval_student
-- ----------------------------

-- ----------------------------
-- Table structure for eval_student_download
-- ----------------------------
DROP TABLE IF EXISTS `eval_student_download`;
CREATE TABLE `eval_student_download` (
  `eval_work_id` int(11) NOT NULL COMMENT '评测作业',
  `eval_studnet_id` int(11) NOT NULL COMMENT '评测中的学生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生下载作业表';

-- ----------------------------
-- Records of eval_student_download
-- ----------------------------

-- ----------------------------
-- Table structure for eval_work
-- ----------------------------
DROP TABLE IF EXISTS `eval_work`;
CREATE TABLE `eval_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `files_id` int(11) DEFAULT NULL COMMENT '作业实体',
  `eval_group_id` int(11) DEFAULT NULL COMMENT '上传作业的组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评测作业表';

-- ----------------------------
-- Records of eval_work
-- ----------------------------

-- ----------------------------
-- Table structure for group_eval
-- ----------------------------
DROP TABLE IF EXISTS `group_eval`;
CREATE TABLE `group_eval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anonymous_comment` tinyint(1) DEFAULT NULL COMMENT '是否匿名评论',
  `auto_publish` tinyint(1) DEFAULT NULL COMMENT '发布',
  `bs_witch` tinyint(1) DEFAULT NULL COMMENT '评论开关',
  `upload _time` datetime DEFAULT NULL COMMENT '作品结束上传时间',
  `end_time` datetime DEFAULT NULL COMMENT '评测结束时间',
  `group_method` int(1) DEFAULT NULL COMMENT '分组方式,0为还没设置,1为教师指定，2为学生自己分组(默认教师指定)',
  `group_size` int(1) DEFAULT '1' COMMENT '每组人数(默认1人)',
  `multi_comment` tinyint(1) DEFAULT NULL COMMENT '是否可以多次评论',
  `eval_title` varchar(255) DEFAULT NULL COMMENT '评测题目',
  `publish_result` tinyint(1) DEFAULT NULL COMMENT '是否公布结果',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `owner_id` int(11) DEFAULT NULL COMMENT '出题人',
  `teaching_class_id` int(11) DEFAULT NULL COMMENT '教学班级id',
  `group_eval_question_id` int(11) DEFAULT NULL COMMENT '群体评测题目id',
  `eval_detail` varchar(255) DEFAULT NULL COMMENT '评测的详细内容',
  `group_time` datetime DEFAULT NULL COMMENT '分组结束时间',
  `check_task_group_count` int(1) DEFAULT '3' COMMENT '评论任务所需评论组数，默认为3组',
  `assign_state` int(1) DEFAULT NULL COMMENT '是否已分组',
  `status` int(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='评测试题表';

-- ----------------------------
-- Records of group_eval
-- ----------------------------
INSERT INTO `group_eval` VALUES ('1', null, '0', null, '2017-01-19 16:50:14', '2017-01-19 16:50:14', null, '1', null, '1', null, '2017-01-19 16:50:14', '1', '1', '1', null, '2017-01-19 16:50:14', '3', null, '1');
INSERT INTO `group_eval` VALUES ('2', null, '0', null, '2017-01-19 17:24:08', '2017-01-19 17:24:08', null, '1', null, '12', null, '2017-01-19 17:24:08', '2', '2', '1', null, '2017-01-19 17:24:08', '3', null, '1');
INSERT INTO `group_eval` VALUES ('3', null, '0', null, '2017-01-20 18:00:33', '2017-01-20 18:00:33', null, '1', null, '133', null, '2017-01-20 18:00:33', '3', null, '1', null, '2017-01-20 18:00:33', '3', null, '1');
INSERT INTO `group_eval` VALUES ('4', null, '0', null, '2017-01-24 09:33:54', '2017-01-24 09:33:54', null, '1', null, null, null, '2017-01-24 09:33:54', null, null, null, null, '2017-01-24 09:33:54', '3', null, '0');
INSERT INTO `group_eval` VALUES ('5', null, '0', null, '2017-01-24 11:31:01', '2017-01-24 11:31:01', null, '1', null, null, null, '2017-01-24 11:31:01', null, null, null, null, '2017-01-24 11:31:01', '3', null, '0');
INSERT INTO `group_eval` VALUES ('6', null, '0', null, '2017-01-24 11:37:43', '2017-01-24 11:37:43', null, '1', null, null, null, '2017-01-24 11:37:43', null, null, null, null, '2017-01-24 11:37:43', '3', null, '0');
INSERT INTO `group_eval` VALUES ('7', null, '0', null, '2017-02-09 11:09:35', '2017-02-09 11:09:35', null, '1', null, null, null, '2017-02-09 11:09:35', null, null, null, null, '2017-02-09 11:09:35', '3', null, '0');
INSERT INTO `group_eval` VALUES ('8', null, '0', null, '2017-02-12 16:22:46', '2017-02-12 16:22:46', null, '1', null, null, null, '2017-02-12 16:22:46', null, null, null, null, '2017-02-12 16:22:46', '3', null, '0');
INSERT INTO `group_eval` VALUES ('9', null, '0', null, '2017-02-12 17:15:07', '2017-02-12 17:15:07', null, '1', null, null, null, '2017-02-12 17:15:07', null, null, null, null, '2017-02-12 17:15:07', '3', null, '0');
INSERT INTO `group_eval` VALUES ('10', null, '0', null, '2017-02-12 17:17:22', '2017-02-12 17:17:22', null, '1', null, null, null, '2017-02-12 17:17:22', null, null, null, null, '2017-02-12 17:17:22', '3', null, '0');

-- ----------------------------
-- Table structure for group_eval_question
-- ----------------------------
DROP TABLE IF EXISTS `group_eval_question`;
CREATE TABLE `group_eval_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '题目',
  `title_detail` varchar(255) DEFAULT NULL COMMENT '题目的详细内容',
  `owner_id` int(11) DEFAULT NULL COMMENT '出题人',
  `create_time` datetime DEFAULT NULL COMMENT '出题时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态，0为未删除，1为删除',
  `is_share` tinyint(1) DEFAULT '0' COMMENT '是否分享，1为分享',
  `course_group_id` int(11) DEFAULT NULL COMMENT '所属课程id',
  `previous_question_id` int(11) DEFAULT NULL COMMENT '此题的上一个版本',
  `root_question_id` int(11) DEFAULT NULL COMMENT '根题目，此题的最原始版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='评测试题表';

-- ----------------------------
-- Records of group_eval_question
-- ----------------------------
INSERT INTO `group_eval_question` VALUES ('18', null, null, null, '2017-02-15 11:39:28', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('19', null, null, null, '2017-02-15 11:42:05', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('20', null, null, null, '2017-02-15 11:46:00', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('21', null, null, null, '2017-02-15 11:53:36', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('22', null, null, null, '2017-02-16 09:37:34', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('23', null, null, null, '2017-02-16 09:37:53', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('24', null, null, null, '2017-02-16 09:37:59', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('25', null, null, null, '2017-02-16 09:38:44', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('26', null, null, null, '2017-02-16 10:09:37', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('27', null, null, null, '2017-02-16 10:16:25', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('28', null, null, null, '2017-02-16 10:46:27', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('29', 'sss', 'sss', null, '2017-02-16 10:46:36', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('30', 'sss', 'sss', null, '2017-02-16 10:46:40', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('31', 'sss', 'sss', null, '2017-02-16 10:46:41', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('32', 'sss', 'sss', null, '2017-02-16 10:46:42', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('33', 'sss', 'sss', null, '2017-02-16 10:46:43', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('34', 'sss', 'sss', null, '2017-02-16 10:47:00', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('35', null, null, null, '2017-02-20 10:18:17', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('36', null, null, null, '2017-02-20 10:53:58', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('37', '', 'wdad', null, '2017-02-20 10:54:32', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('38', 'wdad', 'wdad', null, '2017-02-20 10:54:53', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('39', 'wdad', 'wdad', null, '2017-02-20 10:54:55', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('40', 'wdad', 'wdad', null, '2017-02-20 10:54:56', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('41', 'wdad', 'wdad', null, '2017-02-20 10:54:56', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('42', 'wdad', 'wdad', null, '2017-02-20 10:54:56', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('43', 'wdad', 'wdad', null, '2017-02-20 10:54:57', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('44', 'wdad', 'wdad', null, '2017-02-20 10:54:58', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('45', 'wdad', 'wdad', null, '2017-02-20 10:55:04', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('46', null, null, null, '2017-02-20 10:55:54', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('47', null, null, null, '2017-02-20 10:59:01', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('48', null, null, null, '2017-02-20 10:59:25', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('49', null, null, null, '2017-02-20 11:00:43', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('50', null, null, null, '2017-02-20 11:02:03', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('51', null, null, null, '2017-02-20 11:05:07', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('52', null, null, null, '2017-02-20 11:11:24', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('53', null, null, null, '2017-02-21 17:06:46', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('54', null, null, null, '2017-03-01 17:22:25', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('55', null, null, null, '2017-03-01 17:30:05', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('56', null, null, null, '2017-03-01 17:33:37', '0', '0', null, null, null);
INSERT INTO `group_eval_question` VALUES ('57', null, null, null, '2017-03-06 18:01:39', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL COMMENT '班级名称',
  `Grade` int(255) DEFAULT NULL COMMENT '年级',
  `SchoolId` int(11) DEFAULT NULL COMMENT '学校ID',
  `DepartmentId` int(11) DEFAULT NULL COMMENT '所属学院',
  `ProfessionId` int(11) DEFAULT NULL COMMENT '所属专业',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES ('2', '公共事业2016级2班', '2016', '2', '7', '9');
INSERT INTO `t_class` VALUES ('3', '国际金融2016级1班', '2016', '3', '8', '7');
INSERT INTO `t_class` VALUES ('4', '国际金融2016级2班', '2016', '4', '8', '7');
INSERT INTO `t_class` VALUES ('5', '国际金融2016级3班', '2016', '5', '8', '7');
INSERT INTO `t_class` VALUES ('6', '软工2016级1班', '2016', '6', '9', '114');
INSERT INTO `t_class` VALUES ('7', '软工2016级2班', '2016', '7', '9', '114');
INSERT INTO `t_class` VALUES ('8', '行政管理2016级1班', '2016', '8', '7', '10');
INSERT INTO `t_class` VALUES ('9', '测试班级_1', '2016', '9', '9', '114');
INSERT INTO `t_class` VALUES ('10', '测试班级_2', '2016', '10', '9', '114');
INSERT INTO `t_class` VALUES ('11', '测试班级_3', '2016', '11', '9', '114');
INSERT INTO `t_class` VALUES ('12', '测试班级_4', '2016', '12', '9', '114');
INSERT INTO `t_class` VALUES ('13', '测试班级_5', '2016', '13', '9', '114');
INSERT INTO `t_class` VALUES ('14', '测试班级_6', '2016', '14', '9', '114');
INSERT INTO `t_class` VALUES ('15', '测试班级_7', '2016', '15', '9', '114');
INSERT INTO `t_class` VALUES ('16', '测试班级_8', '2016', '16', '9', '114');
INSERT INTO `t_class` VALUES ('17', '测试班级_9', '2016', '17', '9', '114');
INSERT INTO `t_class` VALUES ('18', '测试班级_10', '2016', '18', '9', '114');
INSERT INTO `t_class` VALUES ('19', '测试班级_11', '2016', '19', '9', '114');
INSERT INTO `t_class` VALUES ('20', '测试班级_12', '2016', '20', '9', '114');
INSERT INTO `t_class` VALUES ('21', '测试班级_13', '2016', '21', '9', '114');
INSERT INTO `t_class` VALUES ('22', '测试', '2016', '22', '9', '110');
INSERT INTO `t_class` VALUES ('30', '软工16级Java1班', '2016', '30', '9', '113');
INSERT INTO `t_class` VALUES ('31', '软工16级Java2班', '2016', '31', '9', '113');
INSERT INTO `t_class` VALUES ('32', '软工16级Java3班', '2016', '32', '9', '113');
INSERT INTO `t_class` VALUES ('33', '软工16级Java4班', '2016', '33', '9', '113');
INSERT INTO `t_class` VALUES ('34', '软工16级.NET1班', '2016', '34', '9', '110');
INSERT INTO `t_class` VALUES ('35', '软工16级.NET2班', '2016', '35', '9', '110');
INSERT INTO `t_class` VALUES ('36', '姚瑶的辅导班 1班', '2017', '36', '30', '115');
INSERT INTO `t_class` VALUES ('37', '姚瑶的辅导班 2班', '2017', '37', '30', '115');
INSERT INTO `t_class` VALUES ('38', '姚瑶的辅导班 3班', '2017', '38', '30', '115');
INSERT INTO `t_class` VALUES ('39', '姚瑶的辅导班 4班', '2017', '39', '30', '115');
INSERT INTO `t_class` VALUES ('40', '姚瑶的辅导班 5班', '2017', '40', '30', '115');
INSERT INTO `t_class` VALUES ('41', '姚瑶的辅导班 6班', '2017', '41', '30', '115');
INSERT INTO `t_class` VALUES ('42', '二叉树 1班', '2017', '42', '9', '110');
INSERT INTO `t_class` VALUES ('43', '二叉树 2班', '2017', '43', '9', '110');
INSERT INTO `t_class` VALUES ('44', '二叉树 3班', '2017', '44', '9', '110');
INSERT INTO `t_class` VALUES ('45', '二叉树 4班', '2017', '45', '9', '110');
INSERT INTO `t_class` VALUES ('46', '二叉树 5班', '2017', '46', '9', '110');
INSERT INTO `t_class` VALUES ('47', '二叉树 6班', '2017', '47', '9', '110');
INSERT INTO `t_class` VALUES ('48', null, null, null, null, null);
INSERT INTO `t_class` VALUES ('49', '', null, null, null, null);

-- ----------------------------
-- Table structure for t_coursegroup
-- ----------------------------
DROP TABLE IF EXISTS `t_coursegroup`;
CREATE TABLE `t_coursegroup` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Status` int(2) DEFAULT '1' COMMENT '默认状态为1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_coursegroup
-- ----------------------------
INSERT INTO `t_coursegroup` VALUES ('1', '2', '1');
INSERT INTO `t_coursegroup` VALUES ('18', '软件工程学院 C语言程序设计', '1');

-- ----------------------------
-- Table structure for t_coursegroup_department
-- ----------------------------
DROP TABLE IF EXISTS `t_coursegroup_department`;
CREATE TABLE `t_coursegroup_department` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseGroupId` int(11) NOT NULL COMMENT '课程组ID',
  `DepartmentId` int(11) DEFAULT NULL COMMENT '课程组所属学院ID',
  `InDate` datetime DEFAULT NULL COMMENT '数据写入时间',
  `DepartmentName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_coursegroup_department
-- ----------------------------

-- ----------------------------
-- Table structure for t_coursegroup_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `t_coursegroup_knowledge`;
CREATE TABLE `t_coursegroup_knowledge` (
  `Id` int(11) NOT NULL,
  `CourseGroupId` int(11) NOT NULL,
  `knowledge` varchar(50) DEFAULT NULL COMMENT '知识点',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_coursegroup_knowledge
-- ----------------------------

-- ----------------------------
-- Table structure for t_coursegroup_syllabus
-- ----------------------------
DROP TABLE IF EXISTS `t_coursegroup_syllabus`;
CREATE TABLE `t_coursegroup_syllabus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseGroupId` int(11) DEFAULT NULL COMMENT '课程组ID',
  `SyllabusId` int(11) DEFAULT NULL COMMENT '课程大纲ID',
  `InDate` datetime DEFAULT NULL COMMENT '数据写入时间',
  `SyllabusName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_coursegroup_syllabus
-- ----------------------------

-- ----------------------------
-- Table structure for t_coursegroup_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_coursegroup_teacher`;
CREATE TABLE `t_coursegroup_teacher` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseGroupId` int(11) NOT NULL,
  `TeacherId` int(11) NOT NULL,
  `InDate` datetime DEFAULT NULL COMMENT '数据写入时间',
  `TeacherName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_coursegroup_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SchoolCampusId` int(11) NOT NULL COMMENT '校区ID',
  `Name` varchar(100) DEFAULT NULL COMMENT '学院名称',
  `Number` varchar(20) DEFAULT NULL COMMENT '学院编号',
  `InDate` datetime DEFAULT NULL,
  `InUser` varchar(30) DEFAULT NULL,
  `LastEditDate` datetime DEFAULT NULL,
  `LastEditUser` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------

-- ----------------------------
-- Table structure for t_files
-- ----------------------------
DROP TABLE IF EXISTS `t_files`;
CREATE TABLE `t_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `uploadTime` date DEFAULT NULL COMMENT '文件上传时间',
  `fileSize` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `contentType` varchar(255) DEFAULT NULL COMMENT '内容类型',
  `uploadExt` varchar(255) DEFAULT NULL COMMENT '文件上传时的扩展名',
  `savePath` varchar(255) DEFAULT NULL COMMENT '保存路径',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of t_files
-- ----------------------------

-- ----------------------------
-- Table structure for t_jx_class
-- ----------------------------
DROP TABLE IF EXISTS `t_jx_class`;
CREATE TABLE `t_jx_class` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL COMMENT '教学班名称',
  `SemesterPlanDetailId` int(11) NOT NULL COMMENT '课程Id',
  `DeptId` int(11) NOT NULL COMMENT '所属学院',
  `TeacherId` int(11) NOT NULL COMMENT '任课主讲老师ID',
  `BeginDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `ClassIds` varchar(500) DEFAULT NULL,
  `Memo` varchar(200) DEFAULT NULL COMMENT '备注',
  `WeekBegin` int(11) DEFAULT NULL COMMENT '开始周',
  `WeekEnd` int(11) DEFAULT NULL COMMENT '结束周 (教学班上课)',
  `Media` int(11) DEFAULT NULL COMMENT '是否需要多媒体',
  `TotalHours` int(11) DEFAULT NULL,
  `InUser` varchar(30) DEFAULT NULL,
  `InDate` datetime DEFAULT NULL,
  `LastEditUser` varchar(30) DEFAULT NULL,
  `LastEditDate` datetime DEFAULT NULL,
  `TeacherTwoId` int(11) DEFAULT NULL COMMENT '老师2',
  `TeachingAssistant` varchar(30) DEFAULT NULL COMMENT '助教',
  `ApproveStatus` int(11) DEFAULT '0' COMMENT '实验教学任务审核状态：0-编辑中，1-待审核，2-审核通过，3-审核未通过',
  `ApproveMemo` varchar(1000) DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jx_class
-- ----------------------------

-- ----------------------------
-- Table structure for t_jx_class_mapping_teachingclass
-- ----------------------------
DROP TABLE IF EXISTS `t_jx_class_mapping_teachingclass`;
CREATE TABLE `t_jx_class_mapping_teachingclass` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TeachingClassId` int(11) NOT NULL COMMENT '教学班ID',
  `ClassId` int(11) NOT NULL COMMENT '自然班级ID（）',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jx_class_mapping_teachingclass
-- ----------------------------

-- ----------------------------
-- Table structure for t_profession
-- ----------------------------
DROP TABLE IF EXISTS `t_profession`;
CREATE TABLE `t_profession` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL COMMENT '中文专业名称',
  `EnName` varchar(100) DEFAULT NULL COMMENT '英文专业名称',
  `DirectionName` varchar(40) DEFAULT NULL COMMENT '专业（方向）名称',
  `DeptId` int(11) NOT NULL COMMENT '学院ID',
  `SchoolCampusId` int(11) NOT NULL COMMENT '校区ID',
  `Code` varchar(20) DEFAULT NULL COMMENT '教育部专业代码',
  `CampusCode` varchar(20) DEFAULT NULL COMMENT '校内专业代码',
  `Term` int(10) DEFAULT NULL COMMENT '修业年限',
  `Degree` varchar(10) DEFAULT NULL COMMENT '授予学位',
  `Brief` varchar(1000) DEFAULT NULL COMMENT '专业优势与特色',
  `TypeID` int(11) DEFAULT NULL COMMENT '专业类型Id，eg: 工科，理科',
  `LearningTypeID` int(11) DEFAULT NULL COMMENT '学校方式，eg:业余，函数',
  `InDate` datetime DEFAULT NULL,
  `InUser` varchar(30) DEFAULT NULL,
  `LastEditDate` datetime DEFAULT NULL,
  `LastEdituser` varchar(30) DEFAULT NULL,
  `ApprovalNo` varchar(0) DEFAULT NULL COMMENT '批准文号',
  `ApprovalDate` datetime DEFAULT NULL COMMENT '批准时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_profession
-- ----------------------------

-- ----------------------------
-- Table structure for t_schoolcampus
-- ----------------------------
DROP TABLE IF EXISTS `t_schoolcampus`;
CREATE TABLE `t_schoolcampus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL COMMENT '校区名字',
  `Number` varchar(20) NOT NULL COMMENT '校区代码或者编码',
  `Address` varchar(100) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `TelNumber` varchar(20) DEFAULT NULL,
  `InDate` datetime DEFAULT NULL,
  `InUser` varchar(30) DEFAULT NULL,
  `LastEditDate` datetime DEFAULT NULL,
  `LastEditUser` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_schoolcampus
-- ----------------------------

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Profession` int(11) DEFAULT NULL,
  `LearnYear` int(11) DEFAULT NULL,
  `LearnType` int(11) DEFAULT NULL,
  `LearnLevel` int(11) DEFAULT NULL,
  `LearnLong` int(11) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  `Name` varchar(20) NOT NULL,
  `Sex` varchar(2) DEFAULT NULL,
  `IdentityNo` varchar(20) NOT NULL,
  `LoginPassword` varchar(50) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `OriginPlace` varchar(20) DEFAULT NULL,
  `Nation` varchar(20) DEFAULT NULL,
  `LinkPhone` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomeAddress` varchar(50) DEFAULT NULL,
  `CurrentClassId` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT '1',
  `InUser` varchar(20) DEFAULT NULL,
  `InDate` datetime DEFAULT NULL,
  `LastEditUser` varchar(20) DEFAULT NULL,
  `LastEditDate` datetime DEFAULT NULL,
  `StudentNo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IndexIdentityNo` (`IdentityNo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------

-- ----------------------------
-- Table structure for t_syllabus
-- ----------------------------
DROP TABLE IF EXISTS `t_syllabus`;
CREATE TABLE `t_syllabus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(50) DEFAULT NULL COMMENT '课程中文名称',
  `CourseEnName` varchar(100) DEFAULT NULL COMMENT '课程英文名称',
  `InChargeOfDeptId` int(11) DEFAULT NULL COMMENT '课程负责学院ID',
  `CourseFitProfession` varchar(500) DEFAULT NULL COMMENT '课程适合专业',
  `CourseOpenTRSectionId` int(11) DEFAULT NULL COMMENT '开课单位',
  `PreCourse` varchar(500) DEFAULT NULL COMMENT '先修课程',
  `MoudleId` int(11) DEFAULT NULL COMMENT '模块',
  `CategroyId` int(11) DEFAULT NULL COMMENT '类别',
  `Credits` float(11,1) DEFAULT NULL COMMENT '学分',
  `CourseNatureld` int(11) DEFAULT NULL COMMENT '课程性质',
  `ExamMode` varchar(20) DEFAULT NULL COMMENT '考试方式',
  `InspectionProportion` int(11) DEFAULT NULL COMMENT '平时成绩比例',
  `TotalClassHours` int(11) DEFAULT NULL COMMENT '总学时 ',
  `LectureHours` int(11) DEFAULT NULL COMMENT '讲授学时',
  `ComputerHours` int(11) DEFAULT NULL COMMENT '上机学时',
  `ExperimentHours` int(11) DEFAULT NULL COMMENT '实验学时',
  `InternshipHours` int(11) DEFAULT NULL COMMENT '实习学时',
  `InternshipWeek` int(11) DEFAULT NULL COMMENT '实习周',
  `Version` varchar(20) DEFAULT NULL COMMENT '版本',
  `FilePath` varchar(500) DEFAULT NULL COMMENT '附件路径',
  `Memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `InDate` datetime DEFAULT NULL,
  `InUser` varchar(30) DEFAULT NULL,
  `LastEditDate` datetime DEFAULT NULL,
  `LastEditUser` varchar(30) DEFAULT NULL,
  `Status` int(11) DEFAULT '0' COMMENT '状态：0-编辑中，1-待审核，2-审核通过，3-审核不通过',
  `SyllabusCode` varchar(30) DEFAULT NULL COMMENT '大纲编号',
  `ApplyStatus` int(11) DEFAULT '0' COMMENT '是否申请更改：0-不更改，1-更改',
  `ApproveMemo` varchar(1000) DEFAULT NULL COMMENT '审批备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_syllabus
-- ----------------------------

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LoginAccount` varchar(11) NOT NULL,
  `PassWord` varchar(100) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Sex` varchar(2) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `DepartmentId` int(11) DEFAULT NULL,
  `JobTitleId` int(11) DEFAULT NULL,
  `TypeId` int(11) DEFAULT NULL,
  `EducationbgId` int(11) DEFAULT NULL,
  `PhoneNumber` varchar(11) DEFAULT NULL,
  `Introduction` varchar(300) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `InUser` varchar(30) DEFAULT NULL,
  `InDate` datetime DEFAULT NULL,
  `LastEditUser` varchar(30) DEFAULT NULL,
  `LastEditDate` datetime DEFAULT NULL,
  `PhotoPath` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for t_tts_semester_execution_plan_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_tts_semester_execution_plan_detail`;
CREATE TABLE `t_tts_semester_execution_plan_detail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TTSMasterId` int(11) NOT NULL COMMENT '人才培养方案ID',
  `SyllabusId` int(11) DEFAULT NULL COMMENT '大纲ID',
  `CourseCode` varchar(20) NOT NULL COMMENT '课程代码',
  `InChargeOfDeptId` int(11) DEFAULT NULL COMMENT '课程负责学院ID',
  `MoudleId` int(11) DEFAULT NULL COMMENT '模块ID',
  `CategroyId` int(11) DEFAULT NULL COMMENT '类别ID',
  `CourseNatureld` int(11) DEFAULT NULL COMMENT '课程性质',
  `PreCourse` varchar(500) DEFAULT NULL COMMENT '先修课程',
  `InspectionProportion` int(11) DEFAULT NULL COMMENT '平时成绩比例',
  `PerformSemester` varchar(30) DEFAULT NULL COMMENT '执行学期',
  `Memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `InDate` datetime DEFAULT NULL,
  `InUser` varchar(30) DEFAULT NULL,
  `LastEditDate` datetime DEFAULT NULL,
  `LastEditUser` varchar(30) DEFAULT NULL,
  `IsCopy` bit(1) DEFAULT NULL COMMENT '是否是 原始计划',
  `IsUpdate` bit(1) DEFAULT NULL,
  `Status` int(11) DEFAULT '0' COMMENT '用于数据逻辑删除',
  `ApproveStatus` int(11) DEFAULT '0' COMMENT '教学任务审核状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tts_semester_execution_plan_detail
-- ----------------------------
