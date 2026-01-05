
-- 2026-01-05_insert_eso_m_c0003_setsubi_shubetsu.sql
-- 目的：設備種別マスタテーブルに挿入
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_setsubi_shubetsu AS
-- INSERT INTO eso_m_c0003_setsubi_shubetsu (
--     zumen_cd, zumen_nm, shubetsu_cd, shubetsu_nm, table_nm, create_user, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7);
--
-- EXECUTE insert_setsubi_shubetsu(1, '図面名称', '0001', '種別名称', 'table_name', 'user001', 'user001');

INSERT INTO eso_m_c0003_setsubi_shubetsu (
    zumen_cd,
    zumen_nm,
    shubetsu_cd,
    shubetsu_nm,
    table_nm,
    create_user,
    record_user
)
VALUES (
    $1,  -- zumen_cd
    $2,  -- zumen_nm
    $3,  -- shubetsu_cd
    $4,  -- shubetsu_nm
    $5,  -- table_nm
    $6,  -- create_user
    $7   -- record_user
)
RETURNING *;

