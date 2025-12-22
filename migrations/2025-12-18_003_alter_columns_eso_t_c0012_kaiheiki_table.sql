
-- 2025-12-18_003_alter_columns_eso_t_c0012_kaiheiki.sql
-- 目的：ユーザーとユーザーのレコードフィールドを変更する
-- 更新日：2025-12-18
-- 更新者：ikou2027
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0012_kaiheiki
    ALTER COLUMN create_user TYPE VARCHAR(100),
    ALTER COLUMN create_user SET NOT NULL,

    ALTER COLUMN record_user TYPE VARCHAR(100),
    ALTER COLUMN record_user SET NOT NULL;

COMMIT;
