
-- 2025-12-19_005_drop_column_eso_t_c0012_kaiheiki.sql
-- 目的：低圧開閉器(低圧)テーブルからSYMBOL_MUKIカラムを削除
-- 更新日: 2025-12-19
-- 更新者: ikou2027
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0012_kaiheiki
    DROP COLUMN IF EXISTS SYMBOL_MUKI;

COMMIT;

