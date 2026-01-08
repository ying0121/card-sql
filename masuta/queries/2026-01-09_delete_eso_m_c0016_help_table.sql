
-- 2026-01-09_delete_eso_m_c0016_help.sql
-- 目的：設備管理ヘルプマスタテーブル削除
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_help AS
-- DELETE FROM eso_m_c0016_help 
-- WHERE help_id = $1;
--
-- EXECUTE delete_help('00000001');

DELETE FROM eso_m_c0016_help
WHERE
    help_id = $1
RETURNING *;
