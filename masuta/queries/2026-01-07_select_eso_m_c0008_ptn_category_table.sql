
-- 2026-01-07_select_eso_m_c0008_ptn_category.sql
-- 目的：図面パターンカテゴリマスタ取得
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_ptn_category AS
-- SELECT ... FROM eso_m_c0008_ptn_category 
-- WHERE category1_cd = $1 AND category2_cd = $2 AND category3_cd = $3;
--
-- EXECUTE select_ptn_category(1, NULL, NULL);

SELECT
    category1_cd,
    category2_cd,
    category3_cd,
    category_nm,
    zumen_kind,
    order_jn,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0008_ptn_category
WHERE
    category1_cd = $1
AND (category2_cd = $2 OR ($2 IS NULL AND category2_cd IS NULL))
AND (category3_cd = $3 OR ($3 IS NULL AND category3_cd IS NULL));

