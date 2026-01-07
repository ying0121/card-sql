
-- 2026-01-07_update_eso_m_c0009_setsubi_category.sql
-- 目的：設備カテゴリマスタ更新
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_setsubi_category AS
-- UPDATE eso_m_c0009_setsubi_category SET category_nm = $3, category_mask = $4, order_jn = $5,
--     record_date = now(), record_user = $6
-- WHERE category_cd = $1 AND shubetsu_cd = $2;
--
-- EXECUTE update_setsubi_category(1, '0001', '更新カテゴリ名称', 2, 2, 'user002');

UPDATE eso_m_c0009_setsubi_category
SET
    category_nm  = $3,
    category_mask = $4,
    order_jn      = $5,
    record_date   = now(),
    record_user   = $6
WHERE
    category_cd = $1
AND shubetsu_cd = $2
RETURNING *;

