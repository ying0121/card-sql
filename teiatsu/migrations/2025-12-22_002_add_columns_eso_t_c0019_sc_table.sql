
-- 2025-12-22_002_add_columns_eso_t_c0019_sc.sql
-- 目的：低圧コンデンサテーブルに追加項目を追加
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0019_sc
    ADD COLUMN IF NOT EXISTS genba_kakuninzumi_meibanto_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS tkaku_kva_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS seizo_ym_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;

