
-- 2026-01-08_delete_eso_m_c0010_symbol.sql
-- 目的：シンボルマスタテーブル削除
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_symbol AS
-- DELETE FROM eso_m_c0010_symbol 
-- WHERE symbol_id = $1;
--
-- EXECUTE delete_symbol(1);

DELETE FROM eso_m_c0010_symbol
WHERE
    symbol_id = $1
RETURNING *;
