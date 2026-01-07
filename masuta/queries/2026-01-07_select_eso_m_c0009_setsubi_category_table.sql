
-- 2026-01-07_select_eso_m_c0009_setsubi_category.sql
-- 目的：設備カテゴリマスタ取得
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_setsubi_category AS
-- SELECT ... FROM eso_m_c0009_setsubi_category 
-- WHERE category_cd = $1 AND shubetsu_cd = $2;
--
-- EXECUTE select_setsubi_category(1, '0001');

SELECT
    category_cd,
    shubetsu_cd,
    category_nm,
    category_mask,
    order_jn,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0009_setsubi_category
WHERE
    category_cd = $1
AND shubetsu_cd = $2;

