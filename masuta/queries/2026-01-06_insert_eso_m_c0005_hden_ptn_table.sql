
-- 2026-01-06_insert_eso_m_c0005_hden_ptn.sql
-- 目的：発電所パターンマスタテーブルに挿入
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_hden_ptn AS
-- INSERT INTO eso_m_c0005_hden_ptn (
--     yobihatsu_hden_kbn_cd, shiyo_keitai, hden_shurui, gdo_shurui,
--     hsymbol_no, gsymbol_no, psymbol_no, biko, create_date, create_user, record_date, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12);
--
-- EXECUTE insert_hden_ptn('01', '01', '01', '01', 1, 1, 1, '備考', '2026-01-06 00:00:00', 'user001', '2026-01-06 00:00:00', 'user001');

INSERT INTO eso_m_c0005_hden_ptn (
    yobihatsu_hden_kbn_cd,
    shiyo_keitai,
    hden_shurui,
    gdo_shurui,
    hsymbol_no,
    gsymbol_no,
    psymbol_no,
    biko,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    $1,  -- yobihatsu_hden_kbn_cd
    $2,  -- shiyo_keitai
    $3,  -- hden_shurui
    $4,  -- gdo_shurui
    $5,  -- hsymbol_no
    $6,  -- gsymbol_no
    $7,  -- psymbol_no
    $8,  -- biko
    $9,  -- create_date
    $10,  -- create_user
    $11,  -- record_date
    $12  -- record_user
)
RETURNING *;

