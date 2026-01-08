
-- 2026-01-09_insert_eso_m_c0014_seizosha.sql
-- 目的：製造者マスタテーブルに挿入
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_seizosha AS
-- INSERT INTO eso_m_c0014_seizosha (
--     shubetsu_cd, shurui_cd, seizosha_cd, seizosha_nm, seizosha_kana_nm, seizosha_ryaku_nm,
--     create_date, create_user, record_date, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);
--
-- EXECUTE insert_seizosha('000001', '01', '0001', '製造者名', 'せいぞうしゃめい', '製者', '2026-01-09 00:00:00', 'user001', '2026-01-09 00:00:00', 'user001');

INSERT INTO eso_m_c0014_seizosha (
    shubetsu_cd,
    shurui_cd,
    seizosha_cd,
    seizosha_nm,
    seizosha_kana_nm,
    seizosha_ryaku_nm,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    $1,  -- shubetsu_cd
    $2,  -- shurui_cd
    $3,  -- seizosha_cd
    $4,  -- seizosha_nm
    $5,  -- seizosha_kana_nm
    $6,  -- seizosha_ryaku_nm
    $7,  -- create_date
    $8,  -- create_user
    $9,  -- record_date
    $10  -- record_user
)
RETURNING *;
