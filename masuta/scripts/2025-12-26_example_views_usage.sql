
-- 2025-12-26_example_views_usage.sql
-- 目的：テーブルクエリの使用例とテストクエリ
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用したクエリの例です。

-- ============================================
-- テーブルクエリの使用例
-- ============================================

-- 1. コードマスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0001_cdmast AS
SELECT
    daibunrui_cd,
    shobunrui_cd,
    group_cd,
    ordr_jn,
    meisyou1,
    meisyou2,
    value1,
    value2,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0001_cdmast
ORDER BY daibunrui_cd, ordr_jn;
COMMIT;

-- ============================================
-- テーブルの統計情報取得（2025-12-26時点）
-- ============================================

-- コードマスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0001_cdmast' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0001_cdmast;
COMMIT;

-- 大分類コードごとのレコード数
SELECT daibunrui_cd, COUNT(*) AS record_count
FROM eso_m_c0001_cdmast
GROUP BY daibunrui_cd
ORDER BY daibunrui_cd;

-- グループコードごとのレコード数
SELECT group_cd, COUNT(*) AS record_count
FROM eso_m_c0001_cdmast
WHERE group_cd IS NOT NULL
GROUP BY group_cd
ORDER BY group_cd;

