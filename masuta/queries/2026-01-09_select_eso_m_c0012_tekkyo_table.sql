
-- 2026-01-09_select_eso_m_c0012_tekkyo.sql
-- 目的：撤去状態マスタ取得
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_tekkyo AS
-- SELECT ... FROM eso_m_c0012_tekkyo 
-- WHERE jotai_flg = $1;
--
-- EXECUTE select_tekkyo(1);

SELECT
    jotai_flg,
    jotai_nm,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0012_tekkyo
WHERE
    jotai_flg = $1;
