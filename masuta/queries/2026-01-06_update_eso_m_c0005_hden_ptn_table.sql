
-- 2026-01-06_update_eso_m_c0005_hden_ptn.sql
-- 目的：発電所パターンマスタ更新
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_hden_ptn AS
-- UPDATE eso_m_c0005_hden_ptn SET shiyo_keitai = $2, hden_shurui = $3, gdo_shurui = $4,
--     hsymbol_no = $5, gsymbol_no = $6, psymbol_no = $7, biko = $8, record_date = now(), record_user = $9
-- WHERE yobihatsu_hden_kbn_cd = $1;
--
-- EXECUTE update_hden_ptn('01', '02', '02', '02', 2, 2, 2, '更新備考', 'user002');

UPDATE eso_m_c0005_hden_ptn
SET
    shiyo_keitai  = $2,
    hden_shurui   = $3,
    gdo_shurui    = $4,
    hsymbol_no    = $5,
    gsymbol_no    = $6,
    psymbol_no    = $7,
    biko          = $8,
    record_date   = now(),
    record_user   = $9
WHERE
    yobihatsu_hden_kbn_cd = $1
RETURNING *;

