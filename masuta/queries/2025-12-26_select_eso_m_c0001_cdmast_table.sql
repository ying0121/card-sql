
-- 2025-12-26_select_eso_m_c0001_cdmast.sql
-- 目的：コードマスタ取得
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_cdmast AS
-- SELECT ... FROM eso_m_c0001_cdmast WHERE daibunrui_cd = $1 ORDER BY ordr_jn;
--
-- EXECUTE select_cdmast('000001');

SELECT
    daibunrui_cd,
    shobunrui_cd,
    group_cd,
    ordr_jn,
    meisyou1,
    meisyou2,
    value1,
    value2,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0001_cdmast
WHERE
    daibunrui_cd = $1
ORDER BY ordr_jn;

