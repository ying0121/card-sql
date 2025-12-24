
-- 2025-12-25_select_eso_t_c0009_numbering.sql
-- 目的：採番取得（論理削除除外）
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_numbering AS
-- SELECT ... FROM eso_t_c0009_numbering WHERE okyaku_id = $1 AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2;
--
-- EXECUTE select_numbering('1234567890');

SELECT
    okyaku_id,
    yoto_kbn,
    value_su,
    biko_mj,
    create_date,
    create_user,
    record_date,
    record_user,
    shinki_koushin_sakujo_flg
FROM eso_t_c0009_numbering
WHERE
    okyaku_id = $1
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY yoto_kbn;

