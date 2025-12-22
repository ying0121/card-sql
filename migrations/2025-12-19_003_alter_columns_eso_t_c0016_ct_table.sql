
-- 2025-12-19_003_alter_columns_eso_t_c0016_ct.sql
-- 目的：低圧変流器テーブルのユーザーとユーザーのレコードフィールドを変更する
-- 更新日：2025-12-19
-- 更新者：ikou2027
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0016_ct
    ALTER COLUMN create_user TYPE VARCHAR(100),
    ALTER COLUMN create_user SET NOT NULL,

    ALTER COLUMN record_user TYPE VARCHAR(100),
    ALTER COLUMN record_user SET NOT NULL;

COMMIT;

