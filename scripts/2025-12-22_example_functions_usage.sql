
-- 2025-12-22_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. 低圧ヒューズテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-22_insert_eso_t_c0017_fuse_table.sql を使用してください
INSERT INTO eso_t_c0017_fuse (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    yoryo,
    yoryo_cd,
    fuse_su,
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
    9999.99,  -- NUMERIC(6, 2) の最大値
    '12',
    3,
    '備考',
    1,
    'user001',
    'user001',
    0
)
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-22_update_eso_t_c0017_fuse_table.sql を使用してください
UPDATE eso_t_c0017_fuse
SET
    shinsetsu_flg             = 1,
    yoryo                     = 9999.99,  -- NUMERIC(6, 2) の最大値
    yoryo_cd                  = '12',
    fuse_su                   = 3,
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

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-22_delete_eso_t_c0017_fuse_table.sql を使用してください
UPDATE eso_t_c0017_fuse
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

-- ============================================
-- 2. 幹線テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-22_insert_eso_t_c0018_kansen_table.sql を使用してください
INSERT INTO eso_t_c0018_kansen (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    shurui_cd,
    haisen_su,
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
    1,  -- NUMERIC(1) の最大値
    '備考',
    1,
    'user001',
    'user001',
    0
)
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-22_update_eso_t_c0018_kansen_table.sql を使用してください
UPDATE eso_t_c0018_kansen
SET
    shinsetsu_flg             = 1,
    shurui_cd                 = '02',
    haisen_su                 = 1,  -- NUMERIC(1) の最大値
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

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-22_delete_eso_t_c0018_kansen_table.sql を使用してください
UPDATE eso_t_c0018_kansen
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

-- ============================================
-- 3. 低圧コンデンサテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-22_insert_eso_t_c0019_sc_table.sql を使用してください
INSERT INTO eso_t_c0019_sc (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    genba_kakuninzumi_meibanto_flg,
    tkaku_v,
    tkaku_v_cd,
    tkaku_kva,
    tkaku_kva_cd,
    tkaku_kva_kakuninkonnan_flg,
    seizo_ym,
    seizo_nennomi_flg,
    seizo_ym_kakuninkonnan_flg,
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
    99.99,  -- NUMERIC(4, 2) の最大値
    '12',
    99.99,  -- NUMERIC(4, 2) の最大値
    '12',
    0,
    '202501',
    0,
    0,
    '備考',
    1,
    'user001',
    'user001',
    0
)
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-22_update_eso_t_c0019_sc_table.sql を使用してください
UPDATE eso_t_c0019_sc
SET
    shinsetsu_flg                 = 1,
    genba_kakuninzumi_meibanto_flg = 0,
    tkaku_v                       = 99.99,  -- NUMERIC(4, 2) の最大値
    tkaku_v_cd                    = '12',
    tkaku_kva                     = 99.99,  -- NUMERIC(4, 2) の最大値
    tkaku_kva_cd                  = '12',
    tkaku_kva_kakuninkonnan_flg   = 0,
    seizo_ym                      = '202502',
    seizo_nennomi_flg             = 0,
    seizo_ym_kakuninkonnan_flg    = 0,
    biko                          = '更新備考',
    ordr_jn                       = 1,
    record_date                   = now(),
    record_user                   = 'user002',
    shinki_koushin_sakujo_flg     = 1
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

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-22_delete_eso_t_c0019_sc_table.sql を使用してください
UPDATE eso_t_c0019_sc
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


