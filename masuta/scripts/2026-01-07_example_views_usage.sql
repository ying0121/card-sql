
-- 2026-01-07_example_views_usage.sql
-- 目的：テーブルクエリの使用例とテストクエリ
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用したクエリの例です。

-- ============================================
-- テーブルクエリの使用例
-- ============================================

-- 1. 図面パターンカテゴリマスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0008_ptn_category AS
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
ORDER BY zumen_kind, order_jn;
COMMIT;

-- ============================================
-- テーブルの統計情報取得（2026-01-07時点）
-- ============================================

-- 図面パターンカテゴリマスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0008_ptn_category' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0008_ptn_category;
COMMIT;

-- カテゴリコード1ごとのレコード数
SELECT category1_cd, COUNT(*) AS record_count
FROM eso_m_c0008_ptn_category
GROUP BY category1_cd
ORDER BY category1_cd;

-- 図面種別ごとのレコード数
SELECT zumen_kind, COUNT(*) AS record_count
FROM eso_m_c0008_ptn_category
GROUP BY zumen_kind
ORDER BY zumen_kind;

-- 2. 設備カテゴリマスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0009_setsubi_category AS
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
ORDER BY shubetsu_cd, order_jn;
COMMIT;

-- 設備カテゴリマスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0009_setsubi_category' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0009_setsubi_category;
COMMIT;

-- カテゴリコードごとのレコード数
SELECT category_cd, COUNT(*) AS record_count
FROM eso_m_c0009_setsubi_category
GROUP BY category_cd
ORDER BY category_cd;

-- 設備種別ごとのレコード数
SELECT shubetsu_cd, COUNT(*) AS record_count
FROM eso_m_c0009_setsubi_category
GROUP BY shubetsu_cd
ORDER BY shubetsu_cd;

