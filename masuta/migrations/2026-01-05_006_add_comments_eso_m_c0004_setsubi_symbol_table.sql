
-- 2026-01-05_006_add_comments_eso_m_c0004_setsubi_symbol.sql
-- 目的：設備シンボルマスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0004_setsubi_symbol IS '設備シンボルマスタテーブル';

COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.shubetsu_cd IS '設備種別コード';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.symbol_no IS 'シンボル番号';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.master_bunrui IS 'コードマスタ大分類';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.master_cd IS 'コードマスタコード';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.symbol_scale IS 'シンボルスケール';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.category_cd IS 'カテゴリコード';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.order_jn IS 'リスト表示順';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.text_x IS '文字X座標';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.text_y IS '文字Y座標';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.text_size IS '文字サイズ';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.hyokimoji1 IS '表記文字１';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.hyokimoji2 IS '表記文字２';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.hyokimoji3 IS '表記文字３';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.symbol_muki IS 'シンボル向き';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.mask_flg IS 'マスクフラグ';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.zukei_type IS '図形タイプ';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.line_type IS '線種';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.line_width IS '線幅';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.line_color IS '線色';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.font IS 'フォント';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.limit_flg1 IS '制限フラグ１';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.upload_flg IS '配信フラグ';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.biko IS '備考';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0004_setsubi_symbol.record_user IS '更新者';

COMMIT;

