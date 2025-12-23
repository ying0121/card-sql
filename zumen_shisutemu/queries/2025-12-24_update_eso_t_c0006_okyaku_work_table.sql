
-- 2025-12-24_update_eso_t_c0006_okyaku_work.sql
-- 目的：ＣＡＤ編集お客様管理更新
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_okyaku_work AS
-- UPDATE eso_t_c0006_okyaku_work SET edit_flg = $5, tenkenjisseki_id = $6,
--     json_binary_byt = $7, zumen_binary_byt = $8, renkei_mode_su = $9,
--     record_date = now(), record_user = $10, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND yoto_kbn = $2 AND user_nm_mj = $3 AND lock_flg = $4;
--
-- EXECUTE update_okyaku_work('1234567890', '01', 'ユーザー名', 1, 2, '1234567891', NULL, NULL, 2, 'user002');

UPDATE eso_t_c0006_okyaku_work
SET
    edit_flg                       = $5,
    tenkenjisseki_id              = $6,
    json_binary_byt               = $7,
    zumen_binary_byt              = $8,
    renkei_mode_su                = $9,
    record_date                   = now(),
    record_user                   = $10,
    shinki_koushin_sakujo_flg     = 1 -- 1：更新
WHERE
    okyaku_id = $1
AND yoto_kbn  = $2
AND user_nm_mj = $3
AND lock_flg  = $4;

