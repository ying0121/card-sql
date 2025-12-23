
-- 2025-12-18_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. 計器類テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-18_insert_eso_t_c0011_keiki_table.sql を使用してください
BEGIN;
INSERT INTO eso_t_c0011_keiki (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    shurui_cd,
    tkaku_v,
    tkaku_v_cd,
    tkaku_a,
    tkaku_a_cd,
    seizo_ym,
    biko,
    ordr_jn,
    create_user,
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
    99.99,  -- NUMERIC(4, 2) の最大値
    '01',
    50.00,  -- NUMERIC(4, 2) の範囲内
    '12',
    '202501',
    '備考',
    1,
    'user001',
    'user001',
    0
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-18_update_eso_t_c0011_keiki_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0011_keiki
SET
    shinsetsu_flg             = 1,
    shurui_cd                 = '02',
    tkaku_v                   = 99.99,  -- NUMERIC(4, 2) の最大値
    tkaku_v_cd                = '01',
    tkaku_a                   = 99.99,  -- NUMERIC(4, 2) の最大値
    tkaku_a_cd                = '12',
    seizo_ym                  = '202502',
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
AND daisu_renban = 1;
COMMIT;

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-18_delete_eso_t_c0011_keiki_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0011_keiki
SET
    shinki_koushin_sakujo_flg = 2,
    record_date               = now(),
    record_user               = 'user003'
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1;
COMMIT;

-- ============================================
-- 2. 低圧開閉器(低圧)テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-18_insert_eso_t_c0012_kaiheiki_table.sql を使用してください
BEGIN;
INSERT INTO eso_t_c0012_kaiheiki (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    genba_kakuninzumi_meibanto_flg,
    shurui_cd,
    kyokusu,
    tkaku_a,
    tkaku_a_cd,
    tkaku_a_kakuninkonnan_flg,
    fuse_kva,
    fuse_kva_cd,
    fuse_kva_kakuninkonnan_flg,
    kando_a,
    kando_a_cd,
    kando_a_kakuninkonnan_flg,
    seizo_ym,
    seizo_nennomi_flg,
    seizo_ym_kakuninkonnan_flg,
    ikisaki,
    biko,
    ordr_jn,
    create_user,
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
    0,
    '01',
    1,
    100.00,
    '12',
    0,
    50.00,
    '12',
    0,
    200.00,
    '11',
    0,
    '202501',
    0,
    0,
    '行先',
    '備考',
    1,
    'user001',
    'user001',
    0
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-18_update_eso_t_c0012_kaiheiki_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0012_kaiheiki
SET
    shinsetsu_flg             = 1,
    genba_kakuninzumi_meibanto_flg = 1,
    shurui_cd                 = '02',
    kyokusu                   = 2,
    tkaku_a                   = 150.00,
    tkaku_a_cd                = '12',
    tkaku_a_kakuninkonnan_flg = 0,
    fuse_kva                  = 75.00,
    fuse_kva_cd               = '12',
    fuse_kva_kakuninkonnan_flg = 0,
    kando_a                    = 250.00,
    kando_a_cd                 = '11',
    kando_a_kakuninkonnan_flg  = 0,
    seizo_ym                   = '202502',
    seizo_nennomi_flg          = 0,
    seizo_ym_kakuninkonnan_flg = 0,
    ikisaki                    = '更新行先',
    biko                       = '更新備考',
    ordr_jn                    = 1,
    record_date                = now(),
    record_user                = 'user002',
    shinki_koushin_sakujo_flg  = 1
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1;
COMMIT;

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-18_delete_eso_t_c0012_kaiheiki_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0012_kaiheiki
SET
    shinki_koushin_sakujo_flg = 2,
    record_date               = now(),
    record_user               = 'user003'
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1;
COMMIT;

-- ============================================
-- 3. 低圧ケーブル管理テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-18_insert_eso_t_c0013_cable_table.sql を使用してください
BEGIN;
INSERT INTO eso_t_c0013_cable (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    shurui_cd,
    biko,
    ordr_jn,
    create_user,
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
    'user001',
    'user001',
    0
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-18_update_eso_t_c0013_cable_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0013_cable
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
AND daisu_renban = 1;
COMMIT;

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-18_delete_eso_t_c0013_cable_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0013_cable
SET
    shinki_koushin_sakujo_flg = 2,
    record_date               = now(),
    record_user               = 'user003'
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1;
COMMIT;

