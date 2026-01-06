
-- 2026-01-06_select_eso_m_c0006_category.sql
-- 目的：カテゴリマスタ取得
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_category AS
-- SELECT ... FROM eso_m_c0006_category WHERE category_cd = $1;
--
-- EXECUTE select_category(1);

SELECT
    category_cd,
    category_nm,
    zumen_cd,
    order_jn,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0006_category
WHERE
    category_cd = $1;

