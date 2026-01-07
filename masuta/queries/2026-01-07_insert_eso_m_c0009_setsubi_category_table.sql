
-- 2026-01-07_insert_eso_m_c0009_setsubi_category.sql
-- 目的：設備カテゴリマスタテーブルに挿入
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_setsubi_category AS
-- INSERT INTO eso_m_c0009_setsubi_category (
--     category_cd, shubetsu_cd, category_nm, category_mask, order_jn, create_date, create_user, record_date, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);
--
-- EXECUTE insert_setsubi_category(1, '0001', 'カテゴリ名称', 1, 1, '2026-01-07 00:00:00', 'user001', '2026-01-07 00:00:00', 'user001');

INSERT INTO eso_m_c0009_setsubi_category (
    category_cd,
    shubetsu_cd,
    category_nm,
    category_mask,
    order_jn,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    $1,  -- category_cd
    $2,  -- shubetsu_cd
    $3,  -- category_nm
    $4,  -- category_mask
    $5,  -- order_jn
    $6,  -- create_date
    $7,  -- create_user
    $8,  -- record_date
    $9   -- record_user
)
RETURNING *;

