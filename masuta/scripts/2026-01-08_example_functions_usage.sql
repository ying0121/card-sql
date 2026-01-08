
-- 2026-01-08_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. シンボルマスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-08_insert_eso_m_c0010_symbol_table.sql を使用してください
BEGIN;
INSERT INTO eso_m_c0010_symbol (
    symbol_id,
    entry_version,
    entry_date,
    entry_user_nm,
    binary_data,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    1,
    '1.0.0',
    now(),
    'user001',
    '\x00',
    now(),
    'ikou2027',
    now(),
    'ikou2027'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-08_update_eso_m_c0010_symbol_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0010_symbol
SET
    entry_version = '1.0.1',
    entry_date    = now(),
    entry_user_nm = 'user002',
    binary_data   = '\x00',
    create_date   = now(),
    create_user   = 'ikou2027',
    record_date   = now(),
    record_user   = 'ikou2027'
WHERE
    symbol_id = 1;
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-08_delete_eso_m_c0010_symbol_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0010_symbol
WHERE
    symbol_id = 1;
COMMIT;

-- ============================================
-- テストクエリ
-- ============================================

-- シンボルマスタテーブル
-- 全件取得
SELECT symbol_id, entry_version, entry_date, entry_user_nm, create_date, create_user, record_date, record_user
FROM eso_m_c0010_symbol
ORDER BY symbol_id;

-- IDで検索
SELECT symbol_id, entry_version, entry_date, entry_user_nm, create_date, create_user, record_date, record_user
FROM eso_m_c0010_symbol
WHERE symbol_id = 1;

-- 登録バージョンで検索
SELECT symbol_id, entry_version, entry_date, entry_user_nm, create_date, create_user, record_date, record_user
FROM eso_m_c0010_symbol
WHERE entry_version = '1.0.0'
ORDER BY symbol_id;

-- 登録ユーザー名称で検索
SELECT symbol_id, entry_version, entry_date, entry_user_nm, create_date, create_user, record_date, record_user
FROM eso_m_c0010_symbol
WHERE entry_user_nm LIKE '%user%'
ORDER BY symbol_id;

-- ============================================
-- 2. 機器使用状態マスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-08_insert_eso_m_c0011_jotai_table.sql を使用してください
BEGIN;
INSERT INTO eso_m_c0011_jotai (
    jotai_flg,
    jotai_nm,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    1,
    '状態名称',
    now(),
    'ikou2027',
    now(),
    'ikou2027'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-08_update_eso_m_c0011_jotai_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0011_jotai
SET
    jotai_nm = '更新状態名称',
    create_date = now(),
    create_user = 'ikou2027',
    record_date = now(),
    record_user = 'ikou2027'
WHERE
    jotai_flg = 1;
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-08_delete_eso_m_c0011_jotai_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0011_jotai
WHERE
    jotai_flg = 1;
COMMIT;

-- 機器使用状態マスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0011_jotai ORDER BY jotai_flg;

-- 状態フラグで検索
SELECT * FROM eso_m_c0011_jotai WHERE jotai_flg = 1;

-- 状態名称で検索
SELECT * FROM eso_m_c0011_jotai WHERE jotai_nm LIKE '%状態%' ORDER BY jotai_flg;
