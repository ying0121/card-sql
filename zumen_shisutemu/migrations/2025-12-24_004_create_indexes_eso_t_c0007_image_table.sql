
-- 2025-12-24_004_create_indexes_eso_t_c0007_image.sql
-- 目的：画像情報テーブルにインデックスを作成
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0007_image_okyaku_flg
    ON eso_t_c0007_image (okyaku_id, shinki_koushin_sakujo_flg);

COMMIT;


