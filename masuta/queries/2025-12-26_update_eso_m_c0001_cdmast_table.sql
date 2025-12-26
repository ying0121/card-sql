
-- 2025-12-26_update_eso_m_c0001_cdmast.sql
-- 目的：コードマスタ更新
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_cdmast AS
-- UPDATE eso_m_c0001_cdmast SET group_cd = $3, ordr_jn = $4, meisyou1 = $5, meisyou2 = $6,
--     value1 = $7, value2 = $8, record_date = now(), record_user = $9
-- WHERE daibunrui_cd = $1 AND shobunrui_cd = $2;
--
-- EXECUTE update_cdmast('000001', '01', 2, 2, '更新名称１', '更新名称２', '更新値１', '更新値２', 'user002');

UPDATE eso_m_c0001_cdmast
SET
    group_cd    = $3,
    ordr_jn     = $4,
    meisyou1    = $5,
    meisyou2    = $6,
    value1      = $7,
    value2      = $8,
    record_date = now(),
    record_user = $9
WHERE
    daibunrui_cd = $1
AND shobunrui_cd = $2
RETURNING *;

