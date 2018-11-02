-- auto create by SMD

USE WECHAT;

-- 省份表
DROP TABLE IF EXISTS T_PROVINCE;
CREATE TABLE WECHAT.T_PROVINCE
(
    C_ID                 VARCHAR(32)                          NOT NULL     COMMENT '省份ID',
    C_NAME               VARCHAR(200)                         NOT NULL     COMMENT '省份名称',
    C_JC                 VARCHAR(100)                         NULL         COMMENT '简称',
    C_JP                 VARCHAR(50)                          NULL         COMMENT '简拼',
    C_FJM                VARCHAR(100)                         NOT NULL     COMMENT '分级码',
    N_ORDER              INT                                  NULL         COMMENT '显示顺序',
CONSTRAINT PK_PROVINCE PRIMARY KEY( C_ID )
) COMMENT = '省份表' ;

-- 专业用户表
DROP TABLE IF EXISTS T_PRO_USER;
CREATE TABLE WECHAT.T_PRO_USER
(
    C_ID                 VARCHAR(32)                          NOT NULL     COMMENT '用户ID',
    N_TYPE               INT                                  NOT NULL     COMMENT '类型',
    C_NAME               VARCHAR(100)                         NULL         COMMENT '实体名称',
    C_LOGIN              VARCHAR(45)                          NULL         COMMENT '登录名',
    C_PASSWORD           VARCHAR(45)                          NULL         COMMENT '密码',
    C_ZJLX               VARCHAR(50)                          NULL         COMMENT '证件类型',
    C_ZJHM               VARCHAR(100)                         NULL         COMMENT '证件号码',
    C_CZHM               VARCHAR(30)                          NULL         COMMENT '传真号码',
    C_DZYX               VARCHAR(150)                         NULL         COMMENT '电子邮箱',
    C_PHONE              VARCHAR(30)                          NULL         COMMENT '手机号码',
    C_ADDRESS            VARCHAR(200)                         NULL         COMMENT '联系地址',
    C_LXR                VARCHAR(60)                          NULL         COMMENT '联系人',
    D_CJSJ               DATETIME                             NOT NULL     COMMENT '创建时间',
    N_VERIFY             INT                                  NOT NULL     COMMENT '是否实名认证',
    N_YX                 INT                                  NULL         COMMENT '是否有效',
    D_UPDATE             DATETIME                             NULL         COMMENT '更新时间',
    N_CJFS               INT               DEFAULT 1          NULL         COMMENT '创建方式',
    N_HMD                INT 	           DEFAULT 2	      NULL 	       COMMENT '是否黑名单 1-是，2-否',
    D_LHSJ               DATETIME	                          NULL	       COMMENT '拉黑时间',
    C_DW_NAME            VARCHAR(300)                         NULL         COMMENT '单位名称',
    C_ZW                 VARCHAR(300)                         NULL         COMMENT '职务',
    N_XB                 INT                                  NULL         COMMENT '性别',
CONSTRAINT PK_PRO_USER PRIMARY KEY( C_ID )
) COMMENT = '专业用户表' ;

-- 专业用户每月登录次数信息表
DROP TABLE IF EXISTS T_LOGIN_MONTH_INFO;
CREATE TABLE WECHAT.T_LOGIN_MONTH_INFO
(
    C_ID                 VARCHAR(32)                          NOT NULL     COMMENT '登录信息ID',
    C_USER_ID              VARCHAR(32)                          NOT NULL     COMMENT '人员ID',
    N_NUM_PC             INT                                  NULL         COMMENT 'pc端登录次数',
    N_NUM_APP            INT                                  NULL         COMMENT 'app端登录次数',
    N_NUM_ZS             INT                                  NULL         COMMENT '登录总次数',
    N_NF                 INT                                  NULL         COMMENT '年份',
    N_YF                 INT                                  NULL         COMMENT '月份',
CONSTRAINT PK_PRO_USER PRIMARY KEY( C_ID )
) COMMENT = '专业用户每月登录次数信息表' ;

-- 用户手机验证码
DROP TABLE IF EXISTS T_PRO_SJYZM;
CREATE TABLE WECHAT.T_PRO_SJYZM
(
    C_BH                 VARCHAR(32)                          NOT NULL     COMMENT '编号',
    C_SJHM               VARCHAR(50)                          NULL         COMMENT '手机号码',
    C_YZM                VARCHAR(50)                          NULL         COMMENT '验证码',
    N_YT                 INT                                  NULL         COMMENT '用途',
    N_YX                 INT                                  NULL         COMMENT '是否有效',
    D_CJSJ               DATETIME                             NULL         COMMENT '创建时间',
    D_GQSJ               DATETIME                             NULL         COMMENT '过期时间',
    N_SCCS               INT                                  NULL         COMMENT '输错次数',
CONSTRAINT PK_PRO_SJYZM PRIMARY KEY( C_BH )
) COMMENT = '用户手机验证码' ;

-- 用户通知表
DROP TABLE IF EXISTS T_PRO_NOTICE;
CREATE TABLE WECHAT.T_PRO_NOTICE
(
    C_BH                 VARCHAR(32)                          NOT NULL     COMMENT '编号',
    N_JL_MK              INT                                  NULL         COMMENT '记录所属模块',
    C_JL_BH              VARCHAR(32)                          NULL         COMMENT '记录编号',
    C_PRO_USER_ID        VARCHAR(32)                          NULL         COMMENT '用户编号',
    N_READ               INT                                  NULL         COMMENT '是否已读',
    D_UPDATE             DATETIME                             NULL         COMMENT '更新时间',
CONSTRAINT PK_PRO_NOTICE PRIMARY KEY( C_BH )
) COMMENT = '用户通知表' ;


-- 系统用户表
DROP TABLE IF EXISTS T_SYS_USER;
CREATE TABLE WECHAT.T_SYS_USER
(
    C_ID                 VARCHAR(32)                          NOT NULL     COMMENT '用户ID',
    C_NAME               VARCHAR(100)                         NULL         COMMENT '名称',
    C_LOGIN              VARCHAR(45)                          NULL         COMMENT '登录名',
    C_PASSWORD           VARCHAR(45)                          NULL         COMMENT '密码',
    C_PHONE              VARCHAR(30)                          NULL         COMMENT '手机号码',
    C_ADDRESS            VARCHAR(200)                         NULL         COMMENT '联系地址',
    C_RIGHT              VARCHAR(10)                          NULL         COMMENT '管理员权限',
CONSTRAINT PK_SYS_USER PRIMARY KEY( C_ID )
) COMMENT = '系统用户表' ;

-- 角色
DROP TABLE IF EXISTS T_ROLE;
CREATE TABLE WECHAT.T_ROLE
(
    C_ID                 VARCHAR(32)                          NOT NULL     COMMENT '角色ID',
    C_NAME               VARCHAR(150)                         NULL         COMMENT '角色名称',
    C_DESCRIPT           VARCHAR(254)                         NULL         COMMENT '角色描述',
    N_ORDER              INT                                  NULL         COMMENT '显示顺序',
    C_RIGHT_PREFIX       VARCHAR(50)                          NULL         COMMENT '权限前缀',
CONSTRAINT PK_ROLE PRIMARY KEY( C_ID )
) COMMENT = '角色表' ;

-- 角色权限表
DROP TABLE IF EXISTS T_ROLE_RIGHT;
CREATE TABLE WECHAT.T_ROLE_RIGHT
(
    C_ID                 VARCHAR(32)                          NOT NULL     COMMENT '关系ID',
    C_ROLE_ID            VARCHAR(32)                          NULL         COMMENT '角色ID',
    C_RIGHT_KEY          VARCHAR(150)                         NULL         COMMENT '权限KEY',
    N_ORDER              INT                                  NULL         COMMENT '显示顺序',
CONSTRAINT PK_ROLE_RIGHT PRIMARY KEY( C_ID )
) COMMENT = '角色权限表' ;

-- 权限用户表
DROP TABLE IF EXISTS T_USER_RIGHT;
CREATE TABLE WECHAT.T_USER_RIGHT
(
    C_ID                 VARCHAR(32)                          NOT NULL     COMMENT '关系ID',
    C_USER_ID            VARCHAR(32)                          NOT NULL     COMMENT '用户ID',
    N_USER_TYPE          INT                                  NOT NULL     COMMENT '用户类型',
    N_TYPE               INT                                  NULL         COMMENT '类型',
    C_ROLE_ID            VARCHAR(32)                          NULL         COMMENT '角色ID',
    C_RIGHT_KEY          VARCHAR(150)                         NULL         COMMENT '权限KEY',
CONSTRAINT PK_USER_RIGHT PRIMARY KEY( C_ID )
) COMMENT = '权限用户表' ;

-- 用户消息表
DROP TABLE IF EXISTS T_USER_MESSAGE;
CREATE TABLE WECHAT.T_USER_MESSAGE
(
    N_ID                 BIGINT                               NOT NULL     COMMENT '消息ID',
    C_USER_ID            VARCHAR(32)                          NULL         COMMENT '用户ID',
    N_USER_TYPE          INT                                  NULL         COMMENT '用户类型',
    C_TITLE              VARCHAR(150)                         NULL         COMMENT '消息标题',
    C_CONTENT            VARCHAR(600)                         NULL         COMMENT '消息内容',
    D_CREATE             DATETIME                             NULL         COMMENT '创建时间',
    C_CREATOR            VARCHAR(100)                         NULL         COMMENT '创建者',
    N_STATUS             INT             DEFAULT 1            NULL         COMMENT '状态',
    D_UPDATE             DATETIME                             NULL         COMMENT '更新时间',
CONSTRAINT PK_USER_MESSAGE PRIMARY KEY( N_ID )
) COMMENT = '用户消息表' ;

-- 代码类型表
DROP TABLE IF EXISTS T_CODE_TYPE;
CREATE TABLE WECHAT.T_CODE_TYPE
(
    C_ID                 VARCHAR(50)                          NOT NULL     COMMENT '代码类型',
    C_NAME               VARCHAR(150)                         NOT NULL     COMMENT '代码类型名称',
    N_VALID              INT             DEFAULT 1            NOT NULL     COMMENT '是否有效',
CONSTRAINT PK_CODE_TYPE PRIMARY KEY( C_ID )
) COMMENT = '代码类型表' ;

-- 代码表
DROP TABLE IF EXISTS T_CODE;
CREATE TABLE WECHAT.T_CODE
(
    C_PID                VARCHAR(50)                          NOT NULL     COMMENT '代码类型',
    C_CODE               VARCHAR(50)                          NOT NULL     COMMENT '代码',
    C_NAME               VARCHAR(150)                         NOT NULL     COMMENT '代码名称',
    N_VALID              INT             DEFAULT 1            NOT NULL     COMMENT '是否有效',
    N_ORDER              INT                                  NULL         COMMENT '显示顺序',
    C_DMJP               VARCHAR(150)                         NULL         COMMENT '代码简拼',
CONSTRAINT PK_CODE PRIMARY KEY( C_PID,C_CODE )
) COMMENT = '代码表' ;

-- 系统配置表
DROP TABLE IF EXISTS T_SYS_CONFIG;
CREATE TABLE WECHAT.T_SYS_CONFIG
(
    C_ID                 VARCHAR(32)                          NOT NULL     COMMENT '配置ID',
    C_KEY                VARCHAR(100)                         NULL         COMMENT '属性名',
    C_VALUE              VARCHAR(5000)                        NULL         COMMENT '属性值',
    C_DESC               VARCHAR(400)                         NULL         COMMENT '描述',
CONSTRAINT PK_SYS_CONFIG PRIMARY KEY( C_ID )
) COMMENT = '系统配置表' ;


-- 缓存事件表
DROP TABLE IF EXISTS T_SYS_CACHE_EVENT;
CREATE TABLE WECHAT.T_SYS_CACHE_EVENT
(
    C_ID                 VARCHAR(32)                          NOT NULL     COMMENT '事件ID',
    C_CACHE_ID           VARCHAR(100)                         NULL         COMMENT '缓存ID',
    C_DESC               VARCHAR(400)                         NULL         COMMENT '描述',
    N_VERSION            BIGINT                               NULL         COMMENT '版本',
    D_UPDATE             DATETIME                             NULL         COMMENT '更新时间',
CONSTRAINT PK_SYS_CACHE_EVENT PRIMARY KEY( C_ID )
) COMMENT = '缓存事件表' ;

-- 发布版本信息表
DROP TABLE IF EXISTS T_VERSION;
CREATE TABLE WECHAT.T_VERSION
(
    N_ID                 INT                                  NOT NULL     COMMENT '主键',
    C_VERSION            VARCHAR(100)                         NOT NULL     COMMENT '版本名称',
    C_DESC               VARCHAR(225)                         NULL         COMMENT '版本描述',
CONSTRAINT PK_VERSION PRIMARY KEY( N_ID )
) COMMENT = '发布版本信息表' ;

-- 注册码
DROP TABLE IF EXISTS T_LICENSE;
CREATE TABLE WECHAT.T_LICENSE
(
    C_ID                 VARCHAR(32)                          NOT NULL     COMMENT '注册码ID',
    C_NAME               VARCHAR(100)                         NOT NULL     COMMENT '系统名称',
    C_LICENSE            VARCHAR(100)                         NULL         COMMENT '授权码',
    N_ORDER              INT                                  NULL         COMMENT '显示顺序',
CONSTRAINT PK_PROVINCE PRIMARY KEY( C_ID )
) COMMENT = '注册码表' ;



