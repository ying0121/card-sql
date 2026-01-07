
-- 2026-01-07_006_add_comments_eso_m_c0008_ptn_category.sql
-- 目的：図面パターンカテゴリマスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0008_ptn_category IS '図面パターンカテゴリマスタテーブル';

COMMENT ON COLUMN eso_m_c0008_ptn_category.category1_cd IS 'カテゴリコード1';
COMMENT ON COLUMN eso_m_c0008_ptn_category.category2_cd IS 'カテゴリコード2';
COMMENT ON COLUMN eso_m_c0008_ptn_category.category3_cd IS 'カテゴリコード3';
COMMENT ON COLUMN eso_m_c0008_ptn_category.category_nm IS 'カテゴリ名称';
COMMENT ON COLUMN eso_m_c0008_ptn_category.zumen_kind IS '図面種別';
COMMENT ON COLUMN eso_m_c0008_ptn_category.order_jn IS 'リスト表示順';
COMMENT ON COLUMN eso_m_c0008_ptn_category.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0008_ptn_category.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0008_ptn_category.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0008_ptn_category.record_user IS '更新者';

COMMIT;

