
-- 2026-01-05_select_eso_m_c0002_zumen_shubetsu.sql
-- 目的：図面種別マスタ取得
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_zumen_shubetsu AS
-- SELECT ... FROM eso_m_c0002_zumen_shubetsu WHERE zumen_cd = $1;
--
-- EXECUTE select_zumen_shubetsu(1);

SELECT
    zumen_cd,
    zumen_nm,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0002_zumen_shubetsu
WHERE
    zumen_cd = $1;

