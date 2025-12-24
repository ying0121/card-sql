
-- 2025-12-24_select_eso_t_c0007_image.sql
-- 目的：画像情報取得（論理削除除外）
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_image AS
-- SELECT ... FROM eso_t_c0007_image WHERE okyaku_id = $1 AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2;
--
-- EXECUTE select_image('1234567890');

SELECT
    okyaku_id,
    image_id,
    image_kbn_su,
    shikibetsu_id,
    zumen_id,
    title_mj,
    ordr_jn,
    file_name_mj,
    create_date,
    create_user,
    record_date,
    record_user,
    shinki_koushin_sakujo_flg
FROM eso_t_c0007_image
WHERE
    okyaku_id = $1
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY image_kbn_su, ordr_jn, image_id;

