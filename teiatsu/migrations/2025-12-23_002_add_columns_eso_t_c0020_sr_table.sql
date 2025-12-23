
-- 2025-12-23_002_add_columns_eso_t_c0020_sr.sql
-- 目的：低圧リアクトルテーブルに追加項目を追加
-- 更新日: 2025-12-23
-- 更新者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0020_sr
    ADD COLUMN IF NOT EXISTS genba_kakuninzumi_meibanto_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS shurui_cd CHARACTER(2),
    ADD COLUMN IF NOT EXISTS tkaku_kva_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS seizo_ym_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;

