
-- 2026-01-05_005_drop_column_eso_m_c0002_zumen_shubetsu.sql
-- 目的：図面種別マスタテーブルからカラムを削除
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- FILING_CATEGORY を削除
ALTER TABLE eso_m_c0002_zumen_shubetsu
    DROP COLUMN IF EXISTS FILING_CATEGORY;

-- SVG_TMP_PATH を削除
ALTER TABLE eso_m_c0002_zumen_shubetsu
    DROP COLUMN IF EXISTS SVG_TMP_PATH;

COMMIT;

