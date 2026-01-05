
-- 2026-01-05_004_create_indexes_eso_m_c0002_zumen_shubetsu.sql
-- 目的：図面種別マスタテーブルにインデックスを作成
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- zumen_nm にインデックスを作成（検索用）
CREATE INDEX IF NOT EXISTS idx_eso_m_c0002_zumen_shubetsu_zumen_nm
    ON eso_m_c0002_zumen_shubetsu (zumen_nm);

COMMIT;

