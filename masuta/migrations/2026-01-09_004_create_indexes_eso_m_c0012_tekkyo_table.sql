
-- 2026-01-09_004_create_indexes_eso_m_c0012_tekkyo.sql
-- 目的：撤去状態マスタテーブルにインデックスを作成
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- WHERE句で使用されるカラムにインデックスを作成
-- 状態フラグで検索する場合に使用
CREATE INDEX IF NOT EXISTS idx_eso_m_c0012_tekkyo_jotai_flg
    ON eso_m_c0012_tekkyo (jotai_flg);

COMMIT;
