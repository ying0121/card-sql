
-- 2025-12-24_select_eso_t_c0005_cad_link.sql
-- 目的：ハイパーリンク管理取得（論理削除除外）
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_cad_link AS
-- SELECT ... FROM eso_t_c0005_cad_link WHERE okyaku_id = $1 AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2;
--
-- EXECUTE select_cad_link('1234567890');

SELECT
    okyaku_id,
    link_moto_id,
    moto_zumen_id,
    link_saki_id,
    saki_zumen_id,
    saki_title_mj,
    saki_name_mj,
    saki_setsubi_id,
    saki_shubetsu_mj,
    moto_zumen_han_su,
    saki_zumen_han_su,
    saki_zumen_shubetsu_su,
    create_date,
    create_user,
    record_date,
    record_user,
    shinki_koushin_sakujo_flg
FROM eso_t_c0005_cad_link
WHERE
    okyaku_id = $1
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY link_moto_id, link_saki_id;

