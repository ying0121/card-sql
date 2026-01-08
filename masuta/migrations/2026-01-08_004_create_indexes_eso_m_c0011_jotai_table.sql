
-- 2026-01-08_004_create_indexes_eso_m_c0011_jotai.sql
-- 目的：機器使用状態マスタテーブルにインデックスを作成
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- WHERE句で使用されるカラムにインデックスを作成
-- 登録バージョンで検索する場合に使用
CREATE INDEX IF NOT EXISTS idx_eso_m_c0011_jotai_jotai_flg
    ON eso_m_c0011_jotai (jotai_flg);

COMMIT;
