
-- 2025-12-24_select_eso_t_c0006_okyaku_work.sql
-- 目的：ＣＡＤ編集お客様管理取得（論理削除除外）
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_okyaku_work AS
-- SELECT ... FROM eso_t_c0006_okyaku_work WHERE okyaku_id = $1 AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2;
--
-- EXECUTE select_okyaku_work('1234567890');

SELECT
    okyaku_id,
    yoto_kbn,
    user_nm_mj,
    lock_flg,
    edit_flg,
    tenkenjisseki_id,
    json_binary_byt,
    zumen_binary_byt,
    renkei_mode_su,
    create_date,
    create_user,
    record_date,
    record_user,
    shinki_koushin_sakujo_flg
FROM eso_t_c0006_okyaku_work
WHERE
    okyaku_id = $1
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY yoto_kbn, user_nm_mj, lock_flg;

