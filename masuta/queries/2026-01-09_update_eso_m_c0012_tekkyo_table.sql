
-- 2026-01-09_update_eso_m_c0012_tekkyo.sql
-- 目的：撤去状態マスタ更新
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_tekkyo AS
-- UPDATE eso_m_c0012_tekkyo SET jotai_nm = $2,
--     record_date = now(), record_user = $3
-- WHERE jotai_flg = $1;
--
-- EXECUTE update_tekkyo(1, '更新状態名称', 'user002');

UPDATE eso_m_c0012_tekkyo
SET
    jotai_nm  = $2,
    record_date   = now(),
    record_user   = $3
WHERE
    jotai_flg = $1
RETURNING *;
