
-- 2025-12-26_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. コードマスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-26_insert_eso_m_c0001_cdmast_table.sql を使用してください
BEGIN;
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
    '000001',
    '01',
    1,
    1,
    '名称１',
    '名称２',
    '値１',
    '値２',
    'user001',
    'user001'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-26_update_eso_m_c0001_cdmast_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0001_cdmast
SET
    group_cd    = 2,
    ordr_jn     = 2,
    meisyou1    = '更新名称１',
    meisyou2    = '更新名称２',
    value1      = '更新値１',
    value2      = '更新値２',
    record_date = now(),
    record_user = 'user002'
WHERE
    daibunrui_cd = '000001'
AND shobunrui_cd = '01';
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-26_delete_eso_m_c0001_cdmast_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0001_cdmast
WHERE
    daibunrui_cd = '000001'
AND shobunrui_cd = '01';
COMMIT;

-- ============================================
-- テストクエリ
-- ============================================

-- 全件取得
SELECT * FROM eso_m_c0001_cdmast ORDER BY daibunrui_cd, ordr_jn;

-- 大分類コードで検索
SELECT * FROM eso_m_c0001_cdmast WHERE daibunrui_cd = '000001' ORDER BY ordr_jn;

-- グループコードで検索
SELECT * FROM eso_m_c0001_cdmast WHERE group_cd = 1 ORDER BY daibunrui_cd, ordr_jn;

-- 名称で検索
SELECT * FROM eso_m_c0001_cdmast WHERE meisyou1 LIKE '%名称%' ORDER BY daibunrui_cd, ordr_jn;

