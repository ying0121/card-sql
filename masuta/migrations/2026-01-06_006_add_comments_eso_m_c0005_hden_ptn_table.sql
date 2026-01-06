
-- 2026-01-06_006_add_comments_eso_m_c0005_hden_ptn.sql
-- 目的：発電所パターンマスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0005_hden_ptn IS '発電所パターンマスタテーブル';

COMMENT ON COLUMN eso_m_c0005_hden_ptn.yobihatsu_hden_kbn_cd IS '予備発・発電所区分コード';
COMMENT ON COLUMN eso_m_c0005_hden_ptn.shiyo_keitai IS '使用形態';
COMMENT ON COLUMN eso_m_c0005_hden_ptn.hden_shurui IS '発電所種類';
COMMENT ON COLUMN eso_m_c0005_hden_ptn.gdo_shurui IS '原動機種類';
COMMENT ON COLUMN eso_m_c0005_hden_ptn.hsymbol_no IS '発電機シンボル番号';
COMMENT ON COLUMN eso_m_c0005_hden_ptn.gsymbol_no IS '原動機シンボル番号';
COMMENT ON COLUMN eso_m_c0005_hden_ptn.psymbol_no IS 'パワーコンディショナシンボル番号';
COMMENT ON COLUMN eso_m_c0005_hden_ptn.biko IS '備考';
COMMENT ON COLUMN eso_m_c0005_hden_ptn.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0005_hden_ptn.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0005_hden_ptn.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0005_hden_ptn.record_user IS '更新者';

COMMIT;

