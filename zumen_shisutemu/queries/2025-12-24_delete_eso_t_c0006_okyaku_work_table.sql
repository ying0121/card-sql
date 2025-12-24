
-- 2025-12-24_delete_eso_t_c0006_okyaku_work.sql
-- 目的：ＣＡＤ編集お客様管理テーブル削除
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_okyaku_work AS
-- UPDATE eso_t_c0006_okyaku_work SET shinki_koushin_sakujo_flg = 2, record_date = now(), record_user = $5
-- WHERE okyaku_id = $1 AND yoto_kbn = $2 AND user_nm_mj = $3 AND lock_flg = $4;
--
-- EXECUTE delete_okyaku_work('1234567890', '01', 'ユーザー名', 1, 'user003');

UPDATE eso_t_c0006_okyaku_work
SET
    shinki_koushin_sakujo_flg = 2, -- 2：削除
    record_date =               now(),
    record_user =               $5
WHERE
    okyaku_id =                 $1
AND yoto_kbn =                  $2
AND user_nm_mj =                $3
AND lock_flg =                  $4;

