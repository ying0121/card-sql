
-- 2026-01-06_update_eso_m_c0006_category.sql
-- 目的：カテゴリマスタ更新
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_category AS
-- UPDATE eso_m_c0006_category SET category_nm = $2, zumen_cd = $3, order_jn = $4,
--     record_date = now(), record_user = $5 WHERE category_cd = $1;
--
-- EXECUTE update_category(1, '更新カテゴリ名称', 2, 2, 'user002');

UPDATE eso_m_c0006_category
SET
    category_nm  = $2,
    zumen_cd      = $3,
    order_jn      = $4,
    record_date   = now(),
    record_user   = $5
WHERE
    category_cd = $1
RETURNING *;

