
-- 2025-12-19_005_drop_column_eso_t_c0011_keiki.sql
-- 目的：計器類テーブルからKENMANカラムを削除
-- 更新日: 2025-12-19
-- 更新者: ikou2027
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0011_keiki
    DROP COLUMN IF EXISTS KENMAN;

COMMIT;

