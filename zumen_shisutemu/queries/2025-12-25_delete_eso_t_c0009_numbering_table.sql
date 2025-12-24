
-- 2025-12-25_delete_eso_t_c0009_numbering.sql
-- 目的：採番テーブル削除
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_numbering AS
-- UPDATE eso_t_c0009_numbering SET shinki_koushin_sakujo_flg = 2, record_date = now(), record_user = $3
-- WHERE okyaku_id = $1 AND yoto_kbn = $2;
--
-- EXECUTE delete_numbering('1234567890', '01', 'user003');

UPDATE eso_t_c0009_numbering
SET
    shinki_koushin_sakujo_flg = 2, -- 2：削除
    record_date =               now(),
    record_user =               $3
WHERE
    okyaku_id =                 $1
AND yoto_kbn =                  $2;

