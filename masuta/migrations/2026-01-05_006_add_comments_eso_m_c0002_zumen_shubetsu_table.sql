
-- 2026-01-05_006_add_comments_eso_m_c0002_zumen_shubetsu.sql
-- 目的：図面種別マスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0002_zumen_shubetsu IS '図面種別マスタテーブル';

COMMENT ON COLUMN eso_m_c0002_zumen_shubetsu.zumen_cd IS '図面コード';
COMMENT ON COLUMN eso_m_c0002_zumen_shubetsu.zumen_nm IS '図面名称';
COMMENT ON COLUMN eso_m_c0002_zumen_shubetsu.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0002_zumen_shubetsu.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0002_zumen_shubetsu.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0002_zumen_shubetsu.record_user IS '更新者';

COMMIT;

