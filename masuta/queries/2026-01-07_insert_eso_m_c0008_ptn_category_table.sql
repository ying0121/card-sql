
-- 2026-01-07_insert_eso_m_c0008_ptn_category.sql
-- 目的：図面パターンカテゴリマスタテーブルに挿入
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_ptn_category AS
-- INSERT INTO eso_m_c0008_ptn_category (
--     category1_cd, category2_cd, category3_cd, category_nm, zumen_kind, order_jn, create_date, create_user, record_date, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);
--
-- EXECUTE insert_ptn_category(1, NULL, NULL, 'カテゴリ名称', 1, 1, '2026-01-07 00:00:00', 'user001', '2026-01-07 00:00:00', 'user001');

INSERT INTO eso_m_c0008_ptn_category (
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
)
VALUES (
    $1,  -- category1_cd
    $2,  -- category2_cd
    $3,  -- category3_cd
    $4,  -- category_nm
    $5,  -- zumen_kind
    $6,  -- order_jn
    $7,  -- create_date
    $8,  -- create_user
    $9,  -- record_date
    $10   -- record_user
)
RETURNING *;

