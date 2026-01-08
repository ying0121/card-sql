
-- 2026-01-08_update_eso_m_c0010_symbol.sql
-- 目的：シンボルマスタ更新
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_symbol AS
-- UPDATE eso_m_c0010_symbol SET entry_version = $2, entry_date = $3, entry_user_nm = $4, binary_data = $5,
--     record_date = now(), record_user = $6
-- WHERE symbol_id = $1;
--
-- EXECUTE update_symbol(1, '1.0.1', '2026-01-08 12:00:00', 'user002', '\x00', 'user002');

UPDATE eso_m_c0010_symbol
SET
    entry_version = $2,
    entry_date    = $3,
    entry_user_nm = $4,
    binary_data   = $5,
    record_date   = now(),
    record_user   = $6
WHERE
    symbol_id = $1
RETURNING *;
