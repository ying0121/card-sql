
-- 2026-01-09_006_add_comments_eso_m_c0015_katashiki.sql
-- 目的：型式マスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0015_katashiki IS '型式マスタテーブル';

COMMENT ON COLUMN eso_m_c0015_katashiki.shubetsu_cd IS '設備種別CD';
COMMENT ON COLUMN eso_m_c0015_katashiki.shurui_cd IS '種類CD';
COMMENT ON COLUMN eso_m_c0015_katashiki.seizosha_cd IS '製造者CD';
COMMENT ON COLUMN eso_m_c0015_katashiki.katashiki_cd IS '型式CD';
COMMENT ON COLUMN eso_m_c0015_katashiki.katasiki_nm IS '型式名';
COMMENT ON COLUMN eso_m_c0015_katashiki.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0015_katashiki.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0015_katashiki.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0015_katashiki.record_user IS '更新者';

COMMIT;
