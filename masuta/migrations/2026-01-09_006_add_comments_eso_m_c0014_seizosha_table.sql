
-- 2026-01-09_006_add_comments_eso_m_c0014_seizosha.sql
-- 目的：製造者マスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0014_seizosha IS '製造者マスタテーブル';

COMMENT ON COLUMN eso_m_c0014_seizosha.shubetsu_cd IS '設備種別CD';
COMMENT ON COLUMN eso_m_c0014_seizosha.shurui_cd IS '種類CD';
COMMENT ON COLUMN eso_m_c0014_seizosha.seizosha_cd IS '製造者CD';
COMMENT ON COLUMN eso_m_c0014_seizosha.seizosha_nm IS '製造者名';
COMMENT ON COLUMN eso_m_c0014_seizosha.seizosha_kana_nm IS '製造者名かな';
COMMENT ON COLUMN eso_m_c0014_seizosha.seizosha_ryaku_nm IS '製造者略称';
COMMENT ON COLUMN eso_m_c0014_seizosha.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0014_seizosha.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0014_seizosha.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0014_seizosha.record_user IS '更新者';

COMMIT;
