
-- 2026-01-09_insert_eso_m_c0015_katashiki.sql
-- 目的：型式マスタテーブルに挿入
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_katashiki AS
-- INSERT INTO eso_m_c0015_katashiki (
--     shubetsu_cd, shurui_cd, seizosha_cd, katashiki_cd, katasiki_nm,
--     create_date, create_user, record_date, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);
--
-- EXECUTE insert_katashiki('000001', '01', '0001', '0001', '型式名', '2026-01-09 00:00:00', 'user001', '2026-01-09 00:00:00', 'user001');

INSERT INTO eso_m_c0015_katashiki (
    shubetsu_cd,
    shurui_cd,
    seizosha_cd,
    katashiki_cd,
    katasiki_nm,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    $1,  -- shubetsu_cd
    $2,  -- shurui_cd
    $3,  -- seizosha_cd
    $4,  -- katashiki_cd
    $5,  -- katasiki_nm
    $6,  -- create_date
    $7,  -- create_user
    $8,  -- record_date
    $9   -- record_user
)
RETURNING *;
