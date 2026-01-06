
-- 2026-01-06_insert_eso_m_c0006_category.sql
-- 目的：カテゴリマスタテーブルに挿入
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_category AS
-- INSERT INTO eso_m_c0006_category (
--     category_cd, category_nm, zumen_cd, order_jn, create_date, create_user, record_date, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8);
--
-- EXECUTE insert_category(1, 'カテゴリ名称', 1, 1, '2026-01-06 00:00:00', 'user001', '2026-01-06 00:00:00', 'user001');

INSERT INTO eso_m_c0006_category (
    category_cd,
    category_nm,
    zumen_cd,
    order_jn,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    $1,  -- category_cd
    $2,  -- category_nm
    $3,  -- zumen_cd
    $4,  -- order_jn
    $5,  -- create_date
    $6,  -- create_user
    $7,  -- record_date
    $8   -- record_user
)
RETURNING *;

