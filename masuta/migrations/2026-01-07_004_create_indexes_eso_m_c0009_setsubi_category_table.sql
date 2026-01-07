
-- 2026-01-07_004_create_indexes_eso_m_c0009_setsubi_category.sql
-- 目的：設備カテゴリマスタテーブルにインデックスを作成
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
-- 設備種別とリスト表示順の組み合わせで検索する場合に使用
CREATE INDEX IF NOT EXISTS idx_eso_m_c0009_setsubi_category_shubetsu_order
    ON eso_m_c0009_setsubi_category (shubetsu_cd, order_jn);

COMMIT;

