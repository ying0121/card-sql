
-- 2025-12-19_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. 分電盤テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-19_insert_eso_t_c0014_bundenban_table.sql を使用してください
BEGIN;
INSERT INTO eso_t_c0014_bundenban (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    shurui_cd,
    waku_nm,
    biko,
    ordr_jn,
    create_date,
    create_user,
    record_date,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    '1234567890',
    12345678,
    1,
    1,
    1,
    1,
    '01',
    '枠名',
    '備考',
    1,
    now(),
    'user001',
    now(),
    'user001',
    0
)
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-19_update_eso_t_c0014_bundenban_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0014_bundenban
SET
    shinsetsu_flg             = 1,
    shurui_cd                 = '02',
    waku_nm                   = '更新枠名',
    biko                      = '更新備考',
    ordr_jn                   = 1,
    record_date               = now(),
    record_user               = 'user002',
    shinki_koushin_sakujo_flg = 1
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;
COMMIT;

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-19_delete_eso_t_c0014_bundenban_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0014_bundenban
SET
    shinki_koushin_sakujo_flg = 2,
    record_date               = now(),
    record_user               = 'user003'
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;
COMMIT;

-- ============================================
-- 2. 計電器テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-19_insert_eso_t_c0015_keidenki_table.sql を使用してください
BEGIN;
INSERT INTO eso_t_c0015_keidenki (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    shurui_cd,
    biko,
    ordr_jn,
    create_date,
    create_user,
    record_date,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    '1234567890',
    12345678,
    1,
    1,
    1,
    1,
    '01',
    '備考',
    1,
    now(),
    'user001',
    now(),
    'user001',
    0
)
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-19_update_eso_t_c0015_keidenki_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0015_keidenki
SET
    shinsetsu_flg             = 1,
    shurui_cd                 = '02',
    biko                      = '更新備考',
    ordr_jn                   = 1,
    record_date               = now(),
    record_user               = 'user002',
    shinki_koushin_sakujo_flg = 1
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;
COMMIT;

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-19_delete_eso_t_c0015_keidenki_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0015_keidenki
SET
    shinki_koushin_sakujo_flg = 2,
    record_date               = now(),
    record_user               = 'user003'
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;
COMMIT;

-- ============================================
-- 3. 低圧変流器テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-19_insert_eso_t_c0016_ct_table.sql を使用してください
BEGIN;
INSERT INTO eso_t_c0016_ct (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    tkaku_v,
    tkaku_v_cd,
    tkaku_1ji_a,
    tkaku_1ji_a_cd,
    tkaku_2ji_a,
    tkaku_2ji_a_cd,
    kantsu_su,
    biko,
    ordr_jn,
    create_date,
    create_user,
    record_date,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    '1234567890',
    12345678,
    1,
    1,
    1,
    1,
    200.00,
    '01',
    50.00,
    '01',
    100.00,
    '12',
    2,
    '備考',
    1,
    now(),
    'user001',
    now(),
    'user001',
    0
)
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-19_update_eso_t_c0016_ct_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0016_ct
SET
    shinsetsu_flg             = 1,
    tkaku_v                   = 300.00,
    tkaku_v_cd                = '01',
    tkaku_1ji_a               = 75.00,
    tkaku_1ji_a_cd            = '01',
    tkaku_2ji_a               = 150.00,
    tkaku_2ji_a_cd            = '12',
    kantsu_su                 = 3,
    biko                      = '更新備考',
    ordr_jn                   = 1,
    record_date               = now(),
    record_user               = 'user002',
    shinki_koushin_sakujo_flg = 1
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;
COMMIT;

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-19_delete_eso_t_c0016_ct_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0016_ct
SET
    shinki_koushin_sakujo_flg = 2,
    record_date               = now(),
    record_user               = 'user003'
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;
COMMIT;

