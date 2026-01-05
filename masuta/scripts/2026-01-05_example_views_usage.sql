
-- 2026-01-05_example_views_usage.sql
-- 目的：テーブルクエリの使用例とテストクエリ
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用したクエリの例です。

-- ============================================
-- テーブルクエリの使用例
-- ============================================

-- 1. 図面種別マスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0002_zumen_shubetsu AS
SELECT
    zumen_cd,
    zumen_nm,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0002_zumen_shubetsu
ORDER BY zumen_cd;
COMMIT;

-- 2. 設備種別マスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0003_setsubi_shubetsu AS
SELECT
    shubetsu_cd,
    shubetsu_nm,
    table_nm,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0003_setsubi_shubetsu
ORDER BY shubetsu_cd;
COMMIT;

-- 3. 設備シンボルマスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0004_setsubi_symbol AS
SELECT
    shubetsu_cd,
    symbol_no,
    master_bunrui,
    master_cd,
    symbol_scale,
    category_cd,
    order_jn,
    text_x,
    text_y,
    text_size,
    hyokimoji1,
    hyokimoji2,
    hyokimoji3,
    symbol_muki,
    mask_flg,
    zukei_type,
    line_type,
    line_width,
    line_color,
    font,
    limit_flg1,
    upload_flg,
    biko,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0004_setsubi_symbol
ORDER BY shubetsu_cd, order_jn;
COMMIT;

-- ============================================
-- テーブルの統計情報取得（2026-01-05時点）
-- ============================================

-- 図面種別マスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0002_zumen_shubetsu' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0002_zumen_shubetsu;
COMMIT;

-- 図面コードごとのレコード数
SELECT zumen_cd, COUNT(*) AS record_count
FROM eso_m_c0002_zumen_shubetsu
GROUP BY zumen_cd
ORDER BY zumen_cd;

-- 設備種別マスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0003_setsubi_shubetsu' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0003_setsubi_shubetsu;
COMMIT;

-- 種別コードごとのレコード数
SELECT shubetsu_cd, COUNT(*) AS record_count
FROM eso_m_c0003_setsubi_shubetsu
GROUP BY shubetsu_cd
ORDER BY shubetsu_cd;

-- 設備シンボルマスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0004_setsubi_symbol' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0004_setsubi_symbol;
COMMIT;

-- 設備種別コードごとのレコード数
SELECT shubetsu_cd, COUNT(*) AS record_count
FROM eso_m_c0004_setsubi_symbol
GROUP BY shubetsu_cd
ORDER BY shubetsu_cd;

-- カテゴリコードごとのレコード数
SELECT category_cd, COUNT(*) AS record_count
FROM eso_m_c0004_setsubi_symbol
GROUP BY category_cd
ORDER BY category_cd;

-- コードマスタごとのレコード数
SELECT master_bunrui, master_cd, COUNT(*) AS record_count
FROM eso_m_c0004_setsubi_symbol
GROUP BY master_bunrui, master_cd
ORDER BY master_bunrui, master_cd;
