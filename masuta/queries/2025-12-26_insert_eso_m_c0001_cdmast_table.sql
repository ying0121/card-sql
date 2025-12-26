
-- 2025-12-26_insert_eso_m_c0001_cdmast.sql
-- 目的：コードマスタテーブルに挿入
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_cdmast AS
-- INSERT INTO eso_m_c0001_cdmast (
--     daibunrui_cd, shobunrui_cd, group_cd, ordr_jn,
--     meisyou1, meisyou2, value1, value2, create_user, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);
--
-- EXECUTE insert_cdmast('000001', '01', 1, 1, '名称１', '名称２', '値１', '値２', 'user001', 'user001');

INSERT INTO eso_m_c0001_cdmast (
    daibunrui_cd,
    shobunrui_cd,
    group_cd,
    ordr_jn,
    meisyou1,
    meisyou2,
    value1,
    value2,
    create_user,
    record_user
)
VALUES (
    $1,  -- daibunrui_cd
    $2,  -- shobunrui_cd
    $3,  -- group_cd
    $4,  -- ordr_jn
    $5,  -- meisyou1
    $6,  -- meisyou2
    $7,  -- value1
    $8,  -- value2
    $9,  -- create_user
    $10  -- record_user
)
RETURNING *;

