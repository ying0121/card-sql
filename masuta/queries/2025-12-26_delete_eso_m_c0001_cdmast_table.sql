
-- 2025-12-26_delete_eso_m_c0001_cdmast.sql
-- 目的：コードマスタテーブル削除
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_cdmast AS
-- DELETE FROM eso_m_c0001_cdmast WHERE daibunrui_cd = $1 AND shobunrui_cd = $2;
--
-- EXECUTE delete_cdmast('000001', '01');

DELETE FROM eso_m_c0001_cdmast
WHERE
    daibunrui_cd = $1
AND shobunrui_cd = $2
RETURNING *;

