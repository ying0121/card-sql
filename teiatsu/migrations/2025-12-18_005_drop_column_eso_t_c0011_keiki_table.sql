
-- 2025-12-18_005_drop_column_eso_t_c0011_keiki.sql
-- 目的：計器類テーブルからKENMANカラムを削除
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0011_keiki
    DROP COLUMN IF EXISTS KENMAN;

COMMIT;

