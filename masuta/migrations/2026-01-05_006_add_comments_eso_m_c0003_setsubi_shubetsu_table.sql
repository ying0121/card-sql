
-- 2026-01-05_006_add_comments_eso_m_c0003_setsubi_shubetsu.sql
-- 目的：設備種別マスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0003_setsubi_shubetsu IS '設備種別マスタテーブル';

COMMENT ON COLUMN eso_m_c0003_setsubi_shubetsu.shubetsu_cd IS '種別コード';
COMMENT ON COLUMN eso_m_c0003_setsubi_shubetsu.shubetsu_nm IS '種別名称';
COMMENT ON COLUMN eso_m_c0003_setsubi_shubetsu.table_nm IS 'テーブル名称';
COMMENT ON COLUMN eso_m_c0003_setsubi_shubetsu.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0003_setsubi_shubetsu.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0003_setsubi_shubetsu.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0003_setsubi_shubetsu.record_user IS '更新者';

COMMIT;

