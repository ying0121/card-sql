
-- 2026-01-06_example_views_usage.sql
-- 目的：テーブルクエリの使用例とテストクエリ
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用したクエリの例です。

-- ============================================
-- テーブルクエリの使用例
-- ============================================

-- 1. 発電所パターンマスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0005_hden_ptn AS
SELECT
    yobihatsu_hden_kbn_cd,
    shiyo_keitai,
    hden_shurui,
    gdo_shurui,
    hsymbol_no,
    gsymbol_no,
    psymbol_no,
    biko,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0005_hden_ptn
ORDER BY yobihatsu_hden_kbn_cd;
COMMIT;

-- ============================================
-- テーブルの統計情報取得（2026-01-06時点）
-- ============================================

-- 発電所パターンマスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0005_hden_ptn' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0005_hden_ptn;
COMMIT;

-- 予備発・発電所区分コードごとのレコード数
SELECT yobihatsu_hden_kbn_cd, COUNT(*) AS record_count
FROM eso_m_c0005_hden_ptn
GROUP BY yobihatsu_hden_kbn_cd
ORDER BY yobihatsu_hden_kbn_cd;

-- 使用形態ごとのレコード数
SELECT shiyo_keitai, COUNT(*) AS record_count
FROM eso_m_c0005_hden_ptn
GROUP BY shiyo_keitai
ORDER BY shiyo_keitai;

-- 発電所種類ごとのレコード数
SELECT hden_shurui, COUNT(*) AS record_count
FROM eso_m_c0005_hden_ptn
GROUP BY hden_shurui
ORDER BY hden_shurui;

-- 原動機種類ごとのレコード数
SELECT gdo_shurui, COUNT(*) AS record_count
FROM eso_m_c0005_hden_ptn
GROUP BY gdo_shurui
ORDER BY gdo_shurui;

-- 2. カテゴリマスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0006_category AS
SELECT
    category_cd,
    category_nm,
    zumen_cd,
    order_jn,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0006_category
ORDER BY category_cd;
COMMIT;

-- カテゴリマスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0006_category' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0006_category;
COMMIT;

-- カテゴリコードごとのレコード数
SELECT category_cd, COUNT(*) AS record_count
FROM eso_m_c0006_category
GROUP BY category_cd
ORDER BY category_cd;

-- 図面種別ごとのレコード数
SELECT zumen_cd, COUNT(*) AS record_count
FROM eso_m_c0006_category
GROUP BY zumen_cd
ORDER BY zumen_cd;

-- 3. セットシンボルカテゴリマスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0007_ssym_category AS
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
FROM eso_m_c0007_ssym_category
ORDER BY zumen_kind, order_jn;
COMMIT;

-- セットシンボルカテゴリマスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0007_ssym_category' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0007_ssym_category;
COMMIT;

-- カテゴリコード1ごとのレコード数
SELECT category1_cd, COUNT(*) AS record_count
FROM eso_m_c0007_ssym_category
GROUP BY category1_cd
ORDER BY category1_cd;

-- 図面種別ごとのレコード数
SELECT zumen_kind, COUNT(*) AS record_count
FROM eso_m_c0007_ssym_category
GROUP BY zumen_kind
ORDER BY zumen_kind;

