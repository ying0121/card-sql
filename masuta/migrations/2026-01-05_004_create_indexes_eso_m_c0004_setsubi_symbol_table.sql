
-- 2026-01-05_004_create_indexes_eso_m_c0004_setsubi_symbol.sql
-- 目的：設備シンボルマスタテーブルにインデックスを作成
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- shubetsu_cd にインデックスを作成（検索用）
CREATE INDEX IF NOT EXISTS idx_eso_m_c0004_setsubi_symbol_shubetsu_cd
    ON eso_m_c0004_setsubi_symbol (shubetsu_cd);

-- master_bunrui, master_cd にインデックスを作成（検索用）
CREATE INDEX IF NOT EXISTS idx_eso_m_c0004_setsubi_symbol_master
    ON eso_m_c0004_setsubi_symbol (master_bunrui, master_cd);

-- category_cd にインデックスを作成（検索用）
CREATE INDEX IF NOT EXISTS idx_eso_m_c0004_setsubi_symbol_category_cd
    ON eso_m_c0004_setsubi_symbol (category_cd);

-- order_jn にインデックスを作成（ソート用）
CREATE INDEX IF NOT EXISTS idx_eso_m_c0004_setsubi_symbol_order_jn
    ON eso_m_c0004_setsubi_symbol (order_jn);

COMMIT;

