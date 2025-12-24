
-- 2025-12-25_delete_eso_t_c0008_file_work.sql
-- 目的：編集画像テーブル削除
-- 作成日：2025-12-25
-- 作成者：浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_file_work AS
-- UPDATE eso_t_c0008_file_work SET shinki_koushin_sakujo_flg = 2, record_date = now(), record_user = $4
-- WHERE okyaku_id = $1 AND image_id = $2 AND lock_flg = $3;
--
-- EXECUTE delete_file_work('1234567890', 'image001', 1, 'user003');

UPDATE eso_t_c0008_file_work
SET
    shinki_koushin_sakujo_flg = 2, -- 2：削除
    record_date =               now(),
    record_user =               $4
WHERE
    okyaku_id =                 $1
AND image_id =                  $2
AND lock_flg =                  $3;

