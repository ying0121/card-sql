
-- 2025-12-24_002_add_columns_eso_t_c0006_okyaku_work.sql
-- 目的：ＣＡＤ編集お客様管理テーブルに追加項目を追加
-- 更新日: 2025-12-24
-- 更新者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0006_okyaku_work
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100),
    ADD COLUMN IF NOT EXISTS record_user VARCHAR(100),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;

