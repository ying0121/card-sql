
-- 2026-01-09_update_eso_m_c0015_katashiki.sql
-- 目的：型式マスタ更新
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_katashiki AS
-- UPDATE eso_m_c0015_katashiki SET katasiki_nm = $5,
--     record_date = now(), record_user = $6
-- WHERE shubetsu_cd = $1 AND shurui_cd = $2 AND seizosha_cd = $3 AND katashiki_cd = $4;
--
-- EXECUTE update_katashiki('000001', '01', '0001', '0001', '更新型式名', 'user002');

UPDATE eso_m_c0015_katashiki
SET
    katasiki_nm  = $5,
    record_date   = now(),
    record_user   = $6
WHERE
    shubetsu_cd = $1
    AND shurui_cd = $2
    AND seizosha_cd = $3
    AND katashiki_cd = $4
RETURNING *;
