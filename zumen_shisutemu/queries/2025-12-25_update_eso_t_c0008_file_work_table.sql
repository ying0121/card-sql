
-- 2025-12-25_update_eso_t_c0008_file_work.sql
-- 目的：編集画像更新
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_file_work AS
-- UPDATE eso_t_c0008_file_work SET image_kbn_su = $4, shikibetsu_id = $5, zumen_id = $6,
--     title_mj = $7, ordr_jn = $8, file_kbn_mj = $9, file_name_mj = $10, file_binary_byt = $11,
--     record_date = now(), record_user = $12, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND image_id = $2 AND lock_flg = $3;
--
-- EXECUTE update_file_work('1234567890', 'image001', 1, 2, 'shiki002', 12345679, 'タイトル2', 2, 'B', 'file2.jpg', NULL, 'user002');

UPDATE eso_t_c0008_file_work
SET
    image_kbn_su                  = $4,
    shikibetsu_id                 = $5,
    zumen_id                       = $6,
    title_mj                       = $7,
    ordr_jn                        = $8,
    file_kbn_mj                    = $9,
    file_name_mj                   = $10,
    file_binary_byt                = $11,
    record_date                    = now(),
    record_user                    = $12,
    shinki_koushin_sakujo_flg     = 1 -- 1：更新
WHERE
    okyaku_id = $1
AND image_id  = $2
AND lock_flg  = $3;

