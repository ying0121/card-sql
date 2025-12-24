
-- 2025-12-24_delete_eso_t_c0005_cad_link.sql
-- 目的：ハイパーリンク管理テーブル削除
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_cad_link AS
-- UPDATE eso_t_c0005_cad_link SET shinki_koushin_sakujo_flg = 2, record_date = now(), record_user = $6
-- WHERE okyaku_id = $1 AND link_moto_id = $2 AND moto_zumen_id = $3 AND link_saki_id = $4 AND saki_zumen_id = $5;
--
-- EXECUTE delete_cad_link('1234567890', 1, 12345678, 2, 12345679, 'user003');

UPDATE eso_t_c0005_cad_link
SET
    shinki_koushin_sakujo_flg = 2, -- 2：削除
    record_date =               now(),
    record_user =               $6
WHERE
    okyaku_id =                 $1
AND link_moto_id =              $2
AND moto_zumen_id =             $3
AND link_saki_id =              $4
AND saki_zumen_id =             $5;

