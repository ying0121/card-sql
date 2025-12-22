
-- 2025-12-19_003_alter_columns_eso_t_c0015_keidenki.sql
-- 目的：計電器テーブルのユーザーとユーザーのレコードフィールドを変更する
-- 更新日：2025-12-19
-- 更新者：ikou2027
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0015_keidenki
    ALTER COLUMN create_user TYPE VARCHAR(100),
    ALTER COLUMN create_user SET NOT NULL,

    ALTER COLUMN record_user TYPE VARCHAR(100),
    ALTER COLUMN record_user SET NOT NULL;

COMMIT;

