
-- 2025-12-26_005_drop_column_eso_m_c0001_cdmast.sql
-- 目的：コードマスタテーブルからMASKカラムを削除
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_m_c0001_cdmast
    DROP COLUMN IF EXISTS MASK;

COMMIT;

