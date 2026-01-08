
-- 2026-01-09_insert_eso_m_c0012_tekkyo.sql
-- 目的：撤去状態マスタテーブルに挿入
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_tekkyo AS
-- INSERT INTO eso_m_c0012_tekkyo (
--     jotai_flg, jotai_nm, create_date, create_user, record_date, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6);
--
-- EXECUTE insert_tekkyo(1, '状態名称', '2026-01-09 00:00:00', 'user001', '2026-01-09 00:00:00', 'user001');

INSERT INTO eso_m_c0012_tekkyo (
    jotai_flg,
    jotai_nm,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    $1,  -- jotai_flg
    $2,  -- jotai_nm
    $3,  -- create_date
    $4,  -- create_user
    $5,  -- record_date
    $6   -- record_user
)
RETURNING *;
