
-- 2025-12-25_005_drop_column_eso_t_c0009_numbering.sql
-- 目的：採番テーブルからKYOKAI_CDカラムを削除
-- 更新日: 2025-12-25
-- 更新者: ikou2027
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0009_numbering
    DROP COLUMN IF EXISTS KYOKAI_CD;

COMMIT;


