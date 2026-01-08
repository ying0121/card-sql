
-- 2026-01-09_select_eso_m_c0014_seizosha.sql
-- 目的：製造者マスタ取得
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_seizosha AS
-- SELECT ... FROM eso_m_c0014_seizosha 
-- WHERE shubetsu_cd = $1 AND shurui_cd = $2 AND seizosha_cd = $3;
--
-- EXECUTE select_seizosha('000001', '01', '0001');

SELECT
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
FROM eso_m_c0014_seizosha
WHERE
    shubetsu_cd = $1
    AND shurui_cd = $2
    AND seizosha_cd = $3;
