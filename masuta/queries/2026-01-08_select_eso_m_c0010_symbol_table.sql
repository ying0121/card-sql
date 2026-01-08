
-- 2026-01-08_select_eso_m_c0010_symbol.sql
-- 目的：シンボルマスタ取得
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_symbol AS
-- SELECT ... FROM eso_m_c0010_symbol 
-- WHERE symbol_id = $1;
--
-- EXECUTE select_symbol(1);

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
WHERE
    symbol_id = $1;
