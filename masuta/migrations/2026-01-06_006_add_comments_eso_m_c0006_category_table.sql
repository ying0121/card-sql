
-- 2026-01-06_006_add_comments_eso_m_c0006_category.sql
-- 目的：カテゴリマスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0006_category IS 'カテゴリマスタテーブル';

COMMENT ON COLUMN eso_m_c0006_category.category_cd IS 'カテゴリコード';
COMMENT ON COLUMN eso_m_c0006_category.category_nm IS 'カテゴリ名称';
COMMENT ON COLUMN eso_m_c0006_category.zumen_cd IS '図面種別';
COMMENT ON COLUMN eso_m_c0006_category.order_jn IS 'リスト表示順';
COMMENT ON COLUMN eso_m_c0006_category.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0006_category.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0006_category.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0006_category.record_user IS '更新者';

COMMIT;

