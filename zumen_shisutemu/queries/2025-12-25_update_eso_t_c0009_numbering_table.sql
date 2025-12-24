
-- 2025-12-25_update_eso_t_c0009_numbering.sql
-- 目的：採番更新
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_numbering AS
-- UPDATE eso_t_c0009_numbering SET value_su = $3, biko_mj = $4,
--     record_date = now(), record_user = $5, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND yoto_kbn = $2;
--
-- EXECUTE update_numbering('1234567890', '01', 200, '備考2', 'user002');

UPDATE eso_t_c0009_numbering
SET
    value_su                       = $3,
    biko_mj                        = $4,
    record_date                    = now(),
    record_user                    = $5,
    shinki_koushin_sakujo_flg     = 1 -- 1：更新
WHERE
    okyaku_id = $1
AND yoto_kbn  = $2;

