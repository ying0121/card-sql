
-- 2025-12-23_delete_eso_t_c0021_kometer.sql
-- 目的：子メーターテーブル削除
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_kometer AS
-- UPDATE eso_t_c0021_kometer SET shinki_koushin_sakujo_flg = 2, record_date = now(), record_user = $6
-- WHERE okyaku_id = $1 AND zumen_id = $2 AND setsubi_id = $3 AND kotai_id = $4 AND daisu_renban = $5;
--
-- EXECUTE delete_kometer('1234567890', 12345678, 1, 1, 1, 'user003');

UPDATE eso_t_c0021_kometer
SET
    shinki_koushin_sakujo_flg = 2, -- 2：削除
    record_date =               now(),
    record_user =               $6
WHERE
    okyaku_id =                 $1
AND zumen_id =                  $2
AND setsubi_id =                $3
AND kotai_id =                  $4
AND daisu_renban =              $5;

