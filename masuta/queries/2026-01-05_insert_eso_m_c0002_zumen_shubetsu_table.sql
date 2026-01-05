
-- 2026-01-05_insert_eso_m_c0002_zumen_shubetsu.sql
-- 目的：図面種別マスタテーブルに挿入
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_zumen_shubetsu AS
-- INSERT INTO eso_m_c0002_zumen_shubetsu (
--     zumen_cd, zumen_nm, create_user, record_user
-- ) VALUES ($1, $2, $3, $4);
--
-- EXECUTE insert_zumen_shubetsu(1, '図面名称', 'user001', 'user001');

INSERT INTO eso_m_c0002_zumen_shubetsu (
    zumen_cd,
    zumen_nm,
    create_user,
    record_user
)
VALUES (
    $1,  -- zumen_cd
    $2,  -- zumen_nm
    $3,  -- create_user
    $4   -- record_user
)
RETURNING *;

