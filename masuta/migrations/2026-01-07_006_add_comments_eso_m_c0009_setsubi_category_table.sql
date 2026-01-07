
-- 2026-01-07_006_add_comments_eso_m_c0009_setsubi_category.sql
-- 目的：設備カテゴリマスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0009_setsubi_category IS '設備カテゴリマスタテーブル';

COMMENT ON COLUMN eso_m_c0009_setsubi_category.category_cd IS 'カテゴリコード';
COMMENT ON COLUMN eso_m_c0009_setsubi_category.shubetsu_cd IS '設備種別';
COMMENT ON COLUMN eso_m_c0009_setsubi_category.category_nm IS 'カテゴリ名称';
COMMENT ON COLUMN eso_m_c0009_setsubi_category.category_mask IS 'カテゴリマスク';
COMMENT ON COLUMN eso_m_c0009_setsubi_category.order_jn IS 'リスト表示順';
COMMENT ON COLUMN eso_m_c0009_setsubi_category.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0009_setsubi_category.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0009_setsubi_category.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0009_setsubi_category.record_user IS '更新者';

COMMIT;

