
-- 2026-01-07_update_eso_m_c0008_ptn_category.sql
-- 目的：図面パターンカテゴリマスタ更新
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_ptn_category AS
-- UPDATE eso_m_c0008_ptn_category SET category_nm = $4, zumen_kind = $5, order_jn = $6,
--     record_date = now(), record_user = $7
-- WHERE category1_cd = $1 AND category2_cd = $2 AND category3_cd = $3;
--
-- EXECUTE update_ptn_category(1, NULL, NULL, '更新カテゴリ名称', 2, 2, 'user002');

UPDATE eso_m_c0008_ptn_category
SET
    category_nm  = $4,
    zumen_kind    = $5,
    order_jn      = $6,
    record_date   = now(),
    record_user   = $7
WHERE
    category1_cd = $1
AND (category2_cd = $2 OR ($2 IS NULL AND category2_cd IS NULL))
AND (category3_cd = $3 OR ($3 IS NULL AND category3_cd IS NULL))
RETURNING *;

