
-- 2026-01-09_006_add_comments_eso_m_c0012_tekkyo.sql
-- 目的：撤去状態マスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0012_tekkyo IS '撤去状態マスタテーブル';

COMMENT ON COLUMN eso_m_c0012_tekkyo.jotai_flg IS '状態フラグ';
COMMENT ON COLUMN eso_m_c0012_tekkyo.jotai_nm IS '状態名称';
COMMENT ON COLUMN eso_m_c0012_tekkyo.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0012_tekkyo.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0012_tekkyo.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0012_tekkyo.record_user IS '更新者';

COMMIT;
