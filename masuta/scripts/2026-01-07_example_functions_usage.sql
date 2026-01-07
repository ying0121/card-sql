
-- 2026-01-07_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. 図面パターンカテゴリマスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-07_insert_eso_m_c0008_ptn_category_table.sql を使用してください
BEGIN;
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
    1,
    NULL,
    NULL,
    'カテゴリ名称',
    1,
    1,
    now(),
    'ikou2027',
    now(),
    'ikou2027'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-07_update_eso_m_c0008_ptn_category_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0008_ptn_category
SET
    category_nm = '更新カテゴリ名称',
    zumen_kind  = 2,
    order_jn    = 2,
    create_date = now(),
    create_user = 'ikou2027',
    record_date = now(),
    record_user = 'ikou2027'
WHERE
    category1_cd = 1
AND category2_cd IS NULL
AND category3_cd IS NULL;
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-07_delete_eso_m_c0008_ptn_category_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0008_ptn_category
WHERE
    category1_cd = 1
AND category2_cd IS NULL
AND category3_cd IS NULL;
COMMIT;

-- ============================================
-- テストクエリ
-- ============================================

-- 図面パターンカテゴリマスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0008_ptn_category ORDER BY zumen_kind, order_jn;

-- カテゴリコード1で検索
SELECT * FROM eso_m_c0008_ptn_category WHERE category1_cd = 1 ORDER BY zumen_kind, order_jn;

-- 図面種別で検索
SELECT * FROM eso_m_c0008_ptn_category WHERE zumen_kind = 1 ORDER BY order_jn;

-- カテゴリ名称で検索
SELECT * FROM eso_m_c0008_ptn_category WHERE category_nm LIKE '%カテゴリ%' ORDER BY zumen_kind, order_jn;

-- ============================================
-- 2. 設備カテゴリマスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-07_insert_eso_m_c0009_setsubi_category_table.sql を使用してください
BEGIN;
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
    1,
    '0001',
    'カテゴリ名称',
    1,
    1,
    now(),
    'ikou2027',
    now(),
    'ikou2027'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-07_update_eso_m_c0009_setsubi_category_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0009_setsubi_category
SET
    category_nm = '更新カテゴリ名称',
    category_mask = 2,
    order_jn    = 2,
    create_date = now(),
    create_user = 'ikou2027',
    record_date = now(),
    record_user = 'ikou2027'
WHERE
    category_cd = 1
AND shubetsu_cd = '0001';
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-07_delete_eso_m_c0009_setsubi_category_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0009_setsubi_category
WHERE
    category_cd = 1
AND shubetsu_cd = '0001';
COMMIT;

-- 設備カテゴリマスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0009_setsubi_category ORDER BY shubetsu_cd, order_jn;

-- カテゴリコードで検索
SELECT * FROM eso_m_c0009_setsubi_category WHERE category_cd = 1 ORDER BY shubetsu_cd, order_jn;

-- 設備種別で検索
SELECT * FROM eso_m_c0009_setsubi_category WHERE shubetsu_cd = '0001' ORDER BY order_jn;

-- カテゴリ名称で検索
SELECT * FROM eso_m_c0009_setsubi_category WHERE category_nm LIKE '%カテゴリ%' ORDER BY shubetsu_cd, order_jn;

