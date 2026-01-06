
-- 2026-01-06_006_add_comments_eso_m_c0007_ssym_category.sql
-- 目的：セットシンボルカテゴリマスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0007_ssym_category IS 'セットシンボルカテゴリマスタテーブル';

COMMENT ON COLUMN eso_m_c0007_ssym_category.category1_cd IS 'カテゴリコード1';
COMMENT ON COLUMN eso_m_c0007_ssym_category.category2_cd IS 'カテゴリコード2';
COMMENT ON COLUMN eso_m_c0007_ssym_category.category3_cd IS 'カテゴリコード3';
COMMENT ON COLUMN eso_m_c0007_ssym_category.category_nm IS 'カテゴリ名称';
COMMENT ON COLUMN eso_m_c0007_ssym_category.zumen_kind IS '図面種別';
COMMENT ON COLUMN eso_m_c0007_ssym_category.order_jn IS 'リスト表示順';
COMMENT ON COLUMN eso_m_c0007_ssym_category.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0007_ssym_category.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0007_ssym_category.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0007_ssym_category.record_user IS '更新者';

COMMIT;

