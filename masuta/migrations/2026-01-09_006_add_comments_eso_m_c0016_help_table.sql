
-- 2026-01-09_006_add_comments_eso_m_c0016_help.sql
-- 目的：設備管理ヘルプマスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0016_help IS '設備管理ヘルプマスタテーブル';

COMMENT ON COLUMN eso_m_c0016_help.help_id IS 'ヘルプID';
COMMENT ON COLUMN eso_m_c0016_help.shubetsu_cd IS '設備種別コード';
COMMENT ON COLUMN eso_m_c0016_help.gamen_id IS '画面ID';
COMMENT ON COLUMN eso_m_c0016_help.gamen_nm IS '画面名';
COMMENT ON COLUMN eso_m_c0016_help.gamen_koumoku_id IS '画面項目ID';
COMMENT ON COLUMN eso_m_c0016_help.gamen_koumoku_nm IS '画面項目名';
COMMENT ON COLUMN eso_m_c0016_help.help_naiyo_mj IS 'ヘルプ内容';
COMMENT ON COLUMN eso_m_c0016_help.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0016_help.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0016_help.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0016_help.record_user IS '更新者';

COMMIT;
