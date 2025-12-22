
-- 2025-12-23_003_alter_columns_eso_t_c0021_kometer.sql
-- 目的：ユーザーとユーザーのレコードフィールドを変更する
-- 更新日：2025-12-23
-- 更新者：ikou2027
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0021_kometer
    ALTER COLUMN create_user TYPE VARCHAR(100),
    ALTER COLUMN create_user SET NOT NULL,

    ALTER COLUMN record_user TYPE VARCHAR(100),
    ALTER COLUMN record_user SET NOT NULL;

COMMIT;

