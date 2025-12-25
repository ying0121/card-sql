
-- 2025-12-18_004_create_indexes_eso_t_c0013_cable.sql
-- 目的：低圧ケーブルテーブルにインデックスを作成
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
-- ORDER BYが setsubi_id, kotai_id, daisu_renban なので、それらも含める
CREATE INDEX IF NOT EXISTS idx_eso_t_c0013_cable_okyaku_zumen_flg_setsubi_kotai_daisu
    ON eso_t_c0013_cable (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, setsubi_id, kotai_id, daisu_renban);

COMMIT;

