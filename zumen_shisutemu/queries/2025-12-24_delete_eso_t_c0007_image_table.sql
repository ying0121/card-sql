
-- 2025-12-24_delete_eso_t_c0007_image.sql
-- 目的：画像情報テーブル削除
-- 作成日：2025-12-24
-- 作成者：浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_image AS
-- UPDATE eso_t_c0007_image SET shinki_koushin_sakujo_flg = 2, record_date = now(), record_user = $3
-- WHERE okyaku_id = $1 AND image_id = $2;
--
-- EXECUTE delete_image('1234567890', 'image001', 'user003');

UPDATE eso_t_c0007_image
SET
    shinki_koushin_sakujo_flg = 2, -- 2：削除
    record_date =               now(),
    record_user =               $3
WHERE
    okyaku_id =                 $1
AND image_id =                  $2;

