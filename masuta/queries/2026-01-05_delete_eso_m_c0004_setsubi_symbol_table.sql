
-- 2026-01-05_delete_eso_m_c0004_setsubi_symbol.sql
-- 目的：設備シンボルマスタテーブル削除
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_setsubi_symbol AS
-- DELETE FROM eso_m_c0004_setsubi_symbol WHERE shubetsu_cd = $1 AND symbol_no = $2;
--
-- EXECUTE delete_setsubi_symbol('0001', 1);

DELETE FROM eso_m_c0004_setsubi_symbol
WHERE
    shubetsu_cd = $1
AND symbol_no = $2
RETURNING *;

