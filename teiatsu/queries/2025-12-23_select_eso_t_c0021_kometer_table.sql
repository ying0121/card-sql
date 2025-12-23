
-- 2025-12-23_select_eso_t_c0021_kometer.sql
-- 目的：子メーター取得（論理削除除外）
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_kometer AS
-- SELECT ... FROM eso_t_c0021_kometer WHERE okyaku_id = $1 AND zumen_id = $2 AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 ORDER BY ordr_jn;
--
-- EXECUTE select_kometer('1234567890', 12345678);

SELECT
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    genba_kakuninzumi_meibanto_flg,
    kairo_nm,
    meter_shurui,
    haisen_hoshiki,
    tkaku_v,
    tkaku_v_cd,
    tkaku_a,
    tkaku_a_cd,
    meter_yuko_ym,
    meter_yuko_ym_kakuninkonnan_flg,
    ct_yuko_ym,
    ct_yuko_ym_kakuninkonnan_flg,
    seizosha_cd,
    seizosha_jiyunyuryoku,
    seizosha_kakuninkonnan_flg,
    katashiki_cd,
    katashiki_gaitonashi_flg,
    katashiki_jiyunyuryoku,
    katashiki_kakuninkonnan_flg,
    biko,
    ordr_jn,
    record_date,
    shinki_koushin_sakujo_flg
FROM eso_t_c0021_kometer
WHERE
    okyaku_id = $1
AND zumen_id = $2 
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY ordr_jn;

