
-- 2025-12-22_002_add_columns_eso_t_c0017_fuse.sql
-- 目的：低圧ヒューズテーブルに追加項目を追加
-- 更新日: 2025-12-22
-- 更新者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0017_fuse
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;

