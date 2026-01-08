
-- 2026-01-08_insert_eso_m_c0010_symbol.sql
-- 目的：シンボルマスタテーブルに挿入
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_symbol AS
-- INSERT INTO eso_m_c0010_symbol (
--     symbol_id, entry_version, entry_date, entry_user_nm, binary_data, create_date, create_user, record_date, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);
--
-- EXECUTE insert_symbol(1, '1.0.0', '2026-01-08 00:00:00', 'user001', '\x00', '2026-01-08 00:00:00', 'user001', '2026-01-08 00:00:00', 'user001');

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
    $1,  -- symbol_id
    $2,  -- entry_version
    $3,  -- entry_date
    $4,  -- entry_user_nm
    $5,  -- binary_data
    $6,  -- create_date
    $7,  -- create_user
    $8,  -- record_date
    $9   -- record_user
)
RETURNING *;
