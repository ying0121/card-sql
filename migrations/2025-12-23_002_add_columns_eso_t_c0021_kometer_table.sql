
-- 2025-12-23_002_add_columns_eso_t_c0021_kometer.sql
-- 目的：子メーターテーブルに追加項目を追加
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0021_kometer
    ADD COLUMN IF NOT EXISTS meter_yuko_ym_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS ct_yuko_ym_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS seizosha_jiyunyuryoku VARCHAR(32),
    ADD COLUMN IF NOT EXISTS seizosha_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS katashiki_gaitonashi_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS katashiki_jiyunyuryoku VARCHAR(32),
    ADD COLUMN IF NOT EXISTS katashiki_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256);

COMMIT;

