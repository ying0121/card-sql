
-- 2025-12-26_004_create_indexes_eso_m_c0001_cdmast.sql
-- 目的：コードマスタテーブルにインデックスを作成
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_m_c0001_cdmast_daibunrui_ordr
    ON eso_m_c0001_cdmast (daibunrui_cd, ordr_jn);

COMMIT;

