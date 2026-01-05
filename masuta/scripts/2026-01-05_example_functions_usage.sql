
-- 2026-01-05_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. 図面種別マスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-05_insert_eso_m_c0002_zumen_shubetsu_table.sql を使用してください
BEGIN;
INSERT INTO eso_m_c0002_zumen_shubetsu (
    zumen_cd,
    zumen_nm,
    create_user,
    record_user
)
VALUES (
    1,
    '図面名称１',
    'user001',
    'user001'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-05_update_eso_m_c0002_zumen_shubetsu_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0002_zumen_shubetsu
SET
    zumen_nm    = '更新図面名称',
    record_date = now(),
    record_user = 'user002'
WHERE
    zumen_cd = 1;
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-05_delete_eso_m_c0002_zumen_shubetsu_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0002_zumen_shubetsu
WHERE
    zumen_cd = 1;
COMMIT;

-- ============================================
-- 2. 設備種別マスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-05_insert_eso_m_c0003_setsubi_shubetsu_table.sql を使用してください
BEGIN;
INSERT INTO eso_m_c0003_setsubi_shubetsu (
    zumen_cd,
    zumen_nm,
    shubetsu_cd,
    shubetsu_nm,
    table_nm,
    create_user,
    record_user
)
VALUES (
    1,
    '図面名称１',
    '0001',
    '種別名称１',
    'table_name_1',
    'user001',
    'user001'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-05_update_eso_m_c0003_setsubi_shubetsu_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0003_setsubi_shubetsu
SET
    zumen_nm    = '更新図面名称',
    shubetsu_nm = '更新種別名称',
    table_nm    = '更新テーブル名称',
    record_date = now(),
    record_user = 'user002'
WHERE
    zumen_cd = 1
AND shubetsu_cd = '0001';
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-05_delete_eso_m_c0003_setsubi_shubetsu_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0003_setsubi_shubetsu
WHERE
    zumen_cd = 1
AND shubetsu_cd = '0001';
COMMIT;

-- ============================================
-- 3. 設備シンボルマスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-05_insert_eso_m_c0004_setsubi_symbol_table.sql を使用してください
BEGIN;
INSERT INTO eso_m_c0004_setsubi_symbol (
    shubetsu_cd,
    symbol_no,
    master_bunrui,
    master_cd,
    symbol_scale,
    category_cd,
    order_jn,
    text_x,
    text_y,
    text_size,
    hyokimoji1,
    hyokimoji2,
    hyokimoji3,
    symbol_muki,
    mask_flg,
    zukei_type,
    line_type,
    line_width,
    line_color,
    font,
    limit_flg1,
    upload_flg,
    biko,
    create_user,
    record_user
)
VALUES (
    '0001',
    1,
    '0000001',
    '01',
    1.0,
    1,
    1,
    0.0,
    0.0,
    10.0,
    '文字１',
    '文字２',
    '文字３',
    NULL,
    0,
    1,
    1,
    1,
    '000000',
    'Arial',
    0,
    0,
    '備考',
    'user001',
    'user001'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-05_update_eso_m_c0004_setsubi_symbol_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0004_setsubi_symbol
SET
    master_bunrui = '0000002',
    master_cd     = '02',
    symbol_scale  = 1.5,
    category_cd   = 2,
    order_jn      = 2,
    text_x        = 10.0,
    text_y        = 20.0,
    text_size     = 12.0,
    hyokimoji1    = '更新文字１',
    hyokimoji2    = '更新文字２',
    hyokimoji3    = '更新文字３',
    symbol_muki   = 1,
    mask_flg      = 1,
    zukei_type    = 2,
    line_type     = 2,
    line_width    = 2,
    line_color    = 'FFFFFF',
    font          = 'Times New Roman',
    limit_flg1    = 1,
    upload_flg    = 1,
    biko          = '更新備考',
    record_date   = now(),
    record_user   = 'user002'
WHERE
    shubetsu_cd = '0001'
AND symbol_no = 1;
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-05_delete_eso_m_c0004_setsubi_symbol_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0004_setsubi_symbol
WHERE
    shubetsu_cd = '0001'
AND symbol_no = 1;
COMMIT;

-- ============================================
-- テストクエリ
-- ============================================

-- 図面種別マスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0002_zumen_shubetsu ORDER BY zumen_cd;

-- 図面コードで検索
SELECT * FROM eso_m_c0002_zumen_shubetsu WHERE zumen_cd = 1;

-- 図面名称で検索
SELECT * FROM eso_m_c0002_zumen_shubetsu WHERE zumen_nm LIKE '%図面%' ORDER BY zumen_cd;

-- 設備種別マスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0003_setsubi_shubetsu ORDER BY zumen_cd, shubetsu_cd;

-- 図面コードで検索
SELECT * FROM eso_m_c0003_setsubi_shubetsu WHERE zumen_cd = 1 ORDER BY shubetsu_cd;

-- 種別コードで検索
SELECT * FROM eso_m_c0003_setsubi_shubetsu WHERE shubetsu_cd = '0001' ORDER BY zumen_cd;

-- 図面名称で検索
SELECT * FROM eso_m_c0003_setsubi_shubetsu WHERE zumen_nm LIKE '%図面%' ORDER BY zumen_cd, shubetsu_cd;

-- 種別名称で検索
SELECT * FROM eso_m_c0003_setsubi_shubetsu WHERE shubetsu_nm LIKE '%種別%' ORDER BY zumen_cd, shubetsu_cd;

-- 設備シンボルマスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0004_setsubi_symbol ORDER BY shubetsu_cd, order_jn;

-- 設備種別コードで検索
SELECT * FROM eso_m_c0004_setsubi_symbol WHERE shubetsu_cd = '0001' ORDER BY order_jn;

-- シンボル番号で検索
SELECT * FROM eso_m_c0004_setsubi_symbol WHERE symbol_no = 1 ORDER BY shubetsu_cd;

-- コードマスタで検索
SELECT * FROM eso_m_c0004_setsubi_symbol 
WHERE master_bunrui = '0000001' AND master_cd = '01' 
ORDER BY shubetsu_cd, order_jn;

-- カテゴリコードで検索
SELECT * FROM eso_m_c0004_setsubi_symbol WHERE category_cd = 1 ORDER BY shubetsu_cd, order_jn;

-- 表記文字で検索
SELECT * FROM eso_m_c0004_setsubi_symbol WHERE hyokimoji1 LIKE '%文字%' ORDER BY shubetsu_cd, order_jn;
