
-- 2026-01-09_update_eso_m_c0014_seizosha.sql
-- 目的：製造者マスタ更新
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_seizosha AS
-- UPDATE eso_m_c0014_seizosha SET seizosha_nm = $4, seizosha_kana_nm = $5, seizosha_ryaku_nm = $6,
--     record_date = now(), record_user = $7
-- WHERE shubetsu_cd = $1 AND shurui_cd = $2 AND seizosha_cd = $3;
--
-- EXECUTE update_seizosha('000001', '01', '0001', '更新製造者名', 'こうしんせいぞうしゃめい', '更製', 'user002');

UPDATE eso_m_c0014_seizosha
SET
    seizosha_nm      = $4,
    seizosha_kana_nm = $5,
    seizosha_ryaku_nm = $6,
    record_date      = now(),
    record_user      = $7
WHERE
    shubetsu_cd = $1
    AND shurui_cd = $2
    AND seizosha_cd = $3
RETURNING *;
