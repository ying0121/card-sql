
-- 2025-12-18_select_eso_t_c0011_keiki.sql
-- 目的：計器類取得（論理削除除外）
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_keiki AS
-- SELECT ... FROM eso_t_c0011_keiki WHERE okyaku_id = $1 AND zumen_id = $2 AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 ORDER BY ordr_jn;
--
-- EXECUTE select_keiki('1234567890', 12345678);

SELECT
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    shurui_cd,
    tkaku_v,
    tkaku_v_cd,
    tkaku_a,
    tkaku_a_cd,
    seizo_ym,
    biko,
    ordr_jn,
    record_date,
    shinki_koushin_sakujo_flg
FROM eso_t_c0011_keiki
WHERE
    okyaku_id = $1
AND zumen_id = $2 
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY ordr_jn;
