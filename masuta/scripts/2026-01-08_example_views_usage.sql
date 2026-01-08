
-- 2026-01-08_example_views_usage.sql
-- 目的：テーブルクエリの使用例とテストクエリ
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用したクエリの例です。

-- ============================================
-- テーブルクエリの使用例
-- ============================================

-- 1. シンボルマスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0010_symbol AS
SELECT
    symbol_id,
    entry_version,
    entry_date,
    entry_user_nm,
    binary_data,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0010_symbol
ORDER BY symbol_id;
COMMIT;

-- ============================================
-- テーブルの統計情報取得（2026-01-08時点）
-- ============================================

-- シンボルマスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0010_symbol' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0010_symbol;
COMMIT;

-- IDごとのレコード数
SELECT symbol_id, COUNT(*) AS record_count
FROM eso_m_c0010_symbol
GROUP BY symbol_id
ORDER BY symbol_id;

-- 登録バージョンごとのレコード数
SELECT entry_version, COUNT(*) AS record_count
FROM eso_m_c0010_symbol
WHERE entry_version IS NOT NULL
GROUP BY entry_version
ORDER BY entry_version;

-- 登録ユーザー名称ごとのレコード数
SELECT entry_user_nm, COUNT(*) AS record_count
FROM eso_m_c0010_symbol
WHERE entry_user_nm IS NOT NULL
GROUP BY entry_user_nm
ORDER BY entry_user_nm;

-- 2. 機器使用状態マスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0011_jotai AS
SELECT
    jotai_flg,
    jotai_nm,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0011_jotai
ORDER BY jotai_flg;
COMMIT;

-- 機器使用状態マスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0011_jotai' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0011_jotai;
COMMIT;

-- 状態フラグごとのレコード数
SELECT jotai_flg, COUNT(*) AS record_count
FROM eso_m_c0011_jotai
GROUP BY jotai_flg
ORDER BY jotai_flg;

-- 状態名称ごとのレコード数
SELECT jotai_nm, COUNT(*) AS record_count
FROM eso_m_c0011_jotai
WHERE jotai_nm IS NOT NULL
GROUP BY jotai_nm
ORDER BY jotai_nm;
