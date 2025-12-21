
-- 2025-12-23_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. 低圧リアクトルテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-23_insert_eso_t_c0020_sr_table.sql を使用してください
INSERT INTO eso_t_c0020_sr (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    genba_kakuninzumi_meibanto_flg,
    shurui_cd,
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
    '01',
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
-- 注意：実際のアプリケーションでは、queries/2025-12-23_update_eso_t_c0020_sr_table.sql を使用してください
UPDATE eso_t_c0020_sr
SET
    shinsetsu_flg                 = 1,
    genba_kakuninzumi_meibanto_flg = 0,
    shurui_cd                     = '02',
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
-- 注意：実際のアプリケーションでは、queries/2025-12-23_delete_eso_t_c0020_sr_table.sql を使用してください
UPDATE eso_t_c0020_sr
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
-- 2. 子メーターテーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-23_insert_eso_t_c0021_kometer_table.sql を使用してください
INSERT INTO eso_t_c0021_kometer (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    genba_kakuninzumi_meibanto_flg,
    kairo_nm,
    meter_shurui,
    haisen_hoshiki,
    tkaku_v,
    tkaku_v_cd,
    tkaku_a,
    tkaku_a_cd,
    meter_yuko_ym,
    meter_yuko_ym_kakuninkonnan_flg,
    ct_yuko_ym,
    ct_yuko_ym_kakuninkonnan_flg,
    seizosha_cd,
    seizosha_jiyunyuryoku,
    seizosha_kakuninkonnan_flg,
    katashiki_cd,
    katashiki_gaitonashi_flg,
    katashiki_jiyunyuryoku,
    katashiki_kakuninkonnan_flg,
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
    '回路名',
    '01',
    '01',
    '01',
    '01',
    '12',
    '12',
    '202501',
    0,
    '202501',
    0,
    '0001',
    '製造者自由入力',
    0,
    '0001',
    0,
    '型式自由入力',
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
-- 注意：実際のアプリケーションでは、queries/2025-12-23_update_eso_t_c0021_kometer_table.sql を使用してください
UPDATE eso_t_c0021_kometer
SET
    shinsetsu_flg                 = 1,
    genba_kakuninzumi_meibanto_flg = 0,
    kairo_nm                      = '更新回路名',
    meter_shurui                  = '02',
    haisen_hoshiki                = '02',
    tkaku_v                       = '02',
    tkaku_v_cd                    = '01',
    tkaku_a                       = '12',
    tkaku_a_cd                    = '12',
    meter_yuko_ym                 = '202502',
    meter_yuko_ym_kakuninkonnan_flg = 0,
    ct_yuko_ym                    = '202502',
    ct_yuko_ym_kakuninkonnan_flg  = 0,
    seizosha_cd                   = '0002',
    seizosha_jiyunyuryoku          = '更新製造者自由入力',
    seizosha_kakuninkonnan_flg    = 0,
    katashiki_cd                  = '0002',
    katashiki_gaitonashi_flg      = 0,
    katashiki_jiyunyuryoku        = '更新型式自由入力',
    katashiki_kakuninkonnan_flg   = 0,
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
-- 注意：実際のアプリケーションでは、queries/2025-12-23_delete_eso_t_c0021_kometer_table.sql を使用してください
UPDATE eso_t_c0021_kometer
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

