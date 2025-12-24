
-- 2025-12-24_update_eso_t_c0007_image.sql
-- 目的：画像情報更新
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_image AS
-- UPDATE eso_t_c0007_image SET image_kbn_su = $3, shikibetsu_id = $4, zumen_id = $5,
--     title_mj = $6, ordr_jn = $7, file_name_mj = $8,
--     record_date = now(), record_user = $9, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND image_id = $2;
--
-- EXECUTE update_image('1234567890', 'image001', 2, 'shiki002', 12345679, 'タイトル2', 2, 'file2.jpg', 'user002');

UPDATE eso_t_c0007_image
SET
    image_kbn_su                  = $3,
    shikibetsu_id                 = $4,
    zumen_id                       = $5,
    title_mj                       = $6,
    ordr_jn                        = $7,
    file_name_mj                   = $8,
    record_date                    = now(),
    record_user                    = $9,
    shinki_koushin_sakujo_flg     = 1 -- 1：更新
WHERE
    okyaku_id = $1
AND image_id  = $2;

