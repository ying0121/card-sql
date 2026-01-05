
-- 2026-01-05_select_eso_m_c0003_setsubi_shubetsu.sql
-- 目的：設備種別マスタ取得
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_setsubi_shubetsu AS
-- SELECT ... FROM eso_m_c0003_setsubi_shubetsu WHERE zumen_cd = $1 AND shubetsu_cd = $2;
--
-- EXECUTE select_setsubi_shubetsu(1, '0001');

SELECT
    zumen_cd,
    zumen_nm,
    shubetsu_cd,
    shubetsu_nm,
    table_nm,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0003_setsubi_shubetsu
WHERE
    zumen_cd = $1
AND shubetsu_cd = $2;

