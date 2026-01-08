
-- 2026-01-09_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. 撤去状態マスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_insert_eso_m_c0012_tekkyo_table.sql を使用してください
BEGIN;
INSERT INTO eso_m_c0012_tekkyo (
    jotai_flg,
    jotai_nm,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    1,
    '状態名称',
    now(),
    'ikou2027',
    now(),
    'ikou2027'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_update_eso_m_c0012_tekkyo_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0012_tekkyo
SET
    jotai_nm = '更新状態名称',
    create_date = now(),
    create_user = 'ikou2027',
    record_date = now(),
    record_user = 'ikou2027'
WHERE
    jotai_flg = 1;
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_delete_eso_m_c0012_tekkyo_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0012_tekkyo
WHERE
    jotai_flg = 1;
COMMIT;

-- ============================================
-- テストクエリ
-- ============================================

-- 撤去状態マスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0012_tekkyo ORDER BY jotai_flg;

-- 状態フラグで検索
SELECT * FROM eso_m_c0012_tekkyo WHERE jotai_flg = 1;

-- 状態名称で検索
SELECT * FROM eso_m_c0012_tekkyo WHERE jotai_nm LIKE '%状態%' ORDER BY jotai_flg;

-- ============================================
-- 2. 製造者マスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_insert_eso_m_c0014_seizosha_table.sql を使用してください
BEGIN;
INSERT INTO eso_m_c0014_seizosha (
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
)
VALUES (
    '000001',
    '01',
    '0001',
    '製造者名',
    'せいぞうしゃめい',
    '製者',
    now(),
    'ikou2027',
    now(),
    'ikou2027'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_update_eso_m_c0014_seizosha_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0014_seizosha
SET
    seizosha_nm = '更新製造者名',
    seizosha_kana_nm = 'こうしんせいぞうしゃめい',
    seizosha_ryaku_nm = '更製',
    create_date = now(),
    create_user = 'ikou2027',
    record_date = now(),
    record_user = 'ikou2027'
WHERE
    shubetsu_cd = '000001'
    AND shurui_cd = '01'
    AND seizosha_cd = '0001';
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_delete_eso_m_c0014_seizosha_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0014_seizosha
WHERE
    shubetsu_cd = '000001'
    AND shurui_cd = '01'
    AND seizosha_cd = '0001';
COMMIT;

-- 製造者マスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0014_seizosha ORDER BY shubetsu_cd, shurui_cd, seizosha_cd;

-- 主キーで検索
SELECT * FROM eso_m_c0014_seizosha 
WHERE shubetsu_cd = '000001' AND shurui_cd = '01' AND seizosha_cd = '0001';

-- 設備種別CDで検索
SELECT * FROM eso_m_c0014_seizosha 
WHERE shubetsu_cd = '000001' 
ORDER BY shurui_cd, seizosha_cd;

-- 製造者名で検索
SELECT * FROM eso_m_c0014_seizosha 
WHERE seizosha_nm LIKE '%製造者%' 
ORDER BY shubetsu_cd, shurui_cd, seizosha_cd;

-- ============================================
-- 3. 型式マスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_insert_eso_m_c0015_katashiki_table.sql を使用してください
BEGIN;
INSERT INTO eso_m_c0015_katashiki (
    shubetsu_cd,
    shurui_cd,
    seizosha_cd,
    katashiki_cd,
    katasiki_nm,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    '000001',
    '01',
    '0001',
    '0001',
    '型式名',
    now(),
    'ikou2027',
    now(),
    'ikou2027'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_update_eso_m_c0015_katashiki_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0015_katashiki
SET
    katasiki_nm = '更新型式名',
    create_date = now(),
    create_user = 'ikou2027',
    record_date = now(),
    record_user = 'ikou2027'
WHERE
    shubetsu_cd = '000001'
    AND shurui_cd = '01'
    AND seizosha_cd = '0001'
    AND katashiki_cd = '0001';
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_delete_eso_m_c0015_katashiki_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0015_katashiki
WHERE
    shubetsu_cd = '000001'
    AND shurui_cd = '01'
    AND seizosha_cd = '0001'
    AND katashiki_cd = '0001';
COMMIT;

-- 型式マスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0015_katashiki ORDER BY shubetsu_cd, shurui_cd, seizosha_cd, katashiki_cd;

-- 主キーで検索
SELECT * FROM eso_m_c0015_katashiki 
WHERE shubetsu_cd = '000001' AND shurui_cd = '01' AND seizosha_cd = '0001' AND katashiki_cd = '0001';

-- 設備種別CDで検索
SELECT * FROM eso_m_c0015_katashiki 
WHERE shubetsu_cd = '000001' 
ORDER BY shurui_cd, seizosha_cd, katashiki_cd;

-- 型式名で検索
SELECT * FROM eso_m_c0015_katashiki 
WHERE katasiki_nm LIKE '%型式%' 
ORDER BY shubetsu_cd, shurui_cd, seizosha_cd, katashiki_cd;

-- ============================================
-- 4. 設備管理ヘルプマスタテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_insert_eso_m_c0016_help_table.sql を使用してください
BEGIN;
INSERT INTO eso_m_c0016_help (
    help_id,
    shubetsu_cd,
    gamen_id,
    gamen_nm,
    gamen_koumoku_id,
    gamen_koumoku_nm,
    help_naiyo_mj,
    create_date,
    create_user,
    record_date,
    record_user
)
VALUES (
    '00000001',
    '0001',
    'gamen001',
    '画面名',
    'koumoku001',
    '画面項目名',
    'ヘルプ内容',
    now(),
    'ikou2027',
    now(),
    'ikou2027'
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_update_eso_m_c0016_help_table.sql を使用してください
BEGIN;
UPDATE eso_m_c0016_help
SET
    shubetsu_cd = '0001',
    gamen_id = 'gamen001',
    gamen_nm = '更新画面名',
    gamen_koumoku_id = 'koumoku001',
    gamen_koumoku_nm = '更新画面項目名',
    help_naiyo_mj = '更新ヘルプ内容',
    create_date = now(),
    create_user = 'ikou2027',
    record_date = now(),
    record_user = 'ikou2027'
WHERE
    help_id = '00000001';
COMMIT;

-- DELETE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2026-01-09_delete_eso_m_c0016_help_table.sql を使用してください
BEGIN;
DELETE FROM eso_m_c0016_help
WHERE
    help_id = '00000001';
COMMIT;

-- 設備管理ヘルプマスタテーブル
-- 全件取得
SELECT * FROM eso_m_c0016_help ORDER BY help_id;

-- ヘルプIDで検索
SELECT * FROM eso_m_c0016_help WHERE help_id = '00000001';

-- 設備種別コードで検索
SELECT * FROM eso_m_c0016_help 
WHERE shubetsu_cd = '0001' 
ORDER BY help_id;

-- 画面IDで検索
SELECT * FROM eso_m_c0016_help 
WHERE gamen_id = 'gamen001' 
ORDER BY help_id;
