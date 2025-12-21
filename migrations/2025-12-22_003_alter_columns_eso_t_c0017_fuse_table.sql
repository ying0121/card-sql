
-- 2025-12-22_003_alter_columns_eso_t_c0017_fuse.sql
-- 目的：ユーザーとユーザーのレコードフィールドを変更する
-- 作成日：2025-12-22
-- 作成者：浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0017_fuse
    ALTER COLUMN create_user TYPE VARCHAR(100),
    ALTER COLUMN create_user SET NOT NULL,

    ALTER COLUMN record_user TYPE VARCHAR(100),
    ALTER COLUMN record_user SET NOT NULL;

COMMIT;

