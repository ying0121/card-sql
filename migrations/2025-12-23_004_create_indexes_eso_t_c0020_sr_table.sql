
-- 2025-12-23_004_create_indexes_eso_t_c0020_sr.sql
-- 目的：低圧リアクトルテーブルにインデックスを作成
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0020_sr_okyaku_zumen_flg_ordr
    ON eso_t_c0020_sr (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;


