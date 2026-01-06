
-- 2026-01-06_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. 発電所パターンマスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-06_insert_eso_m_c0005_hden_ptn_table.sql を使用してください
BEGIN;
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
    record_user
)
VALUES (
    '01',
    '01',
    '01',
    '01',
    1,
    1,
    1,
    '備考',
    now(),
    'ikou2027',
    now(),
    'ikou2027'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-06_update_eso_m_c0005_hden_ptn_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0005_hden_ptn
SET
    shiyo_keitai = '02',
    hden_shurui  = '02',
    gdo_shurui   = '02',
    hsymbol_no   = 2,
    gsymbol_no   = 2,
    psymbol_no   = 2,
    biko         = '更新備考',
    create_date  = now(),
    create_user  = 'ikou2027',
    record_date  = now(),
    record_user  = 'ikou2027'
WHERE
    yobihatsu_hden_kbn_cd = '01';
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-06_delete_eso_m_c0005_hden_ptn_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0005_hden_ptn
WHERE
    yobihatsu_hden_kbn_cd = '01';
COMMIT;

-- ============================================
-- テストクエリ
-- ============================================

-- 発電所パターンマスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0005_hden_ptn ORDER BY yobihatsu_hden_kbn_cd;

-- 予備発・発電所区分コードで検索
SELECT * FROM eso_m_c0005_hden_ptn WHERE yobihatsu_hden_kbn_cd = '01';

-- 使用形態で検索
SELECT * FROM eso_m_c0005_hden_ptn WHERE shiyo_keitai = '01' ORDER BY yobihatsu_hden_kbn_cd;

-- 発電所種類で検索
SELECT * FROM eso_m_c0005_hden_ptn WHERE hden_shurui = '01' ORDER BY yobihatsu_hden_kbn_cd;

-- 原動機種類で検索
SELECT * FROM eso_m_c0005_hden_ptn WHERE gdo_shurui = '01' ORDER BY yobihatsu_hden_kbn_cd;

-- ============================================
-- 2. カテゴリマスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-06_insert_eso_m_c0006_category_table.sql を使用してください
BEGIN;
INSERT INTO eso_m_c0006_category (
    category_cd,
    category_nm,
    zumen_cd,
    order_jn,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    1,
    'カテゴリ名称',
    1,
    1,
    now(),
    'ikou2027',
    now(),
    'ikou2027'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-06_update_eso_m_c0006_category_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0006_category
SET
    category_nm = '更新カテゴリ名称',
    zumen_cd    = 2,
    order_jn    = 2,
    create_date = now(),
    create_user = 'ikou2027',
    record_date = now(),
    record_user = 'ikou2027'
WHERE
    category_cd = 1;
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-06_delete_eso_m_c0006_category_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0006_category
WHERE
    category_cd = 1;
COMMIT;

-- カテゴリマスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0006_category ORDER BY zumen_cd, order_jn;

-- カテゴリコードで検索
SELECT * FROM eso_m_c0006_category WHERE category_cd = 1;

-- 図面種別で検索
SELECT * FROM eso_m_c0006_category WHERE zumen_cd = 1 ORDER BY order_jn;

-- カテゴリ名称で検索
SELECT * FROM eso_m_c0006_category WHERE category_nm LIKE '%カテゴリ%' ORDER BY zumen_cd, order_jn;

-- ============================================
-- 3. セットシンボルカテゴリマスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-06_insert_eso_m_c0007_ssym_category_table.sql を使用してください
BEGIN;
INSERT INTO eso_m_c0007_ssym_category (
    category1_cd,
    category2_cd,
    category3_cd,
    category_nm,
    zumen_kind,
    order_jn,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    1,
    NULL,
    NULL,
    'カテゴリ名称',
    1,
    1,
    now(),
    'ikou2027',
    now(),
    'ikou2027'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-06_update_eso_m_c0007_ssym_category_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0007_ssym_category
SET
    category_nm = '更新カテゴリ名称',
    zumen_kind  = 2,
    order_jn    = 2,
    create_date = now(),
    create_user = 'ikou2027',
    record_date = now(),
    record_user = 'ikou2027'
WHERE
    category1_cd = 1
AND category2_cd IS NULL
AND category3_cd IS NULL;
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-06_delete_eso_m_c0007_ssym_category_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0007_ssym_category
WHERE
    category1_cd = 1
AND category2_cd IS NULL
AND category3_cd IS NULL;
COMMIT;

-- セットシンボルカテゴリマスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0007_ssym_category ORDER BY zumen_kind, order_jn;

-- カテゴリコード1で検索
SELECT * FROM eso_m_c0007_ssym_category WHERE category1_cd = 1 ORDER BY zumen_kind, order_jn;

-- 図面種別で検索
SELECT * FROM eso_m_c0007_ssym_category WHERE zumen_kind = 1 ORDER BY order_jn;

-- カテゴリ名称で検索
SELECT * FROM eso_m_c0007_ssym_category WHERE category_nm LIKE '%カテゴリ%' ORDER BY zumen_kind, order_jn;

