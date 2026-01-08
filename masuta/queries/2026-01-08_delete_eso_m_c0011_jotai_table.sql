
-- 2026-01-08_delete_eso_m_c0011_jotai.sql
-- 目的：機器使用状態マスタテーブル削除
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_jotai AS
-- DELETE FROM eso_m_c0011_jotai 
-- WHERE jotai_flg = $1;
--
-- EXECUTE delete_jotai(1);

DELETE FROM eso_m_c0011_jotai
WHERE
    jotai_flg = $1
RETURNING *;
