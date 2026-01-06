
-- 2026-01-06_004_create_indexes_eso_m_c0007_ssym_category.sql
-- 目的：セットシンボルカテゴリマスタテーブルにインデックスを作成
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
-- 図面種別とリスト表示順の組み合わせで検索する場合に使用
CREATE INDEX IF NOT EXISTS idx_eso_m_c0007_ssym_category_zumen_order
    ON eso_m_c0007_ssym_category (zumen_kind, order_jn);

COMMIT;

