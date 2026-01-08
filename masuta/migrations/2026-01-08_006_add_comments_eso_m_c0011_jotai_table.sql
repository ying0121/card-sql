
-- 2026-01-08_006_add_comments_eso_m_c0011_jotai.sql
-- 目的：機器使用状態マスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0011_jotai IS '機器使用状態マスタテーブル';

COMMENT ON COLUMN eso_m_c0011_jotai.jotai_flg IS '状態フラグ';
COMMENT ON COLUMN eso_m_c0011_jotai.jotai_nm IS '状態名称';
COMMENT ON COLUMN eso_m_c0011_jotai.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0011_jotai.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0011_jotai.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0011_jotai.record_user IS '更新者';

COMMIT;
