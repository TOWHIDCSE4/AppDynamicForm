/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.6.84
 Source Server Type    : PostgreSQL
 Source Server Version : 110010
 Source Host           : 192.168.6.84:5432
 Source Catalog        : app_platform
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110010
 File Encoding         : 65001

 Date: 26/12/2022 16:10:26
*/


-- ----------------------------
-- Sequence structure for companies_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."companies_id_seq";
CREATE SEQUENCE "public"."companies_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for document_templates_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."document_templates_id_seq";
CREATE SEQUENCE "public"."document_templates_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for documents_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."documents_id_seq";
CREATE SEQUENCE "public"."documents_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
CREATE SEQUENCE "public"."migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_lock_index_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_lock_index_seq";
CREATE SEQUENCE "public"."migrations_lock_index_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permissions_id_seq";
CREATE SEQUENCE "public"."permissions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."role_permissions_id_seq";
CREATE SEQUENCE "public"."role_permissions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for roles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."roles_id_seq";
CREATE SEQUENCE "public"."roles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS "public"."companies";
CREATE TABLE "public"."companies" (
  "id" int4 NOT NULL DEFAULT nextval('companies_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "sector" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "image" varchar(255) COLLATE "pg_catalog"."default",
  "phoneNumber" int4,
  "streetAddress" varchar(255) COLLATE "pg_catalog"."default",
  "appartmentNumber" int4,
  "zipCode" int4,
  "state" varchar(255) COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of companies
-- ----------------------------

-- ----------------------------
-- Table structure for document_templates
-- ----------------------------
DROP TABLE IF EXISTS "public"."document_templates";
CREATE TABLE "public"."document_templates" (
  "id" int4 NOT NULL DEFAULT nextval('document_templates_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "content" jsonb,
  "locale" varchar(255) COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "createdBy" int4,
  "updatedBy" int4
)
;

-- ----------------------------
-- Records of document_templates
-- ----------------------------

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS "public"."documents";
CREATE TABLE "public"."documents" (
  "id" int4 NOT NULL DEFAULT nextval('documents_id_seq'::regclass),
  "formId" varchar(255) COLLATE "pg_catalog"."default",
  "formName" varchar(255) COLLATE "pg_catalog"."default",
  "issuedBy" varchar(255) COLLATE "pg_catalog"."default",
  "issuedDate" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "submitter" varchar(255) COLLATE "pg_catalog"."default",
  "company" varchar(255) COLLATE "pg_catalog"."default",
  "tenant" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "documentTemplateId" int4,
  "updatedDate" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "createdBy" int4,
  "updatedBy" int4
)
;

-- ----------------------------
-- Records of documents
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations";
CREATE TABLE "public"."migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "batch" int4,
  "migration_time" timestamptz(6)
)
;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO "public"."migrations" VALUES (66, '20220609064429_create_roles_table.js', 1, '2022-12-26 15:30:13.869+07');
INSERT INTO "public"."migrations" VALUES (67, '20220609064908_create_users_table.js', 1, '2022-12-26 15:30:14.054+07');
INSERT INTO "public"."migrations" VALUES (68, '20220609072939_create_permissions_table.js', 1, '2022-12-26 15:30:14.157+07');
INSERT INTO "public"."migrations" VALUES (69, '20220609073000_create_role_permissions_table.js', 1, '2022-12-26 15:30:14.283+07');
INSERT INTO "public"."migrations" VALUES (70, '20221213024147_add_col_code_to_role.js', 1, '2022-12-26 15:30:14.309+07');
INSERT INTO "public"."migrations" VALUES (71, '20221213024556_add_col_code_to_used.js', 1, '2022-12-26 15:30:14.316+07');
INSERT INTO "public"."migrations" VALUES (72, '20221223045840_create_companies_table.js', 1, '2022-12-26 15:30:14.375+07');
INSERT INTO "public"."migrations" VALUES (73, '20221223083153_create_document_templates_table.js', 1, '2022-12-26 15:30:14.511+07');
INSERT INTO "public"."migrations" VALUES (74, '20221226082753_create_documents_table.js', 1, '2022-12-26 15:30:14.661+07');

-- ----------------------------
-- Table structure for migrations_lock
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations_lock";
CREATE TABLE "public"."migrations_lock" (
  "index" int4 NOT NULL DEFAULT nextval('migrations_lock_index_seq'::regclass),
  "is_locked" int4
)
;

-- ----------------------------
-- Records of migrations_lock
-- ----------------------------
INSERT INTO "public"."migrations_lock" VALUES (2, 0);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."permissions";
CREATE TABLE "public"."permissions" (
  "id" int4 NOT NULL DEFAULT nextval('permissions_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "value" int4 DEFAULT 0,
  "key" varchar(255) COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "createdBy" int4
)
;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO "public"."permissions" VALUES (1, 'root', 'root', 15, 'root', '2022-12-26 15:35:27.068764+07', '2022-12-26 15:35:27.068764+07', NULL);
INSERT INTO "public"."permissions" VALUES (2, 'users', 'users', 15, 'users', '2022-12-26 15:35:27.068764+07', '2022-12-26 15:35:27.068764+07', NULL);
INSERT INTO "public"."permissions" VALUES (3, 'roles', 'roles', 15, 'roles', '2022-12-26 15:35:27.068764+07', '2022-12-26 15:35:27.068764+07', NULL);
INSERT INTO "public"."permissions" VALUES (4, 'adminDecentralization', 'adminDecentralization', 2, 'adminDecentralization', '2022-12-26 15:35:27.068764+07', '2022-12-26 15:35:27.068764+07', NULL);
INSERT INTO "public"."permissions" VALUES (5, 'dashboard', 'dashboard', 4, 'dashboard', '2022-12-26 15:35:27.068764+07', '2022-12-26 15:35:27.068764+07', NULL);

-- ----------------------------
-- Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."role_permissions";
CREATE TABLE "public"."role_permissions" (
  "id" int4 NOT NULL DEFAULT nextval('role_permissions_id_seq'::regclass),
  "roleId" int4 NOT NULL,
  "permissionId" int4,
  "value" int4 DEFAULT 0,
  "key" varchar(255) COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "createdBy" int4
)
;

-- ----------------------------
-- Records of role_permissions
-- ----------------------------
INSERT INTO "public"."role_permissions" VALUES (1, 1, 1, 15, 'root', '2022-12-26 15:35:27.086331+07', NULL);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles";
CREATE TABLE "public"."roles" (
  "id" int4 NOT NULL DEFAULT nextval('roles_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "parentId" int4,
  "key" varchar(255) COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "createdBy" int4,
  "updatedBy" int4,
  "code" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."roles"."code" IS 'code generated from id';

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "public"."roles" VALUES (1, 'Root', 'Root', NULL, 'root', '2022-12-26 15:35:27.003313+07', '2022-12-26 15:35:27.003313+07', NULL, NULL, '5c5652e878449245a480bb2ded80fadd');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "username" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "firstName" varchar(255) COLLATE "pg_catalog"."default",
  "lastName" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "image" varchar(255) COLLATE "pg_catalog"."default",
  "dateOfBirth" timestamptz(6),
  "phoneNumber" int4,
  "streetAddress" varchar(255) COLLATE "pg_catalog"."default",
  "appartmentNumber" int4,
  "zipCode" int4,
  "state" varchar(255) COLLATE "pg_catalog"."default",
  "roleId" int4,
  "createdAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "createdBy" int4,
  "updatedBy" int4,
  "code" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."users"."code" IS 'code generated from id';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES (1, 'root', '$2b$10$iNT.d38.rdsRvRMU95WTSu0ZMUBi/Dbwsrzw7yu0vT60T9EPu8eNi', 'root', 'towhi', 'tow@gmail.com', '', '1989-10-10 00:00:00+07', 101225555, 'Hanoi my 10122', 15558562, 8555, 'hanoi', 1, '2022-12-26 15:35:27.020312+07', '2022-12-26 15:35:27.020312+07', NULL, NULL, '5c5652e878449245a480bb2ded80fadd');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."companies_id_seq"
OWNED BY "public"."companies"."id";
SELECT setval('"public"."companies_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."document_templates_id_seq"
OWNED BY "public"."document_templates"."id";
SELECT setval('"public"."document_templates_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."documents_id_seq"
OWNED BY "public"."documents"."id";
SELECT setval('"public"."documents_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_id_seq"
OWNED BY "public"."migrations"."id";
SELECT setval('"public"."migrations_id_seq"', 75, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_lock_index_seq"
OWNED BY "public"."migrations_lock"."index";
SELECT setval('"public"."migrations_lock_index_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."permissions_id_seq"
OWNED BY "public"."permissions"."id";
SELECT setval('"public"."permissions_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."role_permissions_id_seq"
OWNED BY "public"."role_permissions"."id";
SELECT setval('"public"."role_permissions_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."roles_id_seq"
OWNED BY "public"."roles"."id";
SELECT setval('"public"."roles_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 2, true);

-- ----------------------------
-- Primary Key structure for table companies
-- ----------------------------
ALTER TABLE "public"."companies" ADD CONSTRAINT "companies_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table document_templates
-- ----------------------------
CREATE INDEX "document_templates_createdby_index" ON "public"."document_templates" USING btree (
  "createdBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "document_templates_updatedby_index" ON "public"."document_templates" USING btree (
  "updatedBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table document_templates
-- ----------------------------
ALTER TABLE "public"."document_templates" ADD CONSTRAINT "document_templates_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table documents
-- ----------------------------
CREATE INDEX "documents_createdby_index" ON "public"."documents" USING btree (
  "createdBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "documents_documenttemplateid_index" ON "public"."documents" USING btree (
  "documentTemplateId" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "documents_updatedby_index" ON "public"."documents" USING btree (
  "updatedBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table documents
-- ----------------------------
ALTER TABLE "public"."documents" ADD CONSTRAINT "documents_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "public"."migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table migrations_lock
-- ----------------------------
ALTER TABLE "public"."migrations_lock" ADD CONSTRAINT "migrations_lock_pkey" PRIMARY KEY ("index");

-- ----------------------------
-- Indexes structure for table permissions
-- ----------------------------
CREATE INDEX "permissions_createdby_index" ON "public"."permissions" USING btree (
  "createdBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table role_permissions
-- ----------------------------
CREATE INDEX "role_permissions_createdby_index" ON "public"."role_permissions" USING btree (
  "createdBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "role_permissions_permissionid_index" ON "public"."role_permissions" USING btree (
  "permissionId" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "role_permissions_roleid_index" ON "public"."role_permissions" USING btree (
  "roleId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table role_permissions
-- ----------------------------
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "role_permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table roles
-- ----------------------------
CREATE INDEX "roles_createdby_index" ON "public"."roles" USING btree (
  "createdBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "roles_updatedby_index" ON "public"."roles" USING btree (
  "updatedBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table users
-- ----------------------------
CREATE INDEX "users_createdby_index" ON "public"."users" USING btree (
  "createdBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "users_roleid_index" ON "public"."users" USING btree (
  "roleId" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "users_updatedby_index" ON "public"."users" USING btree (
  "updatedBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table document_templates
-- ----------------------------
ALTER TABLE "public"."document_templates" ADD CONSTRAINT "document_templates_createdby_foreign" FOREIGN KEY ("createdBy") REFERENCES "public"."users" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."document_templates" ADD CONSTRAINT "document_templates_updatedby_foreign" FOREIGN KEY ("updatedBy") REFERENCES "public"."users" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table documents
-- ----------------------------
ALTER TABLE "public"."documents" ADD CONSTRAINT "documents_createdby_foreign" FOREIGN KEY ("createdBy") REFERENCES "public"."documents" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."documents" ADD CONSTRAINT "documents_documenttemplateid_foreign" FOREIGN KEY ("documentTemplateId") REFERENCES "public"."document_templates" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."documents" ADD CONSTRAINT "documents_updatedby_foreign" FOREIGN KEY ("updatedBy") REFERENCES "public"."documents" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "permissions_createdby_foreign" FOREIGN KEY ("createdBy") REFERENCES "public"."users" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table role_permissions
-- ----------------------------
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "role_permissions_createdby_foreign" FOREIGN KEY ("createdBy") REFERENCES "public"."users" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "role_permissions_permissionid_foreign" FOREIGN KEY ("permissionId") REFERENCES "public"."permissions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "role_permissions_roleid_foreign" FOREIGN KEY ("roleId") REFERENCES "public"."roles" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_createdby_foreign" FOREIGN KEY ("createdBy") REFERENCES "public"."roles" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_updatedby_foreign" FOREIGN KEY ("updatedBy") REFERENCES "public"."roles" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_createdby_foreign" FOREIGN KEY ("createdBy") REFERENCES "public"."users" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."users" ADD CONSTRAINT "users_roleid_foreign" FOREIGN KEY ("roleId") REFERENCES "public"."roles" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."users" ADD CONSTRAINT "users_updatedby_foreign" FOREIGN KEY ("updatedBy") REFERENCES "public"."users" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
