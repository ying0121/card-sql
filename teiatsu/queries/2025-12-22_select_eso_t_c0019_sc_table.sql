
-- 2025-12-22_select_eso_t_c0019_sc.sql
-- 目的：低圧コンデンサ取得（論理削除除外）
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_sc AS
-- SELECT ... FROM eso_t_c0019_sc WHERE okyaku_id = $1 AND zumen_id = $2 AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 ORDER BY ordr_jn;
--
-- EXECUTE select_sc('1234567890', 12345678);

SELECT
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    genba_kakuninzumi_meibanto_flg,
    tkaku_v,
    tkaku_v_cd,
    tkaku_kva,
    tkaku_kva_cd,
    tkaku_kva_kakuninkonnan_flg,
    seizo_ym,
    seizo_nennomi_flg,
    seizo_ym_kakuninkonnan_flg,
    biko,
    ordr_jn,
    record_date,
    shinki_koushin_sakujo_flg
FROM eso_t_c0019_sc
WHERE
    okyaku_id = $1
AND zumen_id = $2 
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY ordr_jn;

