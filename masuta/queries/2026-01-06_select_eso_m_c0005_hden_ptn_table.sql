
-- 2026-01-06_select_eso_m_c0005_hden_ptn.sql
-- 目的：発電所パターンマスタ取得
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_hden_ptn AS
-- SELECT ... FROM eso_m_c0005_hden_ptn WHERE yobihatsu_hden_kbn_cd = $1;
--
-- EXECUTE select_hden_ptn('01');

SELECT
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
FROM eso_m_c0005_hden_ptn
WHERE
    yobihatsu_hden_kbn_cd = $1;

