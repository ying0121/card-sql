
-- 2025-12-25_002_add_columns_eso_t_c0008_file_work.sql
-- 目的：編集ファイルテーブルに追加項目を追加
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0008_file_work
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100),
    ADD COLUMN IF NOT EXISTS record_user VARCHAR(100),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;


